package kr.co.viva.login;

import java.sql.SQLException;

import kr.co.sist.chipher.DataEncryption;

public class JoinService {
	private static JoinService js;
	
	private JoinService(){
		
	}
	
	public static JoinService getInstance() {
		if(js ==null) {
			js=new JoinService();
		}
		return js;
	}//getInstance
	
	public boolean addMember(JoinDTO jDTO) {
		boolean flag=false;
		JoinDAO jDAO = JoinDAO.getInstance();
		String key="a123456789012345";
		 DataEncryption de = new DataEncryption(key);
		//'이준원' 'lee@test.com'
		try {
			jDTO.setPass(DataEncryption.messageDigest("SHA-1", jDTO.getPass()));
			jDTO.setEmail(de.encrypt(jDTO.getEmail()));
			jDTO.setTel(de.encrypt(jDTO.getTel()));
			jDTO.setAddrDetail(de.encrypt(jDTO.getAddrDetail()));
			flag=jDAO.insertMember(jDTO)==1;
		} catch (SQLException e) {
			e.printStackTrace();
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return flag;
	}//addMember
	
	public boolean searchId(String id) {
		boolean flag = false;
		JoinDAO jDAO = JoinDAO.getInstance();
		
		try {
			flag = jDAO.selectId(id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return flag;
	}
}//JoinService

