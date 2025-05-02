package com.itwillbs.mapper;

import java.util.List;
import com.itwillbs.domain.MovieDTO;

public interface MovieMapper {
    void insertMovie(MovieDTO movie);
    int isMovieExists(String movieCd);
    List<MovieDTO> getMovieList();
}