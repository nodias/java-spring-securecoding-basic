package kr.co.openeg.lab.board.dao;

import java.util.List;

import kr.co.openeg.lab.board.model.BoardCommentModel;
import kr.co.openeg.lab.board.model.BoardModel;

public interface BoardDao {
	// get all contents in JMBoard table
	List<BoardModel> selectBoardList(int startArticleNum, int showArticleLimit);
	
	// show detail about selected article
	BoardModel selectOneArticle(int idx);
	
	// get search result list
	List<BoardModel> selectArticle(String type, String keyword, int startArticleNum, int endArticleNum); 
	
	// get all comments
	List<BoardCommentModel> selectCommentList(int idx);
	
	// get a comment
	BoardCommentModel selectOneComment(int idx);
	
	// modify(update) article
	void updateArticle(BoardModel board);
	
	// insert article data
	void insertArticle(BoardModel board);
	
	// insert comment data
	void insertComment(BoardCommentModel comment);
	
	// update hitcount
	void updateHitcount(int hitcount, int idx);
	
	// update recommendcount
	void updateRecommendCount(int recommendcount, int idx);
	
	// get contents count
	int selectTotalNum();
	
	// get count of search results
	int selectSearchTotalNum(String type, String keyword);
	
	// delete a comment
	void deleteComment(int idx);
	
	// delete a article
	void deleteArticle(int idx);
}
