package jsp.board.model.service;

import static jsp.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import jsp.board.model.dao.BoardDao;
import jsp.board.model.vo.Board;

public class BoardService {

	public ArrayList<Board> selectList() {
		Connection con = getConnection();
		
		ArrayList<Board> list = new BoardDao().selectList(con);
		
		close(con);
		
		
		return list;	
	}

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


}
