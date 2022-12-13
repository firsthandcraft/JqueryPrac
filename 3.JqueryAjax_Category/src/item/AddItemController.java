package item;

import java.io.File;
import java.io.IOException;
import java.util.Enumeration;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;


/**
 * Servlet implementation class AddItemController
 */
@WebServlet("/AddItemController")
public class AddItemController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddItemController() {
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
		Item i = new Item();
		int maxSize=1024*1024*10;
		
		System.out.println("WriteController¡¢º”");
		
		
		String uploadPath="C:\\jqueryprac\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp1\\webapps\\Category_img";
		File upDir= new File(uploadPath);
		if(!upDir.exists()) {
			upDir.mkdir();			
		}
		try {
			MultipartRequest multi = new MultipartRequest(request, uploadPath,maxSize,"utf-8",new DefaultFileRenamePolicy());
			i.setTitle(multi.getParameter("title"));
			i.setPrice(Integer.parseInt(multi.getParameter("price")));
			i.setC1(Integer.parseInt(multi.getParameter("c1")));
			i.setC2(Integer.parseInt(multi.getParameter("c2")));
			i.setC3(Integer.parseInt(multi.getParameter("c3")));
			Enumeration files = multi.getFileNames();
			while(files.hasMoreElements()) {
				String file1 = (String)files.nextElement();
				img=multi.getOriginalFileName(file1);
				File file=multi.getFile(file1);
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		i.setImg("/Category_img/"+img);
		service.addItem(i);
		//response.sendRedirect("GetController?num="+num);
	}

}
