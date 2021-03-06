package admin.model;

import java.sql.SQLException;
import java.util.*;

import member.model.MemberVO;


public interface InterAdminDAO {
	
		// 관리자 로그인을 해주는 메소드
		AdminVO loginAdmin(Map<String, String> paraMap) throws SQLException;

		// 관리자등록을 해주는 메소드(tbl_admin 테이블에 insert)
		int adminRegister(AdminVO admin) throws SQLException;

		// ID 중복검사 (tbl_member 테이블에서 userid 가 존재하면 true를 리턴해주고, userid 가 존재하지 않으면 false를 리턴한다)
		boolean idDuplicateCheck(String adId) throws SQLException;

		// Email 중복검사 (tbl_member 테이블에서 email 이 존재하면 true를 리턴해주고, email 이 존재하지 않으면 false를 리턴한다)
		boolean emailDuplicateCheck(String email) throws SQLException;

		// 페이징처리를 위해서 전체회원에 대한 총페이지 개수 알아오기(select)
		int selectTotalPage(Map<String, String> paraMap) throws SQLException;

		// 페이징 처리를 한 모든 회원 또는 검색한 회원 목록 보여주기
		List<MemberVO> seletPagingMember(Map<String, String> paraMap) throws SQLException;

		// userid 값을 입력받아 회원 1명에 대한 상세정보 알아오기(select)
		MemberVO memberOneDetail(String userid) throws SQLException;

		// 아이디 찾기
		String findUserid(Map<String, String> paraMap) throws SQLException;

		// 비번찾기
		boolean isUserExist(Map<String, String> paraMap) throws SQLException;
}
