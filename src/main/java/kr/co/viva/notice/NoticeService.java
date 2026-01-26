package kr.co.viva.notice;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import kr.co.viva.inquiry.InquiryDTO;

public class NoticeService {
	private static NoticeService ms;
	
	private NoticeService() {
		
	}
	
	public static NoticeService getInstance() {
		if(ms==null) {
			ms = new NoticeService();
			
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
	
	public int searchNoticeTotalCnt(RangeDTO rDTO) {
		int NoticeTotalCnt = 0;
		NoticeDAO nDAO = NoticeDAO.getInstance();
		try {
			NoticeTotalCnt = nDAO.selectNoticeTotalCnt(rDTO);
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} 
		return NoticeTotalCnt;
	}
	
	public List<NoticeDTO> searchNotice(RangeDTO rDTO) {
		List<NoticeDTO> list = new ArrayList<NoticeDTO>();
		NoticeDAO nDAO = NoticeDAO.getInstance();
			try {
				list=nDAO.selectNotice(rDTO);
				for(NoticeDTO nDTO : list) {
					if(nDTO.getTitle().length()>25) {
						nDTO.setTitle(nDTO.getTitle().substring(0,23)+"...");
					}
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}//end catch
				return list;
	}//searchNotice
	
	public NoticeDTO searchNoticeDetail(int noticeNum) {
		NoticeDTO nDTO = new NoticeDTO();
		NoticeDAO nDAO = NoticeDAO.getInstance();
			try {
				nDTO=nDAO.selectNoticeDetail(noticeNum);
				
			} catch (SQLException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}//end catch
				return nDTO;
	}//searchNotice
	
	public boolean modifyCnt(int noticeNum) {
		boolean flag = false;
		NoticeDAO nDAO = NoticeDAO.getInstance();
			try {
				flag=nDAO.updateCnt(noticeNum)==1;
			} catch (SQLException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}//end catch
				return flag;
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
		if(rDTO.getCategory()!=null) {
			previewPage.append("&category=").append(rDTO.getCategory());
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
				if(rDTO.getCategory()!=null) {
					pageLink.append("&category=").append(rDTO.getCategory());
				}
				pageLink.append("'>").append("<span style='font-weight:bold'>").append(movePage).append("</span>").append("</a>");
			}else {
				
			pageLink.append("<a class='page-link' href='").append(rDTO.getUrl()).append("?currentPage=").append(movePage);
			if(rDTO.getKeyword()!=null) {
				pageLink.append("&keyword=").append(rDTO.getKeyword());
			}
			if(rDTO.getCategory()!=null) {
			pageLink.append("&category=").append(rDTO.getCategory());
			}
			pageLink.append("'>").append(movePage).append("</a>");
			}
			movePage++;
		}//end for
		StringBuilder nextPage = new StringBuilder();
		if(endPage < rDTO.getTotalPage()) {
			movePage = endPage + 1;
			nextPage.append("<a class='page-link' href='Notice.jsp?currentPage=").append(movePage);
			if(rDTO.getKeyword()!=null) {
				nextPage.append("&keyword=").append(rDTO.getKeyword());
			}
			if(rDTO.getCategory()!=null) {
				nextPage.append("&category=").append(rDTO.getCategory());
			}
			nextPage.append("'>&gt;&gt;</a>");
		}//end if
		//}//end if
		pagination.append(previewPage).append(pageLink).append(nextPage);
		return pagination.toString();
	}
	
}//NoticeService
