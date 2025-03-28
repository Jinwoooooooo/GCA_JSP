package controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import service.User1Service;

@WebServlet("/remove.do")
public class RemoveController extends HttpServlet {

	private static final long serialVersionUID = 1L;
	private User1Service service = User1Service.getInstance();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//데이터 수신
		String uid = req.getParameter("uid");
		
		//수정 데이터 조회
		service.removeUser1(uid);
		
		//View forward
		resp.sendRedirect("/jspps/list.do");
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

	}
}


