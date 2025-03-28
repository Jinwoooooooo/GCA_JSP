package controller;

import java.io.IOException;
import java.util.List;

import dto.User1DTO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import service.User1Service;

@WebServlet("/list.do")
public class ListController extends HttpServlet {

	private static final long serialVersionUID = 1L;
	
	private User1Service service = User1Service.getInstance();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		List<User1DTO> dtos = service.findAllUser1();
		
		req.setAttribute("dtos", dtos);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/list.jsp");
		dispatcher.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
	}
	
}

