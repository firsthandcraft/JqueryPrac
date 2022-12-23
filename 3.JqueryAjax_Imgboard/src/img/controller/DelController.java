package img.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import img.service.Service;
import img.service.ServiceImpl;
import model.Img;

/**
 * Servlet implementation class DelController
 */
@WebServlet("/DelController")
public class DelController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DelController() {
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
		System.out.println("deleteController 입성");
		int num=Integer.parseInt(request.getParameter("num"));
		System.out.println("num:"+num);
		int n=service.delImg(num);
		System.out.println("n :"+n);
		String uploadPath="C:\\jqueryprac\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp1\\webapps\\ajaxupload_img\\";
		Img p=service.getImg(num);
		String arr[]=p.getPath().split("/");
		String fname=arr[arr.length-1];//배열이 0부터 들어가게
		File f= new File(uploadPath+fname);
		f.delete();
		request.setAttribute("num",n);
		RequestDispatcher rd = request.getRequestDispatcher("/imgBoard/delImg.jsp");
		rd.forward(request, response);
	}

}
