package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.catalina.tribes.membership.MemberImpl;

import model.MemberVO;
import service.Service;
import service.ServiceImpl;

/**
 * Servlet implementation class FindMemberController
 */
@WebServlet("/FindMemberController")
public class FindMemberController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FindMemberController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */ 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("utf-8");
		//PrintWriter out = response.getWriter();
		System.out.println("filnmembercontroller ¿‘º∫");
		Service service = new ServiceImpl();
		MemberVO vo = null;
		String id= request.getParameter("id");
		System.out.println("id : "+id);
		vo=service.findMember(id);
		System.out.println("vo:"+vo);
		request.setAttribute("m", vo);
		
		String path="3.member.jsp";

		RequestDispatcher dispatcher =request.getRequestDispatcher(path);
		dispatcher.forward(request, response);
	}

}
