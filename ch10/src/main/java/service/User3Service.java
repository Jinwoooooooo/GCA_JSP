package service;

import java.util.List;

import dao.User3DAO;
import dto.User3DTO;

public class User3Service {
	
	//싱글톤
	private static final User3Service INSTANCE = new User3Service();
	public static User3Service getInstance() {
		return INSTANCE;
	}
	private User3Service() {}
	
	//DAO 호출
	private User3DAO dao = User3DAO.getInstance();
	
	public User3DTO findUser3(String uid) {
		return dao.selectUser3(uid);
	}
	
	public List<User3DTO> viewUser3List() {
		return dao.selectAllUser3();
	}
	
	public void registerUser3(User3DTO dto) {
		dao.insertUser3(dto);
	}
	
	public void modifyUser3(User3DTO dto) {
		dao.updateUser3(dto);
	}
	
	public void removeUser3(String uid) {
		dao.deleteUser3(uid);
	}
}
