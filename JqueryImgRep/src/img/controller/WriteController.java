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
		String img="";
		Img p = new Img();
		int maxSize=1024*1024*10;
		int num=service.makeNum();
		p.setNum(num);
		String uploadPath="C:\\jqueryprac\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp1\\webapps\\JqueryImgRep";
		File upDir=new File(uploadPath);
		if(!upDir.exists()) {
			upDir.mkdir();
		}
		try {
			MultipartRequest multi= new MultipartRequest(request, uploadPath,maxSize,"utf-8",new DefaultFileRenamePolicy());
			p.setTitle(multi.getParameter("title"));
			p.setWriter(multi.getParameter("writer"));
			p.setPwd(multi.getParameter("pwd"));
			//전송한 파일들의 이름을 가져온다.
			Enumeration files = multi.getFileNames();
			while(files.hasMoreElements()) {
				String file1=(String)files.nextElement();
				img=multi.getOriginalFileName(file1);
				File file=multi.getFile(file1);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		p.setPath("/JqueryImgRep/"+img);
		service.addImg(p);
		//get방식으로 넘기겠다.
		response.sendRedirect("GetController?num="+num);
//		Img i= service.getImg(num);
//		request.setAttribute("i",i);
//		RequestDispatcher rd=request.getRequestDispatcher("imgBoard/addImg.jsp");
//		rd.forward(request, response);
	}

}
