package kr.or.ddit.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.or.ddit.command.PageMaker;
import kr.or.ddit.command.SearchCriteria;
import kr.or.ddit.dao.MeetingDAO;
import kr.or.ddit.dto.MeetingUserVO;
import kr.or.ddit.dto.MeetingVO;
import kr.or.ddit.dto.MemberVO;
import kr.or.ddit.dto.ProjectUserVO;
import kr.or.ddit.dto.RecruitApplyVO;

public class MeetingServiceImpl implements MeetingService {

	private MeetingDAO meetingDAO;
	public void setMeetingDAO(MeetingDAO meetingDAO) {
		this.meetingDAO = meetingDAO;
	}
	
	@Override
	public Map<String, Object> getChatList(int prjct_sn, SearchCriteria cri) throws SQLException {
		Map<String, Object> dataMap = new HashMap<String, Object>();
		cri.setPerPageNum(5);
		List<MeetingVO> chatMeetingList = meetingDAO.selectChatMeetingList(prjct_sn, cri);
		
		for (MeetingVO meetingVO : chatMeetingList) {
			int mtg_sn = meetingVO.getMtg_sn();
			List<MemberVO> memList = meetingDAO.selectMeetingUser(mtg_sn);
			meetingVO.setMemList(memList);
		}
		
		int cnt = meetingDAO.selectChatMeetingListTotalCount(prjct_sn);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(cnt);
		dataMap.put("chatMeetingList", chatMeetingList);
		dataMap.put("pageMaker", pageMaker);
		return dataMap;
	}
	
	@Override
	public Map<String, Object> getZoomList(int prjct_sn, SearchCriteria cri) throws SQLException {
		Map<String, Object> dataMap = new HashMap<String, Object>();
		cri.setPerPageNum(5);
		List<MeetingVO> zoomMeetingList = meetingDAO.selectZoomMeetingList(prjct_sn, cri);
		int cnt = meetingDAO.selectZoomMeetingListTotalCount(prjct_sn);
		
		for (MeetingVO meetingVO : zoomMeetingList) {
			int mtg_sn = meetingVO.getMtg_sn();
			List<MemberVO> memList = meetingDAO.selectMeetingUser(mtg_sn);
			meetingVO.setMemList(memList);
		}
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(cnt);
		dataMap.put("zoomMeetingList", zoomMeetingList);
		dataMap.put("pageMaker", pageMaker);
		
		return dataMap;
	}


	@Override
	public int regist(MeetingVO meeting) throws SQLException {
		int mtg_sn = meetingDAO.getSeqNextValue();
		
		meeting.setMtg_sn(mtg_sn);
		meetingDAO.insertMeeting(meeting);
		
		return mtg_sn;
	}

	@Override
	public List<ProjectUserVO> userList(int prjct_sn) throws SQLException {
		List<ProjectUserVO> userList = meetingDAO.selectUserFromProject(prjct_sn);
		return userList;
	}

	@Override
	public MeetingVO getMeeting(int mtg_sn) throws SQLException {
		
		MeetingVO meeting = meetingDAO.selectMeeting(mtg_sn);
		
		return meeting;
	}

	@Override
	public void remove(int mtg_sn) throws SQLException {
		meetingDAO.deleteMeeting(mtg_sn);
	}

	@Override
	public void modify(MeetingVO meeting) throws SQLException {
		meetingDAO.updateMeeting(meeting);
		
	}
	
	@Override
	public void insertMeetingUser(MeetingVO meeting) throws SQLException {
		
		meetingDAO.insertMeetingUser(meeting);
	}

	@Override
	public List<MemberVO> selectMeetingUser(int mtg_sn) throws SQLException {
		return meetingDAO.selectMeetingUser(mtg_sn);
	}

	@Override
	public void deleteMeetingUser(int mtg_sn) throws SQLException {
		meetingDAO.deleteMeetingUser(mtg_sn);
	}

	@Override
	public void updateMeetingSttus(MeetingVO meeting) throws SQLException {
		meetingDAO.updateMeetingSttus(meeting);
	}

	@Override
	public void insertMeetingMem(MeetingVO meeting) throws SQLException {
		meetingDAO.insertMeetingMem(meeting);
	}

	@Override
	public void deleteMeetingMem(MeetingVO meeting) throws SQLException {
		meetingDAO.deleteMeetingMem(meeting);		
	}

	@Override
	public List<MeetingVO> selectMeetingMember(int mtg_sn) throws SQLException {
		return meetingDAO.selectMeetingMember(mtg_sn);
	}

	@Override
	public void updateMeetingFile(MeetingVO meeting) throws SQLException {
		meetingDAO.updateMeetingFile(meeting);
	}

}
