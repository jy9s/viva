package attr;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import db.DbConn;

public class AdminAttractionDAO {
	
	private static AdminAttractionDAO aDAO;
	
	private AdminAttractionDAO() {
		
	}
	
	public static AdminAttractionDAO getInstance() {
		
		if(aDAO==null) {
			aDAO = new AdminAttractionDAO();
		}
		
		return aDAO;
	}
	
	
	/**
	 * 놀이기구 관리 전체 페이지 조회
	 * @param date
	 * @return
	 * @throws SQLException
	 */
	public List<AdminAttractionDTO> selectAttraction(String date, String attrName) throws SQLException {
		
		List<AdminAttractionDTO> list = new ArrayList<AdminAttractionDTO>();
		DbConn db = DbConn.getInstance("jdbc/dbcp");
		
		Connection con = null;
		PreparedStatement pstmt=null;
		ResultSet rs = null;
		
		try {
			con = db.getConn();
			StringBuilder selectQuery = new StringBuilder();
			selectQuery
			.append("select sub.attrac_num, attrac_name, attrac_preview attr_main, operate_state from ")
			.append("	(select attrac_num, attrac_name, attrac_preview from attraction) sub	")
			.append("	left join operate o on o.attrac_num = sub.attrac_num where operate_date= ? "); 
			if(attrName!=null && !attrName.isEmpty()) {
				selectQuery.append(" and instr(attrac_name, ? ) ! = 0 ");
			}
			selectQuery.append(" order by attrac_num ");
			pstmt=con.prepareStatement(selectQuery.toString());
			pstmt.setString(1, date);
			if(attrName!=null && !attrName.isEmpty()) {
				pstmt.setString(2, attrName);
			}
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				AdminAttractionDTO aDTO = new AdminAttractionDTO();
				aDTO.setAttrNum(rs.getInt("attrac_num"));
				aDTO.setAttrName(rs.getString("attrac_name"));
				aDTO.setAttrMain(rs.getString("attr_main"));
				aDTO.setAttrState(rs.getString("operate_state"));
				list.add(aDTO);
			}
		
		}finally {
			db.dbClose(rs, pstmt, con);
		}
		
		
		return list;
	}
	
	
	public AdminAttractionDTO selectDetailAttraction(String date, int num) throws SQLException {
		
		AdminAttractionDTO aDTO = new AdminAttractionDTO();
		DbConn db = DbConn.getInstance("jdbc/dbcp");
		
		Connection con = null;
		PreparedStatement pstmt=null;
		ResultSet rs = null;
		
		try {
			con = db.getConn();
			StringBuilder selectQuery = new StringBuilder();
			selectQuery
			.append("	select  attrac_name, attrac_loc, attrac_preview attr_main, attrac_back_img1, attrac_back_img2, operate_state,attrac_height,attrac_explian from ")
			.append("	(select * from attraction) sub left join operate o on o.attrac_num = sub.attrac_num where operate_date= ? and sub.attrac_num= ?		");
			pstmt=con.prepareStatement(selectQuery.toString());
			pstmt.setString(1, date);
			pstmt.setInt(2, num);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				aDTO.setAttrName(rs.getString("attrac_name"));
				aDTO.setAttrLoc(rs.getString("attrac_loc"));
				aDTO.setAttrMain(rs.getString("attr_main"));
				aDTO.setAttrPrev(rs.getString("attrac_back_img1"));
				aDTO.setAttrPrev2(rs.getString("attrac_back_img2"));
				aDTO.setAttrHeight(rs.getString("attrac_height"));
				aDTO.setAttrExplain(rs.getString("attrac_explian"));
				aDTO.setAttrState(rs.getString("operate_state"));
			}
		
		}finally {
			db.dbClose(rs, pstmt, con);
		}
		
		
		return aDTO;
	}
	
	
	public boolean updatePerform(AdminAttractionDTO aDTO) throws SQLException {
		
		boolean flag=false;
		
		Connection con = null;
		PreparedStatement pstmt = null;
		PreparedStatement pstmt2 = null;
		
		DbConn db = DbConn.getInstance("jdbc/dbcp");
		
		try {
		con = db.getConn();
		con.setAutoCommit(false);
		StringBuilder updateAttr = new StringBuilder();
		updateAttr
		.append(" update attraction				")
		.append(" set attrac_explian = ? , attrac_height = ? , attrac_preview = ?, attrac_back_img1 = ?,	attrac_back_img2 = ?	")
		.append("	where attrac_num = ? and attrac_name =?	");
		
		pstmt=con.prepareStatement(updateAttr.toString());
		pstmt.setString(1, aDTO.getAttrExplain());
		pstmt.setString(2, aDTO.getAttrHeight());
		pstmt.setString(3, aDTO.getAttrMain());
		pstmt.setString(4, aDTO.getAttrPrev());
		pstmt.setString(5, aDTO.getAttrPrev2());
		pstmt.setInt(6, aDTO.getAttrNum());
		pstmt.setString(7, aDTO.getAttrName());
		
		
		int flag1=pstmt.executeUpdate();
		
		StringBuilder updateOper = new StringBuilder();
		updateOper
		.append(" update operate	")
		.append(" set  operate_state = ? ")
		.append("	WHERE attrac_num = ?  AND operate_date >= ?  AND operate_date <= ?	");
		
		pstmt2=con.prepareStatement(updateOper.toString());
		pstmt2.setString(1, aDTO.getAttrState());
		pstmt2.setInt(2, aDTO.getAttrNum());
		pstmt2.setString(3, aDTO.getAttrStrDate());
		pstmt2.setString(4, aDTO.getAttrEndDate());
		
		int flag2=pstmt2.executeUpdate();
		
		
        
        if (flag1 > 0 && flag2 >= 0) {    	
        	con.commit();
        	flag = true;
        }else {
        	con.rollback();
        }
		
		}catch (Exception e) {
	        if (con != null) con.rollback();
	        e.printStackTrace(); // 이제 에러가 나면 여기서 찍힙니다.
		}finally {
			if(pstmt != null) try { pstmt.close(); } catch(Exception e) {}
	        if(pstmt2 != null) try { pstmt2.close(); } catch(Exception e) {}
	        if(con != null) try { con.close(); } catch(Exception e) {}
		}
        
		return flag;
		
	}//updatePerform
	
	
	
}
