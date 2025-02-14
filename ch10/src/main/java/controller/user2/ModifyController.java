package controller.user2;

import java.io.IOException;

import dto.User2DTO;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import service.User2Service;

@WebServlet("/user2/modify.do")
public class ModifyController extends HttpServlet {

	private static final long serialVersionUID = 7191063545232720667L;
	private User2Service service = User2Service.getInstance();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//데이터 수신
		String uid = req.getParameter("uid");
		
		//수정 데이터 조회
		User2DTO dto = service.findUser2(uid);
		
		//데이터 공유(JSP에서 데이터를 출력하기 위해 request Scope 저장)
		req.setAttribute("dto", dto);
		
		//View forward
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/user2/modify.jsp");
		dispatcher.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//데이터 수신
		String uid = req.getParameter("uid");
		String name = req.getParameter("name");
		String hp = req.getParameter("hp");
		String age = req.getParameter("age");
		String addr = req.getParameter("addr");
		
		//DTO 생성
		User2DTO dto = new User2DTO();
		dto.setUid(uid);
		dto.setName(name);
		dto.setHp(hp);
		dto.setAge(age);
		dto.setAddr(addr);
		
		//서비스 호출
		service.modifyUser2(dto);
		
		//이동
		resp.sendRedirect("/ch10/user2/list.do");
	}
}
