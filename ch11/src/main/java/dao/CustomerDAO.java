package dao;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import dto.CustomerDTO;
import util.DBHelper;
import util.SQL;

public class CustomerDAO extends DBHelper {

	private static final CustomerDAO INSTANCE = new CustomerDAO();
	public static CustomerDAO getInstance() {
		return INSTANCE;
	}
	private CustomerDAO() {}
	
	//로거생성
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	public void insertCustomer(CustomerDTO dto) {
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(SQL.INSERT_CUSTOMER);
			pstmt.setString(1, dto.getCustId());
			pstmt.setString(2, dto.getName());
			pstmt.setString(3, dto.getHp());
			pstmt.setString(4, dto.getAddr());
			pstmt.executeUpdate();
			closeAll();
			
		} catch (Exception e) {
			e.printStackTrace();
			
			//시스템 개선 및 업데이트 활용하기 위해 에러 내용을 로깅
			logger.error(e.getMessage());
		}
	}
	
	public CustomerDTO selectCustomer(String custId) {

		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(SQL.SELECT_CUSTOMER);
			
			pstmt.executeQuery();
			closeAll();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public List<CustomerDTO> selectAllCustomer() {

		try {
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public void updateCustomer(CustomerDTO dto) {

		try {
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void deleteCustomer(String custId) {

		try {
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
