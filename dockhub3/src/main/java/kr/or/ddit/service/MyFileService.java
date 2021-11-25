package kr.or.ddit.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.command.SearchCriteria;
import kr.or.ddit.dto.FileSaveVO;

public interface MyFileService {	
	//리스트 보기
	Map<String, Object> getFileList(SearchCriteria cri) throws SQLException;
	
	//회원 번호로 폴더목록 가져오기
	List<FileSaveVO> selectIcon(String mber_sn) throws SQLException;

	//파일 번호로 프로젝트 번호 가져오기
	int selectPrjctByFile(int filesave_sn) throws SQLException;
	
	//리스트 보기
	Map<String, Object> getFileList1(FileSaveVO file, SearchCriteria cri) throws SQLException;

}
