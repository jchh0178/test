package com.itwillbs.teamProjectTest;

import org.springframework.stereotype.Controller;
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
}
