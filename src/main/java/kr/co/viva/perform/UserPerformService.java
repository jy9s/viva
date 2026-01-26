package kr.co.viva.perform;

import java.sql.SQLException;
import java.util.List;


public class UserPerformService {

    private UserPerformDAO dao;

    public UserPerformService() {
        dao = UserPerformDAO.getInstance();
    }

    // 공연 전체 목록
    public List<PerformDTO> getPerformList() throws SQLException {
        return dao.selectUserPerform();
    }
    // 공연 게시판
    public int totalCount(String filter) throws SQLException {
        return dao.selectTotalCount(filter);
    }

    public List<PerformDTO> getPerformListPaging(String filter, int startNum, int endNum) throws SQLException {
        return dao.selectPerformListPaging(filter, startNum, endNum);
    }


    // 타입별 공연 목록
    public List<PerformDTO> getPerformListByType(int perfType) throws SQLException {
        return dao.selectUserPerform(perfType);
    }

    // 공연 상세
    public PerformDTO getPerformDetail(int perfNum) throws SQLException {
        return dao.selectDetailPerform(perfNum);
    }

    // 회원 예약 상세
    public PerformReserveDTO getMemberReserveDetail(int memberNum) throws SQLException {
        return dao.selectMemberReserveDetail(memberNum);
    }

    // 공연 예약 + 결제
    public boolean reservePerform(PerformReserveDTO prDTO) throws SQLException {
        int result = dao.insertPerfReserve(prDTO);
        return result > 0;
    }
}
