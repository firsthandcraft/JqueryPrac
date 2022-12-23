package img.controller;

import java.io.File;
import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import img.service.Service;
import img.service.ServiceImpl;
import model.Img;

/**
 * Servlet implementation class WriteController
 */
@WebServlet("/WriteController")
public class WriteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public WriteController() {
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
		String img ="";
		Img p = new Img();
		int num= service.makeNum();
		
		System.out.println("WriteController¡¢º”");
		p.setNum(num);
		int maxSize=1024*1024*10;
		String uploadPath="C:\\3.JqueryAjax_Imgboard\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp1\\webapps\\ajaxupload_img";
		File upDir= new File(uploadPath);
		if(!upDir.exists()) {
			upDir.mkdir();			
		}
		try {
			MutipartRequest multi = new MultipartRequest(request, uploadPath,maxSize,"utf-8",new DefaultFileRenamePolicy());
			p.setTitle(multi.getParameter("title"));
			p.setWriter(multi.getParameter("writer"));
			p.setPwd(multi.getParameter("pwd"));
			Enumeration files = multi.getFileNames();
			while(files.hasMoreElements()) {
				String file1 = (String)files.nextElement();
				img=multi.getOriginalFileName(file1);
				File file=multi.getFile(file1);
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		p.setPath("/ajaxupload_img/"+img);
		service.addImg(p);
		Img i = service.getImg(num);
		System.out.println("num:"+num);
		System.out.println("i"+i);
		request.setAttribute("i", i);
		RequestDispatcher dispatcher=request.getRequestDispatcher("imgBoard/addImg.jsp");
		dispatcher.forward(request, response);
		
	}

}
