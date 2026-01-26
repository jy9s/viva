package kr.co.viva.login;

import java.security.NoSuchAlgorithmException;
import java.sql.SQLException;

import kr.co.sist.chipher.DataEncryption;

public class LoginUserService {
	
	
	private static LoginUserService logService;
	
	private LoginUserService() {
		
	}
	
	public static LoginUserService getInstance() {
		if(logService==null) {
			logService = new LoginUserService();
		}
		return logService;
	}
	
	
	public UserDTO searchUser(String id, String pw) {
		UserDTO uDTO = new UserDTO();		
		LoginUserDAO logDAO = LoginUserDAO.getInstance();
		
		
		//비밀번호 일방향 해시
		if(pw!=null && !pw.isEmpty()) {
			try {
				pw=DataEncryption.messageDigest("SHA-1", pw);
			} catch (NoSuchAlgorithmException e) {
				e.printStackTrace();
			}
		}
		
		
		try {
			uDTO = logDAO.SelectUser(id, pw);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		
		return uDTO;
	}
	
}
