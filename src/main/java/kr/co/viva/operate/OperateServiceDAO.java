package kr.co.viva.operate;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import kr.co.viva.notice.DbConn;


public class OperateServiceDAO {

	private static OperateServiceDAO osDAO;
	
	private OperateServiceDAO() {
		
	}//OperateServiceDAO
	
	public static OperateServiceDAO getInstance() {
		
		if(osDAO==null) {
			osDAO=new OperateServiceDAO();
		}//end if 
		return osDAO;
	}//getInstance
	
	
	public List<OperateServiceDTO> selectAtrraction(String selectDate) throws SQLException{
		List<OperateServiceDTO> list = new ArrayList<OperateServiceDTO>();
		OperateServiceDTO osDTO = null; 
		DbConn db = DbConn.getInstance("jdbc/dbcp");
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs  = null;
		
		try {
			con=db.getConn();
			StringBuilder selectAtrracOper = new StringBuilder();
			selectAtrracOper
			.append("		SELECT a.ATTRAC_NUM, a.ATTRAC_NAME, a.ATTRAC_PREVIEW, o.OPERATE_STATE			")
			.append("		FROM ATTRACTION a, OPERATE o			")
			.append("		where o.ATTRAC_NUM(+) = a.ATTRAC_NUM AND trunc(o.OPERATE_DATE(+)) = trunc(to_date(?,'yyyy-MM-dd')) and o.OPERATE_STATE='Y'			");

			pstmt=con.prepareStatement(selectAtrracOper.toString());
			
			pstmt.setString(1,selectDate);
			
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				osDTO= new OperateServiceDTO();
				osDTO.setAttracNum(rs.getInt("ATTRAC_NUM"));
				osDTO.setAttracName(rs.getString("ATTRAC_NAME"));
				osDTO.setAttracPreview(rs.getString("ATTRAC_PREVIEW"));
				osDTO.setOprateState(rs.getString("OPERATE_STATE"));
				
				list.add(osDTO);
				
			}//end while
			
		}finally {
			db.dbClose(rs, pstmt, con);
		}//end finally

		return list;
		
	}//selectAtrraction
	
	
	
}//class
