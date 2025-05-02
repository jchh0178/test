package com.itwillbs.domain;

import java.util.List;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class MovieDTO {

    @JsonIgnoreProperties(ignoreUnknown = true)
    public static class MovieBoxOffice {
        private String movieCd;
        private String rank;
        private String movieNm;
        private String openDt;
        private String audiAcc;
        private String posterUrl;
        private String director;
        private String genre;
        private String runtime;
        private String grade;
        
     // Getter & Setter 생략 (필요시 추가)
		public String getMovieCd() {
			return movieCd;
		}
		public void setMovieCd(String movieCd) {
			this.movieCd = movieCd;
		}
		public String getRank() {
			return rank;
		}
		public void setRank(String rank) {
			this.rank = rank;
		}
		public String getMovieNm() {
			return movieNm;
		}
		public void setMovieNm(String movieNm) {
			this.movieNm = movieNm;
		}
		public String getOpenDt() {
			return openDt;
		}
		public void setOpenDt(String openDt) {
			this.openDt = openDt;
		}
		public String getAudiAcc() {
			return audiAcc;
		}
		public void setAudiAcc(String audiAcc) {
			this.audiAcc = audiAcc;
		}
		public String getPosterUrl() {
			return posterUrl;
		}
		public void setPosterUrl(String posterUrl) {
			this.posterUrl = posterUrl;
		}
		public String getDirector() {
			return director;
		}
		public void setDirector(String director) {
			this.director = director;
		}
		public String getGenre() {
			return genre;
		}
		public void setGenre(String genre) {
			this.genre = genre;
		}
		public String getRuntime() {
			return runtime;
		}
		public void setRuntime(String runtime) {
			this.runtime = runtime;
		}
		public String getGrade() {
			return grade;
		}
		public void setGrade(String grade) {
			this.grade = grade;
		}

    }

    @JsonIgnoreProperties(ignoreUnknown = true)
    public static class BoxOfficeResult {
        private List<MovieBoxOffice> dailyBoxOfficeList;
        // Getter & Setter

		public List<MovieBoxOffice> getDailyBoxOfficeList() {
			return dailyBoxOfficeList;
		}

		public void setDailyBoxOfficeList(List<MovieBoxOffice> dailyBoxOfficeList) {
			this.dailyBoxOfficeList = dailyBoxOfficeList;
		}
        
    }

    @JsonIgnoreProperties(ignoreUnknown = true)
    public static class BoxOfficeResponse {
        private BoxOfficeResult boxOfficeResult;
        // Getter & Setter

		public BoxOfficeResult getBoxOfficeResult() {
			return boxOfficeResult;
		}

		public void setBoxOfficeResult(BoxOfficeResult boxOfficeResult) {
			this.boxOfficeResult = boxOfficeResult;
		}
        
    }

    public static class MovieDetail {
        private String director;
        private String genre;
        private String runtime;
        private String grade;
        // Getter & Setter
		public String getDirector() {
			return director;
		}
		public void setDirector(String director) {
			this.director = director;
		}
		public String getGenre() {
			return genre;
		}
		public void setGenre(String genre) {
			this.genre = genre;
		}
		public String getRuntime() {
			return runtime;
		}
		public void setRuntime(String runtime) {
			this.runtime = runtime;
		}
		public String getGrade() {
			return grade;
		}
		public void setGrade(String grade) {
			this.grade = grade;
		}
		
    }
}