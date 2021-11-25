package kr.or.ddit.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.command.SearchCriteria;
import kr.or.ddit.dto.MeetingUserVO;
import kr.or.ddit.dto.MeetingVO;
import kr.or.ddit.dto.MemberVO;
import kr.or.ddit.dto.ProjectUserVO;

public interface MeetingService {
	
	//리스트 조회
	Map<String, Object> getChatList(int prjct_sn,SearchCriteria cri) throws SQLException;
	Map<String, Object> getZoomList(int prjct_sn,SearchCriteria cri) throws SQLException;
	
	public int regist(MeetingVO meeting) throws SQLException;
	
	//상세 조회
	MeetingVO getMeeting(int mtg_sn) throws SQLException;
	
	//구성원 조회
	List<MemberVO> selectMeetingUser(int mtg_sn) throws SQLException;
	
	//유저조회
	List<ProjectUserVO> userList(int prjct_sn) throws SQLException;
	
	//삭제
	void remove(int mtg_sn) throws SQLException;
	
	void modify(MeetingVO meeting) throws SQLException;
	
	void insertMeetingUser(MeetingVO meeting) throws SQLException;
	
	void deleteMeetingUser(int mtg_sn) throws SQLException;
	
	void updateMeetingSttus(MeetingVO meeting) throws SQLException;
	
	void insertMeetingMem(MeetingVO meeting) throws SQLException;
	
	void deleteMeetingMem(MeetingVO meeting) throws SQLException;
	
	List<MeetingVO> selectMeetingMember(int mtg_sn) throws SQLException;
	
	void updateMeetingFile(MeetingVO meeting) throws SQLException;
}
