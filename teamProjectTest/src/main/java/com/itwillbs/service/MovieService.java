package com.itwillbs.service;

import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.itwillbs.domain.MovieDTO;
import com.itwillbs.mapper.MovieMapper;

@Service
public class MovieService {

    @Autowired
    private MovieMapper movieMapper;

    private final String KOBIS_API_KEY = "your_kobis_api_key";
    private final String TMDB_API_KEY = "your_tmdb_api_key";

    public void insertMoviesFromAPI(String date) {
    	System.out.println("MovieService insertMoviesFromAPI()");
        List<MovieDTO> movies = getBoxOffice(date);
        for (MovieDTO movie : movies) {
            String posterUrl = getPosterUrlFromTMDB(movie.getMovieNm());
            movie.setPosterUrl(posterUrl);
            insertMovie(movie);
        }
    }

    public void insertMovie(MovieDTO movie) {
    	System.out.println("MovieService insertMovie()");
        if (movieMapper.isMovieExists(movie.getMovieCd()) == 0) {
            movieMapper.insertMovie(movie);
        }
    }

    public List<MovieDTO> getMovieList() {
    	System.out.println("MovieService getMovieList()");
        return movieMapper.getMovieList();
    }

    public List<MovieDTO> getBoxOffice(String targetDate) {
    	System.out.println("MovieService getBoxOffice()");
        try {
            String url = "http://www.kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json"
                       + "?key=" + KOBIS_API_KEY + "&targetDt=" + targetDate;

            RestTemplate restTemplate = new RestTemplate();
            String json = restTemplate.getForObject(url, String.class);

            ObjectMapper mapper = new ObjectMapper();
            JsonNode boxOfficeList = mapper.readTree(json)
                                           .path("boxOfficeResult").path("dailyBoxOfficeList");

            List<MovieDTO> movies = new ArrayList<>();
            for (JsonNode node : boxOfficeList) {
                MovieDTO movie = new MovieDTO();
                movie.setMovieCd(node.get("movieCd").asText());
                movie.setMovieNm(node.get("movieNm").asText());
                movie.setOpenDt(node.get("openDt").asText());
                movie.setMovieRank(Integer.parseInt(node.get("rank").asText()));
                movies.add(movie);
            }

            return movies;
        } catch (Exception e) {
            e.printStackTrace();
            return new ArrayList<>();
        }
    }

    public String getPosterUrlFromTMDB(String movieName) {
    	System.out.println("MovieService getPosterUrlFromTMDB()");
        try {
            String encodedQuery = URLEncoder.encode(movieName, "UTF-8");
            String url = "https://api.themoviedb.org/3/search/movie?api_key=" + TMDB_API_KEY + "&query=" + encodedQuery;

            RestTemplate restTemplate = new RestTemplate();
            String response = restTemplate.getForObject(url, String.class);

            ObjectMapper mapper = new ObjectMapper();
            JsonNode results = mapper.readTree(response).path("results");

            if (results.isArray() && results.size() > 0) {
                String posterPath = results.get(0).path("poster_path").asText();
                return (posterPath != null && !posterPath.isEmpty())
                    ? "https://image.tmdb.org/t/p/w500" + posterPath
                    : "/resources/images/no-image.png";
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "/resources/images/no-image.png";
    }
}
