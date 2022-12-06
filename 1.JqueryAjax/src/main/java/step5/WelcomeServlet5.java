package step5;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class WelcomeServlet5
 */
@WebServlet("/WelcomeServlet5")
public class WelcomeServlet5 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public WelcomeServlet5() {
        super();
        // TODO Auto-generated constructor stub
    }
    private HashMap<String,String>map = new HashMap<String,String>();
	
	@Override
	public void init() throws ServletException {
		// TODO Auto-generated method stub
		map.put("01", "1100원");
		map.put("02", "1200원");
		map.put("03", "1300원");
		map.put("04", "1400원");
		map.put("05", "1500원");
	}
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		System.out.println("goGet()...");
		String line= request.getParameter("line");
		if(map.containsKey(line)) {
			out.print(map.get(line));
		} else {
			out.print("호선을 선택하세요.");
		}
		out.close();
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
