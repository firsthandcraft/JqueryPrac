package img.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import img.service.Service;
import img.service.ServiceImpl;
import model.Img;
import model.Rep;


/**
 * Servlet implementation class ImgList
 */
@WebServlet("/ImgList")
public class ImgList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ImgList() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("utf-8");
		Service service= new ServiceImpl();
		rep.service.Service rep_service= new rep.service.ServiceImpl();
		ArrayList<Img> imgs= service.getAll();
		//이미지 출력 댓글 출력
		for(Img i:imgs){
			ArrayList<Rep> reps= rep_service.getRepsByImg_num(i.getNum());
			i.setReps(reps);
			System.out.println(" i : "+i);
		}
		/*for( A : B )
		 * 어쨋든 for문이라 반복문이긴한데, 간단하게 설명을 하자면 
		 * B에서 차례대로 객체를 꺼내서 A에다가 넣겠다는 것이다.*/
//		System.out.println("ImgList i:"+ i);
		System.out.println("ImgList imgs :"+imgs);
		request.setAttribute("imgs",imgs);
		String path="/imgBoard/imgList.jsp";
		RequestDispatcher rd= request.getRequestDispatcher(path);
		rd.forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
