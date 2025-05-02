package com.itwillbs.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;

@Service
public class ReviewService {

    @Autowired
    private ReviewDAO reviewDAO;

    public void saveReview(Review review) {
        reviewDAO.saveReview(review);
    }

    public List<Review> getReviews(String movieTitle) {
        return reviewDAO.getReviewsByMovie(movieTitle);
    }

    public void deleteReview(int id) {
        reviewDAO.deleteReview(id);
    }

    public void updateReview(int id, String newComment) {
        reviewDAO.updateReview(id, newComment);
    }
    
    public void saveReview(Review review) {
        // 1. 감정 분석 수행
        String sentiment = analyzeSentiment(review.getComment());
        review.setSentiment(sentiment);

        // 2. DB에 저장
        reviewDAO.insertReview(review);
    }

    private String analyzeSentiment(String text) {
        try {
            URL url = new URL("https://api.openai.com/v1/chat/completions");
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("POST");
            conn.setRequestProperty("Authorization", "Bearer YOUR_API_KEY");
            conn.setRequestProperty("Content-Type", "application/json");
            conn.setDoOutput(true);

            String prompt = "이 문장이 긍정인지 부정인지 '긍정' 또는 '부정'으로만 답해줘: \"" + text + "\"";

            String json = """
            {
                "model": "gpt-3.5-turbo",
                "messages": [
                    {"role": "user", "content": "%s"}
                ],
                "temperature": 0
            }
            """.formatted(prompt);

            try (OutputStream os = conn.getOutputStream()) {
                os.write(json.getBytes(StandardCharsets.UTF_8));
            }

            BufferedReader in = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            String response = in.lines().collect(Collectors.joining());
            in.close();

            // 간단한 파싱 (정규식 또는 JSONParser로 보완 가능)
            if (response.contains("긍정")) return "positive";
            if (response.contains("부정")) return "negative";
            return "neutral";

        } catch (Exception e) {
            e.printStackTrace();
            return "unknown";
        }
    }
}//class
