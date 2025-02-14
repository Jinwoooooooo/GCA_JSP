package dao;

import java.util.ArrayList;
import java.util.List;

import dto.User2DTO;
import util.DBHelper;
import util.SQL;

public class User2DAO extends DBHelper {
	
	//싱글톤
	private static final User2DAO INSTANCE = new User2DAO();
	public static User2DAO getInstance() {
		return INSTANCE;
	}
	private User2DAO() {}
	
	//기본 CRUD
	public void insertUser2(User2DTO dto) {
		
		try {			
			conn = getConnection();
			pstmt = conn.prepareStatement(SQL.INSERT_USER2);
			pstmt.setString(1, dto.getUid());
			pstmt.setString(2, dto.getName());
			pstmt.setString(3, dto.getHp());
			pstmt.setInt(4, dto.getAge());
			pstmt.setString(5, dto.getAddr());
			pstmt.executeUpdate();
			closeAll();
			
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public User2DTO selectUser2(String uid) {
		
		User2DTO dto = null;
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(SQL.SELECT_USER2);
			pstmt.setString(1, uid);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				dto = new User2DTO();
				dto.setUid(rs.getString(1));
				dto.setName(rs.getString(2));
				dto.setHp(rs.getString(3));
				dto.setAge(rs.getInt(4));
				dto.setAddr(rs.getString(5));
			}
			closeAll();
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}
	
	public List<User2DTO> selectAllUser2() {
		
		List<User2DTO> dtos = new ArrayList<>();
		
		try {
			conn = getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(SQL.SELECT_ALL_USER2);
			
			while(rs.next()) {
				User2DTO dto = new User2DTO();
				dto.setUid(rs.getString(1));
				dto.setName(rs.getString(2));
				dto.setHp(rs.getString(3));
				dto.setAge(rs.getInt(4));
				dto.setAddr(rs.getString(5));
				dtos.add(dto);
			}
			closeAll();
			
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return dtos;
		
	}
	
	public void updateUser2(User2DTO dto) {
		
		try {			
			conn = getConnection();
			pstmt = conn.prepareStatement(SQL.UPDATE_USER2);
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getHp());
			pstmt.setInt(3, dto.getAge());
			pstmt.setString(4, dto.getAddr());
			pstmt.setString(5, dto.getUid());
			pstmt.executeUpdate();
			closeAll();
			
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public void deleteUser2(String uid) {
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(SQL.DELETE_USER2);
			pstmt.setString(1, uid);
			pstmt.executeUpdate();
			closeAll();
			
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
}
