package controller.user3;

import java.io.IOException;
import java.util.List;

import dto.User3DTO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import service.User3Service;

@WebServlet("/user3/list.do")
public class ListController extends HttpServlet {

	private static final long serialVersionUID = 6479081701644684549L;
	private User3Service service = User3Service.getInstance();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//전체 사용자 조회
		List<User3DTO> dtos = service.viewUser3List();
		
		//데이터 공유(JSP에서 데이터를 출력하기 위해 request Scope 저장)
		req.setAttribute("dtos", dtos);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/user3/list.jsp");
		dispatcher.forward(req, resp);	
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
	}
}
