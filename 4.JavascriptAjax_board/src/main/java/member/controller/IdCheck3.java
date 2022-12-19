package member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import member.MemberService;
import member.MemberVo;

/**
 * Servlet implementation class IdCheck3
 */
@WebServlet("/member/idcheck")
public class IdCheck3 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public IdCheck3() {
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
		String id= request.getParameter("id");
		MemberService service= new MemberService();
		MemberVo vo = service.getMember(id);
//		System.out.println(vo);
		boolean flag=false;
		String msg="사용불가능한 아이디입니다.";
		if(vo==null){
			msg="사용 가능한 아이디입니다.";
			flag= true;
		}
		JSONObject obj=new JSONObject();
		obj.put("flag",flag);
		obj.put("msg",msg);
		String txt= obj.toJSONString();
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
