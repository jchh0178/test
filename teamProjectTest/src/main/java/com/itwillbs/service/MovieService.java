package com.itwillbs.service;

import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.itwillbs.domain.MovieDTO;
import com.itwillbs.domain.PageDTO;
import com.itwillbs.mapper.MovieMapper;

@Service
public class MovieService {

    @Inject
    private MovieMapper movieMapper;

    private final String KOBIS_API_KEY = "ec2a6f2289307037c841a7058c7ef545";
    private final String TMDB_API_KEY = "1bc367920d0e2dd5917e50e9f9e75923";

    public void insertMoviesFromAPI(String date) {
    	System.out.println("MovieService insertMoviesFromAPI()");
        List<MovieDTO> movies = getBoxOffice(date);
        
        for (MovieDTO movie : movies) {
        	String posterUrl = getPosterUrlFromTMDB(movie.getMovieNm());
        	if (posterUrl != null && posterUrl.startsWith("http")) {
        	    movie.setPosterUrl(posterUrl);
        	} else {
        	    movie.setPosterUrl(null); // 기본 이미지 저장 안 함
        	}
            
            // 🎯 영화 상세정보 API 호출
            try {
            	String url = "http://www.kobis.or.kr/kobisopenapi/webservice/rest/movie/searchMovieInfo.json"
	                           + "?key=" + KOBIS_API_KEY + "&movieCd=" + movie.getMovieCd();
            	RestTemplate restTemplate = new RestTemplate();
            	String json = restTemplate.getForObject(url, String.class);
	
            	ObjectMapper mapper = new ObjectMapper();
            	JsonNode info = mapper.readTree(json).path("movieInfoResult").path("movieInfo");
	
            	movie.setMovieNmEn(info.path("movieNmEn").asText());
            	movie.setPrdtYear(info.path("prdtYear").asText());
	
            	// 제작국가
            	JsonNode nations = info.path("nations");
            	if (nations.size() > 0) {
            		movie.setNationNm(nations.get(0).path("nationNm").asText());
            	}
	
            	// 장르
            	JsonNode genres = info.path("genres");
            	if (genres.size() > 0) {
            		movie.setGenreNm(genres.get(0).path("genreNm").asText());
            	}	
	
            	// 감독
            	JsonNode directors = info.path("directors");
            	StringBuilder directorNames = new StringBuilder();
            	for (JsonNode dir : directors) {
            		directorNames.append(dir.path("peopleNm").asText()).append(", ");
            	}
            	movie.setDirectors(directorNames.toString().replaceAll(", $", ""));
	
            	// 배우 및 배역
            	JsonNode actors = info.path("actors");
            	StringBuilder actorNames = new StringBuilder();
            	StringBuilder roles = new StringBuilder();
            	for (JsonNode actor : actors) {
            		actorNames.append(actor.path("peopleNm").asText()).append(", ");
            		roles.append(actor.path("cast").asText()).append(", ");
            	}
            	movie.setActors(actorNames.toString().replaceAll(", $", ""));
            	
            	// 상영 시간
            	movie.setShowTm(info.path("showTm").asText());
            	
            	// 상영형태
            	JsonNode showTypes = info.path("showTypes");
            	if (showTypes.size() > 0) {
            		movie.setShowType(showTypes.get(0).path("showTypeNm").asText());
            	}
	
            	// 관람등급 (심의)
            	JsonNode audits = info.path("audits");
            	if (audits.size() > 0) {
            		movie.setWatchGradeNm(audits.get(0).path("watchGradeNm").asText());
            	}
	
            } catch (Exception e) {
            	System.out.println("상세정보 API 오류: " + movie.getMovieNm());
            	e.printStackTrace();
            }
	         
            movieMapper.insertMoviesFromAPI(movie);
       }
    }

//    public void insertMovie(MovieDTO movie) {
//    	System.out.println("MovieService insertMovie()");
//        if (movieMapper.isMovieExists(movie.getMovieCd()) == 0) {
//            movieMapper.insertMovie(movie);
//        }
//    }

