package kr.co.viva.inquiry;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;



public class InquiryService {
	private static InquiryService ms;
	
	private InquiryService() {
		
	}
	
	public static InquiryService getInstance() {
		if(ms==null) {
			ms = new InquiryService();
			
		}
		return ms;
	}
	
	public boolean addInquiry(InquiryDTO iDTO) {
		boolean flag = false;
		InquiryDAO iDAO = InquiryDAO.getInstance();
			try {
				flag=iDAO.insertInquiry(iDTO)==1;
			} catch (SQLException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}//end catch
				return flag;
	}//searchNotice
	
	public int searchMemberNum(String id) {
		int num = 0;
		InquiryDAO iDAO = InquiryDAO.getInstance();
			try {
				num=iDAO.selectMemberNum(id);
			} catch (SQLException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}//end catch
				return num;
	}//searchNotice
	
	
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
	
	public int searchInquiryTotalCnt(int num) {
		int NoticeTotalCnt = 0;
		InquiryDAO iDAO = InquiryDAO.getInstance();
		try {
			NoticeTotalCnt = iDAO.selectInquiryTotalCnt(num);
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} 
		return NoticeTotalCnt;
	}
	
	public List<InquiryDTO> searchInquiry(RangeDTO rDTO, int num) {
		List<InquiryDTO> list = new ArrayList<InquiryDTO>();
		InquiryDAO iDAO = InquiryDAO.getInstance();
			try {
				list=iDAO.selectInquiry(rDTO, num);
				for(InquiryDTO iDTO : list) {
					if(iDTO.getTitle().length()>15) {
						iDTO.setTitle(iDTO.getTitle().substring(0,13)+"...");
					}//end if
				}//end for
			} catch (SQLException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}//end catch
				return list;
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
		previewPage.append("<a class='page-link' href='").append(rDTO.getUrl()).append("?currentPage=").append(movePage);
		previewPage.append("'>&lt;&lt;</a>");
		}//end if
		
		//if(rDTO.getTotalPage()>=endPage) {
		StringBuilder pageLink = new StringBuilder();
		movePage = startPage;
		while(movePage <= endPage) {
			if(rDTO.getCurrentPage()==movePage) {
				pageLink.append("<a class='page-link' href='").append(rDTO.getUrl()).append("?currentPage=").append(movePage);
				pageLink.append("'>").append("<span style='font-weight:bold'>").append(movePage).append("</span>").append("</a>");
			}else {
			pageLink.append("<a class='page-link' href='").append(rDTO.getUrl()).append("?currentPage=").append(movePage);
			pageLink.append("'>").append(movePage).append("</a>");
			}
			movePage++;
		}//end for
		StringBuilder nextPage = new StringBuilder();
		if(endPage < rDTO.getTotalPage()) {
			movePage = endPage + 1;
			nextPage.append("<a class='page-link' href='").append(rDTO.getUrl()).append("?currentPage=").append(movePage);
			nextPage.append("'>&gt;&gt;</a>");
		}//end if
		pagination.append(previewPage).append(pageLink).append(nextPage);
		return pagination.toString();
	}
	
	public InquiryDTO searchInquiryDetail(int inquiryNum) {
		InquiryDTO iDTO = new InquiryDTO();
		InquiryDAO iDAO = InquiryDAO.getInstance();
			try {
				iDTO=iDAO.selectInquiryDetail(inquiryNum);
				
			} catch (SQLException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}//end catch
				return iDTO;
	}//searchNotice
	
	public boolean deleteInquiry(int iquNum,int memberNum) {
		boolean flag = false;
		InquiryDAO iDAO = InquiryDAO.getInstance();
		try {
			flag = iDAO.deleteInquiry(iquNum,memberNum)==1;
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} 
		return flag;
	}//deleteInquiry
	
	public boolean modifyInquiry(InquiryDTO iDTO) {
		boolean flag = false;
		InquiryDAO iDAO = InquiryDAO.getInstance();
		try {
			flag = iDAO.updateInquiry(iDTO)==1;
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} 
		return flag;
	}//modifyInquiry
	
	
}//InquiryService
