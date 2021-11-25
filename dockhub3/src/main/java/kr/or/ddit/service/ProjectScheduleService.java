package kr.or.ddit.service;

import java.sql.SQLException;
import java.util.Map;

import kr.or.ddit.dto.ProjectScheduleVO;

public interface ProjectScheduleService {

	//프로젝트 일정 조회
	Map<String, Object> selectProjectList(int prjct_sn) throws SQLException;
	//다가오는 일정
	Map<String, Object> commingScheList(int prjct_sn) throws SQLException;
	//상세조회
	ProjectScheduleVO getSchedule(int prjct_schdul_sn) throws SQLException;
	
	//등록
	public void regist(ProjectScheduleVO project) throws SQLException;

	//일정 수정
	void modify(ProjectScheduleVO project) throws SQLException;
	
	//일정 수정
	void modifyByDrag(ProjectScheduleVO project) throws SQLException;
	//일정 삭제
	void remove(int prjct_schdul_sn) throws SQLException;

	/*//멤버 일정 조회
	Map<String, Object> commingScheList(String mber_sn) throws SQLException;

	
	
*/}
