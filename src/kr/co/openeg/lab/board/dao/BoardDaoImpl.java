package kr.co.openeg.lab.board.dao;

import java.util.HashMap;
import java.util.List;

import kr.co.openeg.lab.board.model.BoardCommentModel;
import kr.co.openeg.lab.board.model.BoardModel;

import org.springframework.jdbc.core.support.JdbcDaoSupport;
import org.springframework.orm.ibatis.support.SqlMapClientDaoSupport;


public class BoardDaoImpl extends SqlMapClientDaoSupport  implements BoardDao {

	private HashMap<String, Object> valueMap = new HashMap<String, Object>();
		

	@Override
	public List<BoardModel> selectBoardList(int startArticleNum, int endArticleNum) {
		valueMap.put("startArticleNum", startArticleNum);
		valueMap.put("endArticleNum", endArticleNum);
		return getSqlMapClientTemplate().queryForList("board.getBoardList", valueMap);
	}

	@Override
	public BoardModel selectOneArticle(int idx) {
		return (BoardModel) getSqlMapClientTemplate().queryForObject("board.getOneArticle", idx);
	}

	@Override
	public List<BoardModel> selectArticle(String type, String keyword, int startArticleNum, int endArticleNum) {
		valueMap.put("type", type);
		valueMap.put("keyword", keyword);
		valueMap.put("startArticleNum", startArticleNum);
		valueMap.put("endArticleNum", endArticleNum);
		return getSqlMapClientTemplate().queryForList("board.searchArticle", valueMap);
	}

	@Override
	public List<BoardCommentModel> selectCommentList(int idx) {
		return getSqlMapClientTemplate().queryForList("board.getCommentList", idx);
	}

	@Override
	public void insertArticle(BoardModel board) {
		    getSqlMapClientTemplate().insert("board.writeArticle", board);	
	}

	@Override
	public void insertComment(BoardCommentModel comment) {
		   getSqlMapClientTemplate().insert("board.writeComment", comment);
	}

	@Override
	public void updateHitcount(int hitcount, int idx) {
		valueMap.put("hitcount", hitcount);
		valueMap.put("idx", idx);
		getSqlMapClientTemplate().update("board.updateHitcount", valueMap);		
	}

	@Override
	public void updateRecommendCount(int recommendcount, int idx) {
		valueMap.put("recommendcount", recommendcount);
		valueMap.put("idx", idx);
		getSqlMapClientTemplate().update("board.updateRecommendcount", valueMap);
		
	}
	@Override
	public int selectTotalNum() {
		return (Integer) getSqlMapClientTemplate().queryForObject("board.getTotalNum");
	}

	@Override
	public int selectSearchTotalNum(String type, String keyword) {
		valueMap.put("type", type);
		valueMap.put("keyword", keyword);
		return (Integer) getSqlMapClientTemplate().queryForObject("board.getSearchTotalNum", valueMap);
	}

	@Override
	public void deleteComment(int idx) {
		getSqlMapClientTemplate().delete("board.deleteComment", idx);
	}
	
	@Override
	public void deleteArticle(int idx) {
		getSqlMapClientTemplate().delete("board.deleteArticle", idx);	
	}

	@Override
	public BoardCommentModel selectOneComment(int idx) {
		return (BoardCommentModel) getSqlMapClientTemplate().queryForObject("board.getOneComment", idx);		
	}

	@Override
	public void updateArticle(BoardModel board) {
		   getSqlMapClientTemplate().update("board.modifyArticle", board);
	}	

}
