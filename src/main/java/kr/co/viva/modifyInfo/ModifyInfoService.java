package kr.co.viva.modifyInfo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import kr.co.sist.chipher.DataDecryption;
import kr.co.sist.chipher.DataEncryption;
import kr.co.viva.login.JoinDAO;
import kr.co.viva.login.JoinDTO;
import kr.co.viva.notice.DbConn;

public class ModifyInfoService {
	private static ModifyInfoService js;
	
	private ModifyInfoService(){
		
	}
	
	public static ModifyInfoService getInstance() {
		if(js ==null) {
			js=new ModifyInfoService();
		}
		return js;
	}//getInstance
	
	public ModifyInfoDTO searchInfo(String id) {
		ModifyInfoDTO miDTO = new ModifyInfoDTO();
		ModifyInfoDAO miDAO = ModifyInfoDAO.getInstance();
		String key="a123456789012345";
		DataDecryption dd = new DataDecryption(key);
		//'이준원' 'lee@test.com'
		try {
			miDTO = miDAO.selectInfo(id);
			miDTO.setEmail(dd.decrypt(miDTO.getEmail()));
			miDTO.setTel(dd.decrypt(miDTO.getTel()));
			miDTO.setAddrDetail(dd.decrypt(miDTO.getAddrDetail()));
		} catch (SQLException e) {
			e.printStackTrace();
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return miDTO;
	}//addMember
	
	
	public boolean modifyInfo(ModifyInfoDTO miDTO) {
		boolean flag=false;
		ModifyInfoDAO miDAO = ModifyInfoDAO.getInstance();
		String key="a123456789012345";
		 DataEncryption de = new DataEncryption(key);
		//'이준원' 'lee@test.com'
		try {
			miDTO.setEmail(de.encrypt(miDTO.getDomain()+"@"+miDTO.getTld()));
			miDTO.setTel(de.encrypt(miDTO.getTel1()+"-"+miDTO.getTel2()+"-"+miDTO.getTel3()));
			miDTO.setAddrDetail(de.encrypt(miDTO.getAddrDetail()));
			flag=miDAO.updateInfo(miDTO)==1;
		} catch (SQLException e) {
			e.printStackTrace();
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return flag;
		
	}//modifyInfo
	
	public boolean removeMember(String id) {
		boolean flag=false;
		ModifyInfoDAO miDAO = ModifyInfoDAO.getInstance();
		//'이준원' 'lee@test.com'
		try {
			flag=miDAO.updateWithbraw(id)==1;
		} catch (SQLException e) {
			e.printStackTrace();
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return flag;
		
	}//modifyInfo
	
}//JoinService

