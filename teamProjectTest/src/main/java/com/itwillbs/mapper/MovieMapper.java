package com.itwillbs.mapper;

import java.util.List;
import com.itwillbs.domain.Movie;

public interface MovieMapper {
	 void insertMovie(Movie movie);
	 List<Movie> selectAllMovies();
}
