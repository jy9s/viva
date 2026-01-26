package kr.co.viva.attr;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import kr.co.viva.notice.DbConn;


public class AttractionDAO {

	private static AttractionDAO aDAO;
	
	private AttractionDAO() {
		
		
	}//AttractionDAO
	
	public static AttractionDAO getInstance() {
		if(aDAO==null) {
			aDAO = new AttractionDAO();
		}//end if
		
		return aDAO;
		
	}//getInstance
	
	public List<AttractionDTO> selectAttrac() throws SQLException{
		
		AttractionDTO atDTO=null;
		List<AttractionDTO> list = new ArrayList<AttractionDTO>() ;
		
		DbConn dbCon = DbConn.getInstance("jdbc/dbcp");
		
		Connection con = null;
		PreparedStatement pstmt =null;
		ResultSet rs = null;
		
		try {
			con=dbCon.getConn();
			
			StringBuilder selectAttrac = new StringBuilder();
			
	
			/*
			 * selectAttrac.
			 * append("  SELECT a.ATTRAC_NUM, a.ATTRAC_NAME, a.ATTRAC_HEIGHT, a.ATTRAC_PREVIEW, a.ATTRAC_LOC, "
			 * );
			 * selectAttrac.append("         NVL(o.OPERATE_STATE, 'N') AS OPERATE_STATE ");
			 * selectAttrac.append("  FROM ATTRACTION a ");
			 * selectAttrac.append("  LEFT JOIN OPERATE o ");
			 * selectAttrac.append("    ON o.ATTRAC_NUM = a.ATTRAC_NUM ");
			 * selectAttrac.append("   AND trunc(o.OPERATE_DATE) = trunc(sysdate) ");
			 */
			selectAttrac
			.append(" SELECT a.ATTRAC_NUM, a.ATTRAC_NAME, a.ATTRAC_HEIGHT, a.ATTRAC_PREVIEW, a.ATTRAC_LOC, ")
			.append("        NVL(o.OPERATE_STATE, 'N') AS OPERATE_STATE ")
			.append(" FROM ATTRACTION a, OPERATE o ")
			.append(" WHERE a.ATTRAC_NUM = o.ATTRAC_NUM(+) ")
			.append("   AND TRUNC(o.OPERATE_DATE(+)) = TRUNC(SYSDATE) ");

			

			pstmt=con.prepareStatement(selectAttrac.toString());
			
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				atDTO=new AttractionDTO();
				atDTO.setAttracNum(rs.getInt("ATTRAC_NUM"));
				atDTO.setAttracName(rs.getString("ATTRAC_NAME"));
				atDTO.setAttracHeight(rs.getString("ATTRAC_HEIGHT"));
				atDTO.setAttracPrev(rs.getString("ATTRAC_PREVIEW"));
				atDTO.setAttracLoc(rs.getString("ATTRAC_LOC"));
				atDTO.setAttracState(rs.getString("OPERATE_STATE")); 
				
				
				list.add(atDTO);
			}//end while
			
		}finally {
			
			dbCon.dbClose(rs,pstmt,con);
		}//end finally
			
		
		return list;
		
	}//selectAttrac
	
	
	public AttractionDTO searchAttracDetail(int attracNum) throws SQLException {
		
		AttractionDTO aDTO = new AttractionDTO();
		
		DbConn dbCon = DbConn.getInstance("jdbc/dbcp");
		
		Connection con = null;
		PreparedStatement pstmt =null;
		ResultSet rs = null;
		
		try {
			con=dbCon.getConn();
			
			StringBuilder selectAttracDetail = new StringBuilder();
			
			selectAttracDetail
			.append("			select a.ATTRAC_NAME, a.ATTRAC_EXPLIAN, a.ATTRAC_CAPACITY, a.ATTRAC_HEIGHT,		")
			.append("		a.ATTRAC_LOC_IMG, a.ATTRAC_LOC, a.ATTRAC_PREVIEW, a.ATTRAC_BACK_IMG1, a.ATTRAC_BACK_IMG2,		")
			.append("		nvl(o.OPERATE_STATE,'N') OPERATE_STATE			")
			.append("			from ATTRACTION a , OPERATE o				")
			.append("		where a.ATTRAC_NUM = o.ATTRAC_NUM(+) and trunc(o.OPERATE_DATE(+))=Trunc(sysdate) and a.ATTRAC_NUM=?		");
			

			
			
			pstmt=con.prepareStatement(selectAttracDetail.toString());
			pstmt.setInt(1, attracNum);
			
			rs=pstmt.executeQuery();
			
			
			if (rs.next()) {
	            aDTO = new AttractionDTO();
	            aDTO.setAttracName(rs.getString("ATTRAC_NAME"));
	            aDTO.setAttracExplian(rs.getString("ATTRAC_EXPLIAN"));
	            aDTO.setAttracHeight(rs.getString("ATTRAC_HEIGHT"));
	            aDTO.setAttracCapac(rs.getInt("ATTRAC_CAPACITY"));
	            aDTO.setAttracLoc(rs.getString("ATTRAC_LOC"));
	            aDTO.setAttracLocImg(rs.getString("ATTRAC_LOC_IMG"));
	            aDTO.setAttracPrev(rs.getString("ATTRAC_PREVIEW"));
	            aDTO.setAttracBg(rs.getString("ATTRAC_BACK_IMG1"));
	            aDTO.setAttracBg2(rs.getString("ATTRAC_BACK_IMG2"));
	            aDTO.setAttracState(rs.getString("OPERATE_STATE"));
	        }//end if
	
			
			
		}finally {
			
			dbCon.dbClose(rs, pstmt, con);
			
		}//end finally
		
		return aDTO;
	}//ActtractionDTO
	
	
	public List<AttractionDTO> searchOperate(int attracNum) throws SQLException {
		AttractionDTO aDTO = null;
		List<AttractionDTO>  OperateDay= new ArrayList<AttractionDTO>();		
		
		DbConn dbCon = DbConn.getInstance("jdbc/dbcp");
		
		
		Connection con = null;
		PreparedStatement pstmt =null;
		ResultSet rs = null;
		
		try {
			con=dbCon.getConn();
		
		StringBuilder selectOper = new StringBuilder();
		selectOper
	/*	.append("	select a.ATTRAC_NAME, TO_CHAR(o.OPERATE_DATE,'DD\"일\"(DY)') OPERATE_DATE,o.OPERATE_STATE		")
		.append("	from OPERATE o,ATTRACTION a	")
									
		.append("	where o.ATTRAC_NUM = a.ATTRAC_NUM and a.ATTRAC_NUM=?	")
		.append("	and o.OPERATE_DATE>sysdate and o.OPERATE_DATE<sysdate+6	");*/
		
		.append("		select a.ATTRAC_NAME, TO_CHAR(o.OPERATE_DATE,'DD\"일\"(DY)') OPERATE_DATE,o.OPERATE_STATE		")
		.append("		from OPERATE o, ATTRACTION a		")
		.append("		where o.ATTRAC_NUM = a.ATTRAC_NUM and a.ATTRAC_NUM=?		")
		.append("		and trunc(o.OPERATE_DATE)>=trunc(sysdate)		")
		.append("		and trunc(o.OPERATE_DATE)<=trunc(sysdate+6)		");
		

		
		/*
		 * select a.ATTRAC_NAME,o.OPERATE_DATE,o.OPERATE_STATE from OPERATE o,
		 * ATTRACTION a where o.ATTRAC_NUM = a.ATTRAC_NUM and a.ATTRAC_NUM=1;
		 */
			
		
		pstmt=con.prepareStatement(selectOper.toString());
		pstmt.setInt(1, attracNum);
		rs=pstmt.executeQuery();
		
		while(rs.next()) {
			aDTO = new AttractionDTO();
			aDTO.setAttracOperDate(rs.getString("OPERATE_DATE"));
			
			
			OperateDay.add(aDTO);
			
			
		}//end while

		}finally {
			
			dbCon.dbClose(rs, pstmt, con);
		}//end finally
		
		return OperateDay;
		
	}//attractionOperate
	
	


	
}//class
