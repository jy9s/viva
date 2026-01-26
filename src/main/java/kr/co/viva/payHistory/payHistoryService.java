package kr.co.viva.payHistory;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


public class payHistoryService {
	private static payHistoryService ms;
	
	private payHistoryService() {
		
	}
	
	public static payHistoryService getInstance() {
		if(ms==null) {
			ms = new payHistoryService();
			
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
	
	public int payHistoryTotalCnt(int num, RangeDTO rDTO) {
		int payHistoryTotalCnt = 0;
		payHistoryDAO rDAO = payHistoryDAO.getInstance();
		try {
			payHistoryTotalCnt = rDAO.payHistoryTotalCnt(num ,rDTO);
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} 
		return payHistoryTotalCnt;
	}
	
	public List<payHistoryDTO> searchPayHistory(int num,RangeDTO rDTO) {
		List<payHistoryDTO> list = new ArrayList<payHistoryDTO>();
		payHistoryDAO rhDAO = payHistoryDAO.getInstance();
			try {
				list=rhDAO.selectPayHistory(num ,rDTO);
			} catch (SQLException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}//end catch
				return list;
	}//searchPayHistory
	
	public payHistoryDTO searchPayDetail(int noticeNum) {
		payHistoryDTO phDTO = new payHistoryDTO();
		payHistoryDAO nDAO = payHistoryDAO.getInstance();
			try {
				phDTO=nDAO.payDetail(noticeNum);
			} catch (SQLException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}//end catch
				return phDTO;
	}//searchPayHistory
	
	
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
		if(rDTO.getStartDate()!=null) {
			if(rDTO.getEndDate()!=null) {
			previewPage.append("&startDate=").append(rDTO.getStartDate()).append("&endDate=").append(rDTO.getEndDate());
				}
			}
		previewPage.append("'>&lt;&lt;</a>");
		}//end if
		
		//if(rDTO.getTotalPage()>=endPage) {
		StringBuilder pageLink = new StringBuilder();
		movePage = startPage;
		while(movePage <= endPage) {
			if(rDTO.getCurrentPage()==movePage) {
				pageLink.append("<a class='page-link' href='").append(rDTO.getUrl()).append("?currentPage=").append(movePage);
				if(rDTO.getStartDate()!=null) {
					if(rDTO.getEndDate()!=null) {
						pageLink.append("&startDate=").append(rDTO.getStartDate()).append("&endDate=").append(rDTO.getEndDate());
						}
					}
				pageLink.append("'>").append("<span style='font-weight:bold'>").append(movePage).append("</span>").append("</a>");
			}else {
				
			pageLink.append("<a class='page-link' href='").append(rDTO.getUrl()).append("?currentPage=").append(movePage);
			if(rDTO.getStartDate()!=null) {
				if(rDTO.getEndDate()!=null) {
					pageLink.append("&startDate=").append(rDTO.getStartDate()).append("&endDate=").append(rDTO.getEndDate());
					}
				}
			pageLink.append("'>").append(movePage).append("</a>");
			}//end else
			movePage++;
		}//end for
		StringBuilder nextPage = new StringBuilder();
		if(endPage < rDTO.getTotalPage()) {
			movePage = endPage + 1;
			nextPage.append("<a class='page-link' href='Notice.jsp?currentPage=").append(movePage);
			if(rDTO.getStartDate()!=null) {
				if(rDTO.getEndDate()!=null) {
					nextPage.append("&startDate=").append(rDTO.getStartDate()).append("&endDate=").append(rDTO.getEndDate());
					}
				}
			nextPage.append("'>&gt;&gt;</a>");
		}//end if
		//}//end if
		pagination.append(previewPage).append(pageLink).append(nextPage);
		return pagination.toString();
	}
	
}//NoticeService
