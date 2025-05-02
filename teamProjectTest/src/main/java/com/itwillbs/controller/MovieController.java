package com.itwillbs.controller;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.itwillbs.domain.MovieDTO;
import com.itwillbs.service.MovieService;

@Controller
@RequestMapping("/movie")
public class MovieController {

    @Autowired
    private MovieService movieService;

    @GetMapping("/save")
    public String saveMovies() {
    	System.out.println("MovieController saveMovies()");
        String today = LocalDate.now().format(DateTimeFormatter.ofPattern("yyyyMMdd"));
        movieService.insertMoviesFromAPI(today);
        return "redirect:/movie/main";
    }

    @GetMapping("/main")
    public String showMovies(Model model) {
    	System.out.println("MovieController showMovies()");
        List<MovieDTO> movies = movieService.getMovieList();
        model.addAttribute("movies", movies);
        return "movie/main";
    }
}
