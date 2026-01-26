package kr.co.viva.login;

import java.security.NoSuchAlgorithmException;
import java.sql.Date;
import java.sql.SQLException;

import kr.co.sist.chipher.DataEncryption;

public class SearchService {

    private SearchDAO dao = SearchDAO.getInstance();
    
    public SearchDTO login(String id, String pass) throws SQLException {
        if (id == null || id.trim().isEmpty()) return null;
        if (pass == null || pass.trim().isEmpty()) return null;

        SearchDTO dto = new SearchDTO();
        dto.setId(id.trim());
        try {
			dto.setPass(DataEncryption.messageDigest("SHA-1", pass));
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}

        return dao.selectLogin(dto);
    }

    
    public String findId(String birthStr, String tel) throws SQLException {
        if (birthStr == null || birthStr.trim().isEmpty()) return null;
        if (tel == null || tel.trim().isEmpty()) return null;

        Date birth = Date.valueOf(birthStr.trim());
        SearchDTO dto = new SearchDTO();
        
        String key="a123456789012345";
		DataEncryption de =new DataEncryption(key);
		
        dto.setBirth(birth);
        try {
			dto.setTel(de.encrypt(tel.trim()));
		} catch (Exception e) {
			e.printStackTrace();
		}

        return dao.selectIdByBirthTel(dto);
    }

    public boolean verifyForPasswordChange(String id, String tel) throws SQLException {
        if (id == null || id.trim().isEmpty()) return false;
        if (tel == null || tel.trim().isEmpty()) return false;

        SearchDTO dto = new SearchDTO();
        
        String key="a123456789012345";
		DataEncryption de =new DataEncryption(key);
        dto.setId(id.trim());
        try {
			dto.setTel(de.encrypt(tel.trim()));
		} catch (Exception e) {
			e.printStackTrace();
		}


        return dao.existsByIdTel(dto);
    }

    public boolean changePassword(String id, String newPass) throws SQLException {
        if (id == null || id.trim().isEmpty()) return false;
        if (newPass == null || newPass.trim().isEmpty()) return false;


        SearchDTO dto = new SearchDTO();
        dto.setId(id.trim());
        
        try {
			dto.setPass(DataEncryption.messageDigest("SHA-1", newPass));
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}

        return dao.updatePassword(dto) == 1;
    }
}
