package kr.co.openeg.lab.board.service;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import kr.co.openeg.lab.board.dao.BoardDao;
import kr.co.openeg.lab.board.model.BoardCommentModel;
import kr.co.openeg.lab.board.model.BoardModel;
import org.springframework.stereotype.Service;

@Service
public class BoardService  {
	@Resource(name="boardDao")
	private BoardDao dao;
	
	private HashMap<String, Object> valueMap = new HashMap<String, Object>();
		
	public List<BoardModel> getBoardList(int startArticleNum, int endArticleNum) {
		return dao.selectBoardList(startArticleNum, endArticleNum);
	}

	public BoardModel getOneArticle(int idx) {
		return dao.selectOneArticle(idx);
	}

	public List<BoardModel> searchArticle(String type, String keyword, int startArticleNum, int endArticleNum) {
        return dao.selectArticle(type, keyword, startArticleNum, endArticleNum);
	}


	public List<BoardCommentModel> getCommentList(int idx) {
		return dao.selectCommentList(idx);
	}


	public boolean writeArticle(BoardModel board) {
		try {
		        dao.insertArticle(board);
		} catch(Exception e){
			return false;
		}
		return true;
	}


	public boolean writeComment(BoardCommentModel comment) {
		try {
			dao.insertComment(comment);
		}catch(Exception e){
			return false;
		}
		return true;
	}


	public void updateHitcount(int hitcount, int idx) {
		dao.updateHitcount(hitcount, idx);
		
	}


	public void updateRecommendCount(int recommendcount, int idx) {
		dao.updateRecommendCount(recommendcount, idx);
	}
	

	public int getTotalNum() {
		return dao.selectTotalNum();
	}


	public int getSearchTotalNum(String type, String keyword) {
		return dao.selectSearchTotalNum(type, keyword);
	}


	public void deleteComment(int idx) {
		dao.deleteComment(idx);
	}
	

	public void deleteArticle(int idx) {
		dao.deleteArticle(idx);
	}


	public BoardCommentModel getOneComment(int idx) {
		return dao.selectOneComment(idx);
	}


	public boolean modifyArticle(BoardModel board) {
	    try {
		     dao.updateArticle(board);
	    }catch(Exception e) {
	    	return false;
	    }
	    return true;
	}	

}
