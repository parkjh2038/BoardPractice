package jsp.board.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jsp.board.model.service.BoardService;
import jsp.board.model.vo.Board;
import jsp.board.model.vo.PageInfo;

/**
 * Servlet implementation class SelectBoardListServlet
 */
@WebServlet("/selectList.bo")
public class SelectBoardListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectBoardListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//ArrayList<Board> list = new BoardService().selectList();  //페이징 처리 전 모든 목록을 불러옴
		
		int currentPage;	//현재 페이지를 표시할 변수
		int limit;			//한 페이지에 게시글이 몇 개 보여질 것인지
		int maxPage;		//전체 페이지에서 가장 마지막 페이지
		int startPage;		//한 번에 표시될 페이지의 시작할 페이지
		int endPage;		//한 번에 표시될 페이지의 마지막 페이지
		
		//게시판 1페이지부터 시작
		currentPage = 1;
		
		//전달받은 페이지 추출
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		limit = 15;		//한 페이지에 보여질 목록 갯수
		
		int listCount = new BoardService().getListCount();
		
		//총 페이지 수 계산
		//예를 들면 목록수가 124이면 페이지는 13페이지가 필요함
		//짜투리 목록이 최소 1개일 때, 1page가 추가되는 로직 작성
		maxPage = (int)((double)listCount / limit + 0.95);
				
		//현재 페이지에 보여 줄 시작 페이지 수 (10개 씩 보여지게 할 경우)
		//아래쪽 페이지 수가 10개씩 보여지게 한다면
		//1, 11, 21, 31, ...
		startPage = (((int)((double) currentPage / limit + 0.95)) - 1) * 5 + 1;
				
		//목록 아래 쪽에 보여질 마지막 페이지수
		endPage = startPage + 5 - 1;
				
		if(maxPage < endPage) {
			endPage = maxPage;
		}
		
		//페이지 정보를 담을 vo 객체 생성
		PageInfo pi = new PageInfo(currentPage, listCount, limit, maxPage, startPage, endPage);
				
		ArrayList<Board> list = new BoardService().selectListWithPaging(currentPage, limit);
		
		String page = "";
		if(list != null) {
			page = "index.jsp";
			request.setAttribute("list", list);
			request.setAttribute("pi", pi);
		}else {
			page = "views/errorPage.jsp";
			request.setAttribute("msg", "게시판 조회 실패!");
		}
		
		request.getRequestDispatcher(page).forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
