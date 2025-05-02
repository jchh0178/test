package com.itwillbs.domain;

import lombok.Getter;
import lombok.Setter;

public class Movie {
    private int movie_id;
    private String movie_name_kr;
    private String movie_open_date;
    private String movie_poster;
    private String movie_director;
    private String movie_genre;
    private int movie_runtime;
    private String movie_grade;
    private int movie_fav;
    
	public int getMovie_id() {
		return movie_id;
	}
	public void setMovie_id(int movie_id) {
		this.movie_id = movie_id;
	}
	public String getMovie_name_kr() {
		return movie_name_kr;
	}
	public void setMovie_name_kr(String movie_name_kr) {
		this.movie_name_kr = movie_name_kr;
	}
	public String getMovie_open_date() {
		return movie_open_date;
	}
	public void setMovie_open_date(String movie_open_date) {
		this.movie_open_date = movie_open_date;
	}
	public String getMovie_poster() {
		return movie_poster;
	}
	public void setMovie_poster(String movie_poster) {
		this.movie_poster = movie_poster;
	}
	public String getMovie_director() {
		return movie_director;
	}
	public void setMovie_director(String movie_director) {
		this.movie_director = movie_director;
	}
	public String getMovie_genre() {
		return movie_genre;
	}
	public void setMovie_genre(String movie_genre) {
		this.movie_genre = movie_genre;
	}
	public int getMovie_runtime() {
		return movie_runtime;
	}
	public void setMovie_runtime(int i) {
		this.movie_runtime = i;
	}
	public String getMovie_grade() {
		return movie_grade;
	}
	public void setMovie_grade(String movie_grade) {
		this.movie_grade = movie_grade;
	}
	public int getMovie_fav() {
		return movie_fav;
	}
	public void setMovie_fav(int movie_fav) {
		this.movie_fav = movie_fav;
	}
    
    
}