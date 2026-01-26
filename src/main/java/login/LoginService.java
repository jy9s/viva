package login;

import java.security.NoSuchAlgorithmException;
import java.sql.SQLException;

import kr.co.sist.chipher.DataEncryption;

public class LoginService {
	
	
	private static LoginService logService;
	
	private LoginService() {
		
	}
	
	public static LoginService getInstance() {
		if(logService==null) {
			logService = new LoginService();
		}
		return logService;
	}
	
	
	public AdminAdminDTO searchAdmin(String id, String pw) {
		AdminAdminDTO adDTO = new AdminAdminDTO();		
		LoginDAO logDAO = LoginDAO.getInstance();
		
		
		//비밀번호 일방향 해시
		if(pw!=null && !pw.isEmpty()) {
			try {
				pw=DataEncryption.messageDigest("SHA-1", pw);
			} catch (NoSuchAlgorithmException e) {
				e.printStackTrace();
			}
		}
		
		
		try {
			adDTO = logDAO.SelectAdmin(id, pw);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return adDTO;
	}
	
	
	
	public UserDTO searchUser(String id, String pw) {
		UserDTO uDTO = new UserDTO();
		
		LoginDAO logDAO = LoginDAO.getInstance();
		
		try {
			uDTO = logDAO.SelectUser(id, pw);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return uDTO;
	}
	
	
}
