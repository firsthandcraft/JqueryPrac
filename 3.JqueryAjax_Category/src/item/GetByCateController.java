package item;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class GetByCateController
 */
@WebServlet("/GetByCateController")
public class GetByCateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetByCateController() {
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
		Service service= new ServiceImpl();
		int c1=Integer.parseInt(request.getParameter("c1"));
		int c2=Integer.parseInt(request.getParameter("c2"));
		int c3=Integer.parseInt(request.getParameter("c3"));
		ArrayList<Item>list= null;
		System.out.println("search :: "+c1+"/"+c2+"/"+c3);
		if(c2==0) {
			list= service.getByC1(c1);
		}else if(c3==0) {
			list=service.getByC2(c2);
		}else {
			list=service.getByC3(c3);
		}
		request.setAttribute("list",list);
		RequestDispatcher rd = request.getRequestDispatcher("/menu/itemList.jsp");
		rd.forward(request, response);
	}

}
