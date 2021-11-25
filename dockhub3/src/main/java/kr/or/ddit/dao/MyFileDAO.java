package kr.or.ddit.dao;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.command.SearchCriteria;
import kr.or.ddit.dto.FileSaveVO;

public interface MyFileDAO {
	//회원 번호로 파일들 가져오기
	List<FileSaveVO> selectFileByMberSn(SearchCriteria cri) throws SQLException;
	
	//파일 갯수 가져오기
	int fileCnt(String mber_sn)throws SQLException;
	
	//회원 번호로 폴더목록 가져오기
	List<FileSaveVO> selectIcon(String mber_sn) throws SQLException;
	
	//파일 번호로 프로젝트 번호 가져오기
	int selectPrjctByFile(int filesave_sn) throws SQLException;
	
	//파일번호로 파일 목록 가져오기
	List<FileSaveVO> getFileList(FileSaveVO file,SearchCriteria cri) throws SQLException;
	//파일 갯수 가져오기
	int fileCnt1(FileSaveVO file)throws SQLException;

}



