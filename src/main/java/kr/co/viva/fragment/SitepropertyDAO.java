package kr.co.viva.fragment;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import db.DbConn;

public class SitepropertyDAO {
	
	
	public static SitepropertyVO spVO;

	//static 영역은 클래스가 사용되면 한번만 자동 호출되는 영역. 
	static {
		DbConn db = DbConn.getInstance("jdbc/dbcp");
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			con=db.getConn();
			String selectSiteInfo="select PROTOCOL, SERVER_NAME, CONTEXT_ROOT, MANAGE_PATH, KEY, TITLE from site_property where property_type=2";
			
			pstmt=con.prepareStatement(selectSiteInfo);
			rs=pstmt.executeQuery();
			//SiteProperty에 static으로 설정정보를 저장할 변수를 만들고
			//조회된 결과를 할당하여 사용할 수도 있다.
			if(rs.next()) {
				spVO = new SitepropertyVO(rs.getString("PROTOCOL"), rs.getString("SERVER_NAME"), rs.getString("CONTEXT_ROOT"), rs.getString("MANAGE_PATH"), rs.getString("KEY"), rs.getString("TITLE"));				
			}//end if;
			
		}catch(SQLException se){
			se.printStackTrace();
		}
		
	}
	
}
