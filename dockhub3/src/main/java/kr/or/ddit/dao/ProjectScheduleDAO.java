package kr.or.ddit.dao;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.dto.ProjectScheduleVO;

public interface ProjectScheduleDAO {
	
	//MemberScheduleVO selectMemScheduleById(String id) throws SQLException;
	
	//일정 조회
	public List<ProjectScheduleVO> projectScheduleList(int prjct_sn) throws SQLException;
	//다가오는 일정
	public List<ProjectScheduleVO> commingScheList(int prjct_sn) throws SQLException;
	//일정 상세보기
	ProjectScheduleVO selectProjectSchedule(int prjct_schdul_sn) throws SQLException;
	//일정 추가
	public void insertProjectSchedule(ProjectScheduleVO project) throws SQLException;
	//일정 수정
	void updateProjectSchedule(ProjectScheduleVO project) throws SQLException;
	//일정 수정 드래그앤드랍
	void updateProjectScheduleByDrag(ProjectScheduleVO project) throws SQLException;
	//삭제
	void deleteProjectSchedule(int prjct_schdul_sn) throws SQLException;
	/*//
	public List<MemberScheduleVO> commingScheList(String mber_sn) throws SQLException;

	*/
	
	//시퀀스
	int getSeqNextValue() throws SQLException;

}
