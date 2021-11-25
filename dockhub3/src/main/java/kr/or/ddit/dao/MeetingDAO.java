package kr.or.ddit.dao;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.command.SearchCriteria;
import kr.or.ddit.dto.MeetingUserVO;
import kr.or.ddit.dto.MeetingVO;
import kr.or.ddit.dto.MemberVO;
import kr.or.ddit.dto.ProjectUserVO;

public interface MeetingDAO {

	List<MeetingVO> selectChatMeetingList(int prjct_sn, SearchCriteria cri) throws SQLException;
	int selectChatMeetingListTotalCount(int prjct_sn) throws SQLException;
	
	List<MeetingVO> selectZoomMeetingList(int prjct_sn, SearchCriteria cri) throws SQLException;
	int selectZoomMeetingListTotalCount(int prjct_sn) throws SQLException;
	
	//추가
	public void insertMeeting(MeetingVO meeting) throws SQLException;
	
	//시퀀스
	int getSeqNextValue() throws SQLException;
	
	//상세조회
	MeetingVO selectMeeting(int mtg_sn) throws SQLException;
	
	//구성원 조회
	List<MemberVO> selectMeetingUser(int mtg_sn) throws SQLException;
	
	List<ProjectUserVO> selectUserFromProject(int prjct_sn) throws SQLException;
	//int selectMeetingCriteriaTotalCount(SearchCriteria cri) throws SQLException;
	
	void deleteMeeting (int mtg_sn) throws SQLException;

	void updateMeeting(MeetingVO meeting) throws SQLException;
	
	public void insertMeetingUser(MeetingVO meeting) throws SQLException;
	
	void deleteMeetingUser(int mtg_sn) throws SQLException;
	
	void updateMeetingSttus(MeetingVO meeting) throws SQLException;
	
	void updateMeetingIp(MeetingVO meeting) throws SQLException;
	
	void insertMeetingMem(MeetingVO meeting) throws SQLException;
	
	void deleteMeetingMem(MeetingVO meeting) throws SQLException;
	
	List<MeetingVO> selectMeetingMember(int mtg_sn) throws SQLException;
	
	void updateMeetingFile(MeetingVO meeting) throws SQLException;
}
