package com.itwillbs.mapper;

import java.util.List;

import com.itwillbs.domain.MovieDTO;
import com.itwillbs.domain.PageDTO;

public interface MovieMapper {
	MovieDTO getMovieById(int movieId);
    int isMovieExists(String movieCd);
    List<MovieDTO> getMovieList(PageDTO pageDTO);
	void insertMoviesFromAPI(MovieDTO movie);
	int countMovie();
	MovieDTO getMovieDetail(String movieCd);
	void insertMovie(MovieDTO dto);
}