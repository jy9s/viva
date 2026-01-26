package kr.co.viva.reserveHistory;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


public class ReserveHistoryService {
	private static ReserveHistoryService ms;
	
	private ReserveHistoryService() {
		
	}
	
	public static ReserveHistoryService getInstance() {
		if(ms==null) {
			ms = new ReserveHistoryService();
			
		}
		return ms;
	}
	
	/**
	 * 한 페이지에 보여질 수 
	 * @return
	 */
	public int pageScale() {
		return 7;
	}
	
	/**
	 * 총 페이지 수
	 * @param NoticeTotalCnt
	 * @param pageScale
	 * @return
	 */
	public int totalPage(int NoticeTotalCnt, int pageScale) {
		return (int)Math.ceil((double)NoticeTotalCnt/pageScale);
	}
	
	/**
	 * 페이지의 시작 번호
	 * @param currentPage
	 * @param pageScale
	 * @return
	 */
	public int startNum(int currentPage, int pageScale) {
		return (currentPage-1)*pageScale+1;
	}
	
	/**
	 * 페이지의 끝 번호
	 * @param startNum
	 * @param pageScale
	 * @return
	 */
	public int endNum(int startNum, int pageScale) {
		return startNum+pageScale-1;
	}
	
	public int searchReserveTotalCnt(int num, RangeDTO rDTO) {
		int NoticeTotalCnt = 0;
		ReserveHistoryDAO rDAO = ReserveHistoryDAO.getInstance();
		try {
			NoticeTotalCnt = rDAO.selectReserveTotalCnt(num ,rDTO);
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} 
		return NoticeTotalCnt;
	}
	
	public List<ReserveHistoryDTO> searchReserve(int num,RangeDTO rDTO) {
		List<ReserveHistoryDTO> list = new ArrayList<ReserveHistoryDTO>();
		ReserveHistoryDAO rhDAO = ReserveHistoryDAO.getInstance();
			try {
				list=rhDAO.selectReserve(num ,rDTO);
				for(ReserveHistoryDTO rhDTO : list) {
					if(rhDTO.getTitle().length()>15) {
						rhDTO.setTitle(rhDTO.getTitle().substring(0,13)+"...");
					}//end if
				}//end for
			} catch (SQLException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}//end catch
				return list;
	}//searchNotice
	
	public ReserveDetailDTO searchReserveDetail(int noticeNum) {
		ReserveDetailDTO rdDTO = new ReserveDetailDTO();
		ReserveHistoryDAO nDAO = ReserveHistoryDAO.getInstance();
			try {
				rdDTO=nDAO.selectReserveDetail(noticeNum);
			} catch (SQLException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}//end catch
				return rdDTO;
	}//searchNotice
	
	
	public String pagination(RangeDTO rDTO) {
		StringBuilder pagination = new StringBuilder();

		int pageNumber = 3;
		
		int startPage = ((rDTO.getCurrentPage()-1)/pageNumber)*pageNumber+1;
		int endPage = startPage+pageNumber-1;
		if(endPage > rDTO.getTotalPage()) {
			endPage=rDTO.getTotalPage();
		}
		
		int movePage = 0 ;
		StringBuilder previewPage = new StringBuilder();
		if(startPage>1) {
		movePage = startPage - 1;
		previewPage.append("<a class='page-link' href='Notice.jsp?currentPage=").append(movePage);
		if(rDTO.getKeyword()!=null) {
			previewPage.append("&keyword=").append(rDTO.getKeyword());
		}
		previewPage.append("'>&lt;&lt;</a>");
		}//end if
		
		//if(rDTO.getTotalPage()>=endPage) {
		StringBuilder pageLink = new StringBuilder();
		movePage = startPage;
		while(movePage <= endPage) {
			if(rDTO.getCurrentPage()==movePage) {
				pageLink.append("<a class='page-link' href='").append(rDTO.getUrl()).append("?currentPage=").append(movePage);
				if(rDTO.getKeyword()!=null) {
					pageLink.append("&keyword=").append(rDTO.getKeyword());
				}
				pageLink.append("'>").append("<span style='font-weight:bold'>").append(movePage).append("</span>").append("</a>");
			}else {
				
			pageLink.append("<a class='page-link' href='").append(rDTO.getUrl()).append("?currentPage=").append(movePage);
			if(rDTO.getKeyword()!=null) {
				pageLink.append("&keyword=").append(rDTO.getKeyword());
			}//end if
			pageLink.append("'>").append(movePage).append("</a>");
			}//end else
			movePage++;
		}//end for
		StringBuilder nextPage = new StringBuilder();
		if(endPage < rDTO.getTotalPage()) {
			movePage = endPage + 1;
			nextPage.append("<a class='page-link' href='Notice.jsp?currentPage=").append(movePage);
			if(rDTO.getKeyword()!=null) {
				nextPage.append("&keyword=").append(rDTO.getKeyword());
			}
			nextPage.append("'>&gt;&gt;</a>");
		}//end if
		//}//end if
		pagination.append(previewPage).append(pageLink).append(nextPage);
		return pagination.toString();
	}
	
	public boolean modifyRefundState(int resNum) {
		boolean flag = false;
		ReserveHistoryDAO nDAO = ReserveHistoryDAO.getInstance();
			try {
				flag=nDAO.updateRefundState(resNum)==1;
			} catch (SQLException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}//end catch
				return flag;
	}//searchNotice
}//NoticeService
