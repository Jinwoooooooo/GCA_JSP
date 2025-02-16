package controller.user3;

import java.io.IOException;

import dto.User3DTO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import service.User3Service;

@WebServlet("/user3/register.do")
public class RegisterController extends HttpServlet {

	private static final long serialVersionUID = -959535771517374168L;
	private User3Service service = User3Service.getInstance();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/user3/register.jsp");
		dispatcher.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//데이터 수신
		String uid = req.getParameter("uid");
		String name = req.getParameter("name");
		String age = req.getParameter("age");
		String hp = req.getParameter("hp");
		String job = req.getParameter("job");
		String addr = req.getParameter("addr");
		
		User3DTO dto = new User3DTO();
		dto.setUid(uid);
		dto.setName(name);
		dto.setAge(age);
		dto.setHp(hp);
		dto.setJob(job);
		dto.setAddr(addr);
		
		service.registerUser3(dto);
		
		resp.sendRedirect("/ch10/user3/list.do");
		
	}
}
