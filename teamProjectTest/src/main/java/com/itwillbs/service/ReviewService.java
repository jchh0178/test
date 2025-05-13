package com.itwillbs.service;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.domain.ReviewDTO;
import com.itwillbs.mapper.ReviewMapper;

@Service
public class ReviewService {

	@Autowired
	private ReviewMapper reviewMapper;

    @Autowired
    private OpenAiService openAiService;

	public void insertReview(ReviewDTO reviewDTO){
		System.out.println("insertReview service() " +reviewDTO );
        // 감정 분석 결과 저장
        String sentiment = openAiService.analyzeSentiment(reviewDTO.getReviewContent());
        reviewDTO.setSentiment(sentiment); // DTO에 sentiment 필드 추가해야 함
		System.out.println("insertReview service() " +reviewDTO );
		reviewMapper.insertReview(reviewDTO);
		
		// 차트 생성
	    try {
	        String pythonExe = "C:\\Users\\admin\\AppData\\Local\\Programs\\Python\\Python313\\python.exe"; 
	        String scriptPath = "C:\\Users\\admin\\git\\test1\\teamProjectTest\\src\\main\\webapp\\resources\\py_chart\\chart.py";

	        ProcessBuilder pb = new ProcessBuilder(pythonExe, scriptPath, String.valueOf(reviewDTO.getMovieId()));
	        pb.redirectErrorStream(true);
	        Process process = pb.start();

	        BufferedReader reader = new BufferedReader(new InputStreamReader(process.getInputStream()));
	        String line;
	        while ((line = reader.readLine()) != null) {
	            System.out.println("[PYTHON] " + line);
	        }

	        int exitCode = process.waitFor();
	        if (exitCode != 0) {
	            System.err.println("파이차트 생성 실패");
	        }
	    } catch (Exception e) {
	        System.err.println("차트 실행 중 오류");
	        e.printStackTrace();
	    }
	}

	public int deleteReview(int reviewId) {
		return reviewMapper.deleteReview(reviewId);
	}

	public void updateReview(int reviewId, String content) {
	    String sentiment;
	    try {
	        sentiment = openAiService.analyzeSentiment(content);
	    } catch (Exception e) {
	        e.printStackTrace();
	        sentiment = "error";
	    }

	    ReviewDTO reviewDTO = new ReviewDTO();
	    reviewDTO.setReviewId(reviewId);
	    reviewDTO.setReviewContent(content);
	    reviewDTO.setSentiment(sentiment);

	    reviewMapper.updateReview(reviewDTO);
	}


	public List<ReviewDTO> getReviewsByMovieId(int movieId) {
		return reviewMapper.getReviewsByMovieId(movieId);
	}

}

