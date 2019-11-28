package jsp.board.model.dao;

import static jsp.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import jsp.board.model.vo.Board;

public class BoardDao {
	private Properties prop = new Properties();
	
	public BoardDao() {
		String fileName = BoardDao.class.getResource("/sql/board/board-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	//게시물 목록 조회용 메소드
	public ArrayList<Board> selectList(Connection con) {
		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<Board> list = null;
		
		String query = prop.getProperty("selectList");
		
		try {
			stmt = con.createStatement();
			
			rset = stmt.executeQuery(query);
			
			list = new ArrayList<>();
			
			while(rset.next()) {
				Board b = new Board();
				
				b.setBid(rset.getInt("BID"));
				b.setbTitle(rset.getString("BTITLE"));
				b.setbContent(rset.getString("BCONTENT"));
				b.setbWriter(rset.getString("BWRITER"));
				b.setbCount(rset.getInt("BCOUNT"));
				b.setbDate(rset.getDate("BDATE"));
				b.setModifyDate(rset.getDate("MODIFY_DATE"));
				b.setStatus(rset.getString("STATUS"));
				
				list.add(b);
			}
			
			System.out.println(list);
			
			System.out.println(list);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		
		return list;
	}
	//게시물 작성용 메소드
	public int insertBoard(Connection con, Board b) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertBoard");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, b.getbTitle());
			pstmt.setString(2, b.getbContent());
			pstmt.setString(3, b.getbWriter());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		
		return result;
	}
	//전체 게시물 수 조회용 메소드
	public int getListCount(Connection con) {
		Statement stmt = null;
		ResultSet rset = null;
		int listCount = 0;
		
		String query = prop.getProperty("listCount");
		
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			
			if(rset.next()) {
				listCount = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(stmt);
			close(rset);
		}
		
		return listCount;
	}
	//페이징 처리 후 게시물 목록 조회용 메소드
	public ArrayList<Board> selectListWithPaging(Connection con, int currentPage, int limit) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Board>list = null;
		
		String query = prop.getProperty("selectListWithPaging");
		
		//조회를 시작할 행 번호와 마지막 행 번호 계산
		int startRow = (currentPage - 1) * limit + 1;
		int endRow = startRow + limit - 1;
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<Board>();
			
			while(rset.next()) {
				Board b = new Board();
				
				b.setBid(rset.getInt("BID"));
				b.setbTitle(rset.getString("BTITLE"));
				b.setbContent(rset.getString("BCONTENT"));
				b.setbWriter(rset.getString("BWRITER"));
				b.setbCount(rset.getInt("BCOUNT"));
				b.setbDate(rset.getDate("BDATE"));
				b.setStatus(rset.getString("STATUS"));
				
				list.add(b);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}

}
