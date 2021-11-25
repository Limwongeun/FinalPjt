package kr.or.ddit.dao;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.dto.CommonAttachVO;

public interface CommonAttachDAO {
	//파일 첨부하기
	void insertCommonAttachList(CommonAttachVO commonAttach) throws SQLException;
	
	//seq nextval 가져오기
	int selectAttachSeqNextVal() throws SQLException;
	
	//공통파일번호에 해당하는 파일 목록 가져오기
	List<CommonAttachVO> selectAttachByFileSn(int file_sn) throws SQLException;
	
	// 다운을 위해 파일 한개의 정보 가져오기
	CommonAttachVO selectAttachForDown(CommonAttachVO commonAttach)throws SQLException;
	
	// 파일번호로 해당 파일 삭제하기
	void deleteAttachByFileSn(int file_sn) throws SQLException;
	
}
