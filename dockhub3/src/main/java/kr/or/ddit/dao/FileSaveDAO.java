package kr.or.ddit.dao;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.command.SearchCriteria;
import kr.or.ddit.dto.FileSaveVO;

public interface FileSaveDAO {
	//프로젝트 번호로 파일들 가져오기
	List<FileSaveVO> selectFileSaveByPrjctSn(int sn) throws SQLException;
	
	//회원 번호로 파일들 가져오기
	List<FileSaveVO> selectFileSaveByMber(String filesave_crtr) throws SQLException;
	
	//node이동 저장 
	void updateNodeMove(FileSaveVO fileSaveVo) throws SQLException;
	
	//node 삭제
	void deleteNode(FileSaveVO fileSaveVo) throws SQLException;
	
	//node이름변경 
	void renameNode(FileSaveVO fileSaveVo) throws SQLException;
	//node추가
	void createNode(FileSaveVO fileSaveVo) throws SQLException;
	
	//부모node가져오기
	FileSaveVO getParent(int prjct_sn) throws SQLException;
	
	//파일번호로 파일 목록 가져오기
	List<FileSaveVO> getFileList(int upper_file_sn,SearchCriteria cri) throws SQLException;
	
	//파일 갯수 가져오기
	int fileCnt(int upper_file_sn)throws SQLException;
	
	//파일 업로드
	void fileUpload(FileSaveVO fileSave) throws SQLException;
	
	//파일번호로 파일 가져오기
	FileSaveVO selectFileByFileSn(int filesave_sn) throws SQLException;

	//번호로 이름 가져오기
	String selectParentByFileSn(int filesave_sn) throws SQLException;
	
	//파일 권한 업데이트
	void updateAuthor(FileSaveVO file) throws SQLException;
	
	
}



