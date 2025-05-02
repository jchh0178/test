package com.itwillbs.service;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.net.URL;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.util.UriComponentsBuilder;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.itwillbs.domain.Movie;
import com.itwillbs.domain.MovieDTO;
import com.itwillbs.domain.MovieDTO.BoxOfficeResponse;
import com.itwillbs.mapper.MovieMapper;

@Service
public class MovieService {

    private final String KOBIS_API_KEY = "ec2a6f2289307037c841a7058c7ef545";
    private final String KOBIS_BOXOFFICE_URL = "http://www.kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json";
    private final String KOBIS_MOVIEINFO_URL = "http://www.kobis.or.kr/kobisopenapi/webservice/rest/movie/searchMovieInfo.json";

    private final String TMDB_API_KEY = "1bc367920d0e2dd5917e50e9f9e75923";
    private final String TMDB_SEARCH_URL = "https://api.themoviedb.org/3/search/movie";

    @Autowired
    private MovieMapper movieMapper;

    private final String posterSavePath = "C:/Users/ITWILL/git/test/teamProjectTest/src/main/webapp/resources/images"; // 실제 절대 경로로 수정 필요

    public BoxOfficeResponse getBoxOffice(String targetDate) {
        try {
            RestTemplate restTemplate = new RestTemplate();
            String fullUrl = KOBIS_BOXOFFICE_URL + "?key=" + KOBIS_API_KEY + "&targetDt=" + targetDate;
            String json = restTemplate.getForObject(fullUrl, String.class);

            ObjectMapper mapper = new ObjectMapper();
            return mapper.readValue(json, BoxOfficeResponse.class);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public String getPosterUrlFromTMDB(String movieName) {
        try {
            RestTemplate restTemplate = new RestTemplate();
            String url = UriComponentsBuilder.fromHttpUrl(TMDB_SEARCH_URL)
                    .queryParam("api_key", TMDB_API_KEY)
                    .queryParam("query", movieName)
                    .toUriString();
            String json = restTemplate.getForObject(url, String.class);

            ObjectMapper mapper = new ObjectMapper();
            JsonNode root = mapper.readTree(json);
            JsonNode results = root.path("results");

            if (results.isArray() && results.size() > 0) {
                JsonNode firstResult = results.get(0);
                String posterPath = firstResult.path("poster_path").asText();
                if (posterPath != null && !posterPath.equals("null")) {
                    return "https://image.tmdb.org/t/p/w500" + posterPath;
                }
            }
            return null;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public String downloadPosterImage(String imageUrl, String movieTitle) {
        try {
            if (imageUrl == null || imageUrl.isEmpty()) return null;

            String filename = movieTitle.replaceAll("[^a-zA-Z0-9]", "_") + ".jpg";
            File file = new File(posterSavePath + filename);

            if (!file.exists()) {
                try (InputStream in = new URL(imageUrl).openStream();
                     FileOutputStream out = new FileOutputStream(file)) {
                    byte[] buffer = new byte[4096];
                    int bytesRead;
                    while ((bytesRead = in.read(buffer)) != -1) {
                        out.write(buffer, 0, bytesRead);
                    }
                }
            }

            return "/resources/images/" + filename;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public MovieDTO.MovieDetail getMovieDetail(String movieCd) {
        try {
            RestTemplate restTemplate = new RestTemplate();
            String url = KOBIS_MOVIEINFO_URL + "?key=" + KOBIS_API_KEY + "&movieCd=" + movieCd;
            String json = restTemplate.getForObject(url, String.class);

            ObjectMapper mapper = new ObjectMapper();
            JsonNode root = mapper.readTree(json);
            JsonNode movieInfo = root.path("movieInfoResult").path("movieInfo");

            MovieDTO.MovieDetail detail = new MovieDTO.MovieDetail();
            detail.setDirector(movieInfo.path("directors").get(0).path("peopleNm").asText(""));
            detail.setGenre(movieInfo.path("genres").get(0).path("genreNm").asText(""));
            detail.setRuntime(movieInfo.path("showTm").asText(""));
            detail.setGrade(movieInfo.path("audits").get(0).path("watchGradeNm").asText(""));
            return detail;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public void saveBoxOfficeToDB(String targetDate) {
        BoxOfficeResponse response = getBoxOffice(targetDate);
        if (response != null && response.getBoxOfficeResult() != null) {
            List<MovieDTO.MovieBoxOffice> movies = response.getBoxOfficeResult().getDailyBoxOfficeList();

            for (MovieDTO.MovieBoxOffice movie : movies) {
                String posterUrl = getPosterUrlFromTMDB(movie.getMovieNm());
                String savedPosterPath = downloadPosterImage(posterUrl, movie.getMovieNm());
                movie.setPosterUrl(savedPosterPath);

                MovieDTO.MovieDetail detail = getMovieDetail(movie.getMovieCd());
                if (detail != null) {
                    movie.setDirector(detail.getDirector());
                    movie.setGenre(detail.getGenre());
                    movie.setRuntime(detail.getRuntime());
                    movie.setGrade(detail.getGrade());
                }

                Movie m = new Movie();
                m.setMovie_name_kr(movie.getMovieNm());
                m.setMovie_open_date(movie.getOpenDt());
                m.setMovie_poster(savedPosterPath);
                m.setMovie_director(movie.getDirector());
                m.setMovie_genre(movie.getGenre());
                m.setMovie_runtime(parseRuntime(detail.getRuntime()));
                m.setMovie_grade(movie.getGrade());
                m.setMovie_fav(0);
//                m.setMovie_name_en(null);
//                m.setMovie_cast(null);
//                m.setMovie_context(null);
//                m.setMovie_close_date(null);
//                m.setMovie_photo(null);
//                m.setMovie_booth_rate(null);

                movieMapper.insertMovie(m);
            }
        }
    }

    private int parseRuntime(String runtimeStr) {
        try {
            return Integer.parseInt(runtimeStr.trim());
        } catch (Exception e) {
            return 0;
        }
    }

    public List<Movie> getAllMovies() {
        return movieMapper.selectAllMovies();
    }
}
