package jsp.board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jsp.board.model.service.BoardService;
import jsp.board.model.vo.Board;

/**
 * Servlet implementation class SelectOneBoardServlet
 */
@WebServlet("/selectOne.bo")
public class SelectOneBoardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectOneBoardServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int num = Integer.parseInt(request.getParameter("num"));
		
		Board b = new BoardService().selectOne(num);
		
		String page = "";
		
		if(b != null) {
			page = "views/boardReadForm.jsp";
			request.setAttribute("b", b);
		}else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "게시글 상세 보기 실패!");
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