    public List<MovieDTO> getMovieList(PageDTO pageDTO) {
    	System.out.println("MovieService getMovieList()");
    	// 시작하는 행번호
    	int startRow = (pageDTO.getCurrentPage() - 1) * pageDTO.getPageSize() + 1;
    		
    	// 끝나는 행번호 
    	int endRow = startRow + pageDTO.getPageSize() - 1;
    			
    	// limit #{startRow - 1}, #{pageSize}
    	pageDTO.setStartRow(startRow - 1);
    	pageDTO.setEndRow(endRow);
    	
        return movieMapper.getMovieList(pageDTO);
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
                movie.setRank(Integer.parseInt(node.get("rank").asText()));
                movies.add(movie);
            }
            
            System.out.println("받은 영화 수: " + movies.size());

            return movies;
        } catch (Exception e) {
        	System.out.println("박스오피스 api 가져오기 오류");
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
        	System.out.println("영화 포스터 api 가져오기 오류");
            e.printStackTrace();
        }
        return "/resources/images/no-image.png";
    }

	public int countMovie() {
		System.out.println("MovieService countProgram()");
		
		return movieMapper.countMovie();
	}

	public MovieDTO getMovieDetail(String movieCd) {
		System.out.println("MovieService getMovieDetail()");
		
		return movieMapper.getMovieDetail(movieCd);
	}
	
	public MovieDTO getMovieFromTMDB(String title) {
		if (title == null || title.trim().isEmpty()) {
	        System.out.println("❌ 영화 제목(title)이 null이거나 빈 문자열입니다");
	        return null;
	    }
		
        try {
            RestTemplate restTemplate = new RestTemplate();
            ObjectMapper mapper = new ObjectMapper();

            String searchUrl = "https://api.themoviedb.org/3/search/movie"
                + "?api_key=" + TMDB_API_KEY
                + "&query=" + URLEncoder.encode(title, "UTF-8")
                + "&language=ko-KR";
            String searchJson = restTemplate.getForObject(searchUrl, String.class);
            JsonNode result = mapper.readTree(searchJson).path("results").get(0);
            
            int movieId = result.path("id").asInt();
            String detailUrl = "https://api.themoviedb.org/3/movie/" + movieId
                + "?api_key=" + TMDB_API_KEY + "&language=ko-KR";
            String creditsUrl = "https://api.themoviedb.org/3/movie/" + movieId + "/credits"
                + "?api_key=" + TMDB_API_KEY + "&language=ko-KR";

            JsonNode detail = mapper.readTree(restTemplate.getForObject(detailUrl, String.class));
            JsonNode credits = mapper.readTree(restTemplate.getForObject(creditsUrl, String.class));

            MovieDTO dto = new MovieDTO();
            dto.setMovieCd(detail.path("imdb_id").asText()); // imdb_id → movieCd에 저장
            dto.setMovieNm(result.path("title").asText());
            dto.setMovieNmEn(result.path("original_title").asText());
            dto.setOpenDt(result.path("release_date").asText());
            dto.setSummary(result.path("overview").asText());
            dto.setPosterUrl("https://image.tmdb.org/t/p/w500" + result.path("poster_path").asText());
            dto.setShowTm(detail.path("runtime").asText());
            dto.setGenreNm(detail.path("genres").findValuesAsText("name").toString());
            dto.setNationNm(detail.path("production_countries").findValuesAsText("name").toString());

            StringBuilder directors = new StringBuilder();
            for (JsonNode crew : credits.path("crew")) {
                if ("Director".equals(crew.path("job").asText())) {
                    directors.append(crew.path("name").asText()).append(", ");
                }
            }
            dto.setDirectors(directors.toString().replaceAll(", $", ""));

            StringBuilder actors = new StringBuilder();
            for (int i = 0; i < Math.min(5, credits.path("cast").size()); i++) {
                actors.append(credits.path("cast").get(i).path("name").asText()).append(", ");
            }
            dto.setActors(actors.toString().replaceAll(", $", ""));

            return dto;

        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
	
	public void insertMovie(MovieDTO dto) {
	    movieMapper.insertMovie(dto);
	}

}
