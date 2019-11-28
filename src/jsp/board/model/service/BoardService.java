package jsp.board.model.service;

import static jsp.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import jsp.board.model.dao.BoardDao;
import jsp.board.model.vo.Board;

public class BoardService {
	//게시물 목록 조회용 메소드
	public ArrayList<Board> selectList() {
		Connection con = getConnection();
		
		ArrayList<Board> list = new BoardDao().selectList(con);
		
		close(con);
		
		
		return list;	
	}
	//게시물 작성용 메소드
	public int insertBoard(Board b) {
		Connection con = getConnection();
		
		int result = new BoardDao().insertBoard(con, b);
		
		if(result > 0) {
			commit(con);
		}else {
			rollback(con);
		}
		
		close(con);
		
		return result;
	}
	//전체 게시물 수 조회용 메소드
	public int getListCount() {
		Connection con = getConnection();
		
		int listCount = new BoardDao().getListCount(con);
		
		close(con);
		
		return listCount;
	}
	//페이징 처리 후 게시물 목록 조회용 메소드
	public ArrayList<Board> selectListWithPaging(int currentPage, int limit) {
		Connection con = getConnection();
		
		ArrayList<Board> list = new BoardDao().selectListWithPaging(con, currentPage, limit);
		
		close(con);
		
		return list;
	}

}
