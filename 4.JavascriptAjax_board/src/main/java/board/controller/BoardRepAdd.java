package board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import board.BoardService;
import board.BoardVo;

/**
 * Servlet implementation class BoardRepAdd
 */
@WebServlet("/board/repadd")
public class BoardRepAdd extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public BoardRepAdd() {
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
		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		boolean flag=true;
		try {
			BoardService service= new BoardService();
			String writer= request.getParameter("writer");
			String title= request.getParameter("title");
			String content= request.getParameter("content");
			int parent = Integer.parseInt(getInitParameter("parent"));
			service.addBoard(new BoardVo(0,writer,null,title,content,parent));
		}catch(Exception e) {
			System.out.println(e);
			flag= false;
		}
		JSONObject obj=new JSONObject();
		obj.put("flag",flag);
		String txt=obj.toJSONString();
		response.getWriter().append(txt);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
