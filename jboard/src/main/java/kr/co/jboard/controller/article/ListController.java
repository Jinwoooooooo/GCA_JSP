package kr.co.jboard.controller.article;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kr.co.jboard.dto.ArticleDTO;
import kr.co.jboard.dto.PageGroupDTO;
import kr.co.jboard.service.ArticleService;

@WebServlet("/article/list.do")
public class ListController extends HttpServlet {
	
	private static final long serialVersionUID = 1271262765653325736L;
	private ArticleService service = ArticleService.INSTANCE;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		//pg 데이터 수신
		String pg = req.getParameter("pg");
		
		//전체 게시물 갯수 구하기
		int total = service.getCountArticle();
		
		//마지막 페이지 번호 구하기
		int lastPageNum = service.getLastPageNum(total);
		
		//현재 페이지 번호 구하기
		int currentPage = service.getCurrentPage(pg);
		
		//LIMIT용 start
		int start = service.getStartNum(currentPage);
		
		//페이지 그룹 구하기
		PageGroupDTO pageGroupDTO = service.getCurrentPageGroup(currentPage, lastPageNum);
		
		//페이지 시작 번호 구하기
		int pageStartNum = service.getPageStartNum(total, currentPage);
		
		//글 목록 데이터 조회
		List<ArticleDTO> articles = service.findAllArticle(start);
		
		//데이터 참조 공유
		req.setAttribute("articles", articles);
		req.setAttribute("currentPage", currentPage);
		req.setAttribute("lastPageNum", lastPageNum);
		req.setAttribute("pageStartNum", pageStartNum);
		req.setAttribute("pageGroupDTO", pageGroupDTO);
		
		// View forward
		RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/article/list.jsp");
		dispatcher.forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
	
	}
}
