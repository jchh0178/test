package com.itwillbs.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.domain.ReviewDTO;
import com.itwillbs.mapper.ReviewMapper;

@Service
public class ReviewService {

	@Autowired
	private ReviewMapper reviewMapper;

	public void insertReview(ReviewDTO reviewDTO) {
		reviewMapper.insertReview(reviewDTO);
	}

	public int deleteReview(int reviewId) {
		return reviewMapper.deleteReview(reviewId);
	}

//	public void updateReview(ReviewDTO review) {
//		reviewMapper.updateReview(review);
//	}
	
	public void updateReviewContent(int id, String content) {
	    ReviewDTO dto = new ReviewDTO();
	    dto.setReviewId(id);
	    dto.setReviewContent(content);
	    reviewMapper.updateReviewContent(dto);
	}

	public List<ReviewDTO> getReviewsByMovieId(int movieId) {
		return reviewMapper.getReviewsByMovieId(movieId);
	}
}

//================================= 오픈 api 추가된 코딩 ======================================================
//package com.itwillbs.service;
//
//import java.io.*;
//import java.net.HttpURLConnection;
//import java.net.URL;
//import java.util.List;
//
//import org.json.simple.JSONObject;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Service;
//
//import com.itwillbs.domain.ReviewDTO;
//import com.itwillbs.mapper.ReviewMapper;
//
//@Service
//public class ReviewService {
//
//    @Autowired
//    private ReviewMapper reviewMapper;
//
//    /** 리뷰 등록 시 감정 분석 결과도 포함해서 저장 */
//public void insertReview(ReviewDTO review) {
//    String content = review.getReviewContent();
//
//    try {
//        String sentiment = analyzeSentimentWithOpenAI(content);
//        review.setReviewSelect("positive".equals(sentiment) ? 1 : 0);
//    } catch (Exception e) {
//        review.setReviewSelect(0); // 예외 발생시 부정 처리
//    }
//
//    reviewMapper.insertReview(review);
//}
//
//// 감정 분석 함수
//private String analyzeSentimentWithOpenAI(String content) throws IOException {
//    OkHttpClient client = new OkHttpClient();
//    MediaType mediaType = MediaType.parse("application/json");
//
//    JSONObject prompt = new JSONObject();
//    prompt.put("model", "gpt-3.5-turbo");
//    JSONArray messages = new JSONArray();
//    JSONObject message = new JSONObject();
//    message.put("role", "user");
//    message.put("content", "다음 문장이 긍정적인지 부정적인지 판별해줘. '긍정' 또는 '부정'으로만 답해: " + content);
//    messages.put(message);
//    prompt.put("messages", messages);
//
//    RequestBody body = RequestBody.create(prompt.toString(), mediaType);
//    Request request = new Request.Builder()
//        .url("https://api.openai.com/v1/chat/completions")
//        .post(body)
//        .addHeader("Authorization", "Bearer YOUR_API_KEY")
//        .addHeader("Content-Type", "application/json")
//        .build();
//
//    Response response = client.newCall(request).execute();
//    String responseBody = response.body().string();
//
//    JSONObject json = new JSONObject(responseBody);
//    String reply = json.getJSONArray("choices").getJSONObject(0)
//                     .getJSONObject("message").getString("content").trim();
//
//    return reply.contains("긍정") ? "positive" : "negative";
//}
//
//    public void deleteReview(int reviewId) {
//        reviewMapper.deleteReview(reviewId);
//    }
//
//    public void updateReview(ReviewDTO review) {
//        reviewMapper.updateReview(review);
//    }
//
//    public List<ReviewDTO> getReviewsByMovieId(int movieId) {
//        return reviewMapper.getReviewsByMovieId(movieId);
//    }
//
//    /** GPT API를 호출하여 감정 분석 */
//    private String analyzeSentimentWithGPT(String content) throws IOException {
//        String apiKey = "sk-..." ; // 본인의 OpenAI API 키 입력
//        URL url = new URL("https://api.openai.com/v1/chat/completions");
//        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
//        conn.setRequestMethod("POST");
//        conn.setRequestProperty("Authorization", "Bearer " + apiKey);
//        conn.setRequestProperty("Content-Type", "application/json");
//        conn.setDoOutput(true);
//
//        // 요청 본문 구성
//        JSONObject message = new JSONObject();
//        message.put("role", "user");
//        message.put("content", "다음 리뷰가 긍정인지 부정인지 판별해줘. '긍정' 또는 '부정'만 대답해: " + content);
//
//        JSONObject body = new JSONObject();
//        body.put("model", "gpt-3.5-turbo");
//        body.put("messages", new JSONArray().put(message));
//        body.put("max_tokens", 10);
//
//        try (OutputStream os = conn.getOutputStream()) {
//            os.write(body.toString().getBytes());
//        }
//
//        // 응답 받기
//        StringBuilder response = new StringBuilder();
//        try (BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()))) {
//            String line;
//            while ((line = br.readLine()) != null) {
//                response.append(line);
//            }
//        }
//
//        JSONObject json = new JSONObject(response.toString());
//        String reply = json.getJSONArray("choices").getJSONObject(0).getJSONObject("message").getString("content");
//
//        return reply.trim().contains("긍정") ? "positive" : "negative";
//    }
//}
