package menu;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class CateController
 */
@WebServlet("/CateController")
public class CateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CateController() {
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
		Service service = new ServiceImpl();
		String type= request.getParameter("type");
		ArrayList<Cate> list= null;
		int pNum=0;
		if(!type.equals("cate1")){
			pNum=Integer.parseInt(request.getParameter("pNum"));
			System.out.println(type+"/"+pNum);
		}
		switch (type) {
		case "cate1":
			list=service.getCate1();
			break;
		case "cate2":
			list=service.getCate2(pNum);
			break;
		case "cate3":
			list=service.getCate3(pNum);
			break;
		}
		request.setAttribute("list",list);
		RequestDispatcher rd=request.getRequestDispatcher("/menu/data.jsp");
		rd.forward(request, response);
	}

}
