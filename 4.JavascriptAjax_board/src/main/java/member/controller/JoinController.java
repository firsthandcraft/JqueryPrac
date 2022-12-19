package member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.MemberService;
import member.MemberVo;

/**
 * Servlet implementation class JoinController
 */
@WebServlet("/member/join")
public class JoinController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public JoinController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	// 회원가입 작성 폼 제공
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		//단순하게 페이지만 불러오는 컨트롤러
		RequestDispatcher dis= request.getRequestDispatcher("/member/joinForm.jsp");
		dis.forward(request, response);
//		response.sendRedirect()는 회원가입 하고 바로 로그인 이 되게 
	}

	// forward 이동: 서버 내에서 페이지 이동
	// redirect 이동: 새 request(요청) 페이지 이동
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	// 회원가입 완료
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		String id= request.getParameter("id");
		String pwd= request.getParameter("pwd");
		String name= request.getParameter("name");
		String email= request.getParameter("email");
		String type= request.getParameter("type");
		MemberVo vo = new MemberVo(id, pwd, name, email, type);
		System.out.println(vo);
		MemberService service = new MemberService();
		service.join(vo);
		RequestDispatcher dis= request.getRequestDispatcher("/index.jsp");
		dis.forward(request, response);
		
	}

}
