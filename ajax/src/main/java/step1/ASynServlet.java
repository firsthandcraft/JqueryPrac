package step1;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ASynServlet
 */
@WebServlet("/ASynServlet")
public class ASynServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ASynServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    private int count;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html;charset=utf-8");
		//ĳ�� ����� ������� �ʰڴ�. 
		//�������� �ִ��ӽ� �޸�� �Ȼ���ϰڴ�. ĳ��ó�� �Ȱڴ�.
		response.setHeader("cache-Control","no-cache");
		PrintWriter out=response.getWriter();
		try {
			Thread.sleep(5000);//���Ƿ� �ð� ����
		}catch(InterruptedException e) {
			e.printStackTrace();
		}
		out.print("count: " +count++);
		System.out.println(count);
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
