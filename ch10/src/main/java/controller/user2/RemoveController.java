package controller.user2;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import service.User2Service;

@WebServlet("/user2/remove.do")
public class RemoveController extends HttpServlet {

	private static final long serialVersionUID = 8013227348201568820L;
	private User2Service service = User2Service.getInstance();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//데이터 수신
		String uid = req.getParameter("uid");
		
		//서비스 실행
		service.removeUser2(uid);
		
		//이동
		resp.sendRedirect("/ch10/user2/list.do");
	}
	
}
