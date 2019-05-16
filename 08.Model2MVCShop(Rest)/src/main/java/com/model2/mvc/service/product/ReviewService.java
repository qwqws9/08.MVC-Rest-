package com.model2.mvc.service.product;

import java.util.Map;

import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Review;


public interface ReviewService {
	
	public void addReview(Review Review) throws Exception;

	public Review getReview(int reviewNo) throws Exception;

	public Map<String,Object> getReviewList(Search search,String prodNo) throws Exception;

	public void updateReview(Review Review) throws Exception;
	
}