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

	public void insertReview(ReviewDTO reviewDTO) throws Exception {
        // ✅ 감정 분석 결과 저장
        String sentiment = openAiService.analyzeSentiment(reviewDTO.getReviewContent());
        reviewDTO.setSentiment(sentiment); // DTO에 sentiment 필드 추가해야 함
		reviewMapper.insertReview(reviewDTO);
		try {
		    // 전체 차트를 갱신할 경우
//		    ProcessBuilder pb = new ProcessBuilder("python", "C:\\Users\\admin\\git\\test1\\teamProjectTest\\src\\main\\webapp\\resources\\py_chart\\chart.py");

		    // 만약 특정 movieId만 갱신하고 싶으면 아래처럼 인자 전달
		     ProcessBuilder pb = new ProcessBuilder("python", "C:\\Users\\admin\\git\\test1\\teamProjectTest\\src\\main\\webapp\\resources\\py_chart\\chart.py", String.valueOf(reviewDTO.getMovieId()));

		    pb.redirectErrorStream(true);
		    Process process = pb.start();

		    BufferedReader reader = new BufferedReader(new InputStreamReader(process.getInputStream()));
		    String line;
		    while ((line = reader.readLine()) != null) {
		        System.out.println("[PYTHON] " + line);
		    }

		    process.waitFor();
		} catch (Exception e) {
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

