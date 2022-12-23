package board.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.BoardService;
import board.BoardVo;

/**
 * Servlet implementation class BoardDetail
 */
@WebServlet("/board/detail")
public class BoardDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public BoardDetail() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("euc-kr");		
		response.setCharacterEncoding("euc-kr");
		response.setContentType("text/html; charset=EUC-KR");

		int type = Integer.parseInt(request.getParameter("type"));
		int num = Integer.parseInt(request.getParameter("num"));

		BoardService service = new BoardService();
		BoardVo vo = service.getBoard(num);
		if (type == 1) {
			response.getWriter().append("작성일:" + vo.getW_date());
		} else {
			request.setAttribute("vo", vo);
			RequestDispatcher dis = 
					request.getRequestDispatcher("/board/detail.jsp");
			dis.forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("euc-kr");		
		response.setCharacterEncoding("euc-kr");
		response.setContentType("text/html; charset=EUC-KR");
		
		BoardService service = new BoardService();
		int num = Integer.parseInt(request.getParameter("num"));
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		service.editBoard(new BoardVo(num, "", null, title, content, 0));
		
		response.sendRedirect(request.getContextPath()+"/board/list");
	}

}
