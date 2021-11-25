package kr.or.ddit.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.sun.corba.se.impl.encoding.CodeSetConversion.BTCConverter;

import kr.or.ddit.command.SearchCriteria;
import kr.or.ddit.dto.MeetingUserVO;
import kr.or.ddit.dto.MeetingVO;
import kr.or.ddit.dto.MemberVO;
import kr.or.ddit.dto.MilestoneVO;
import kr.or.ddit.dto.ProjectUserVO;

public class MeetingDAOImpl implements MeetingDAO {

	private SqlSession session;
	public void setSession(SqlSession session) {
		this.session = session;
	}
	
	
	@Override
	public List<MeetingVO> selectChatMeetingList(int prjct_sn, SearchCriteria cri) throws SQLException {
		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		List<MeetingVO> meetingList = session.selectList("Meeting-Mapper.selectChatMeetingList",prjct_sn, rowBounds);
		
		return meetingList;
	}
	@Override
	public int selectChatMeetingListTotalCount(int prjct_sn) throws SQLException {
		return session.selectOne("Meeting-Mapper.selectChatMeetingListTotalCount", prjct_sn);
	}
	
	@Override
	public List<MeetingVO> selectZoomMeetingList(int prjct_sn, SearchCriteria cri) throws SQLException {
		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		List<MeetingVO> meetingList = session.selectList("Meeting-Mapper.selectZoomMeetingList",prjct_sn, rowBounds);
		
		return meetingList;
	}
	@Override
	public int selectZoomMeetingListTotalCount(int prjct_sn) throws SQLException {
		return session.selectOne("Meeting-Mapper.selectZoomMeetingListTotalCount", prjct_sn);
	}
	
	@Override
	public void insertMeeting(MeetingVO meeting) throws SQLException {
		session.update("Meeting-Mapper.insertMeeting",meeting);
	}


	@Override
	public int getSeqNextValue() throws SQLException {
		int mtg_sn = session.selectOne("Meeting-Mapper.selectMeetingSeqNext");
		return mtg_sn;
	}

	

	@Override
	public List<ProjectUserVO> selectUserFromProject(int prjct_sn) throws SQLException {
		List<ProjectUserVO> userList = session.selectList("Meeting-Mapper.selectUserFromProject",prjct_sn);
		
		return userList;
	}


	@Override
	public MeetingVO selectMeeting(int mtg_sn) throws SQLException {
		MeetingVO selectMeeting = session.selectOne("Meeting-Mapper.selectMeetingByMtg_sn",mtg_sn);
		return selectMeeting;
	}


	@Override
	public void deleteMeeting(int mtg_sn) throws SQLException {
		session.update("Meeting-Mapper.deleteMeeting",mtg_sn);
		
	}

/*	@Override
	public int selectMeetingCriteriaTotalCount(SearchCriteria cri) throws SQLException {

		int cnt = session.selectOne("Meeting-Mapper.selectMeetingCriteriaTotalCount",cri);
		return cnt;
	}*/
	
	@Override
	public void updateMeeting(MeetingVO meeting) throws SQLException{
		session.update("Meeting-Mapper.updateMeeting",meeting);
	}


	@Override
	public void insertMeetingUser(MeetingVO meeting) throws SQLException {
		session.update("Meeting-Mapper.insertMeetingUser",meeting);
	}


	@Override
	public List<MemberVO> selectMeetingUser(int mtg_sn) throws SQLException {
		return session.selectList("Meeting-Mapper.selectMeetingUserByMtg_sn",mtg_sn);
	}


	@Override
	public void deleteMeetingUser(int mtg_sn) throws SQLException {
		session.update("Meeting-Mapper.deleteMeetingUser",mtg_sn);
	}

	@Override
	public void updateMeetingSttus(MeetingVO meeting) throws SQLException {
		session.update("Meeting-Mapper.updateMeetingSttus", meeting);
	}


	@Override
	public void updateMeetingIp(MeetingVO meeting) throws SQLException {
		session.update("Meeting-Mapper.updateMeetingIp", meeting);
		
	}


	@Override
	public void insertMeetingMem(MeetingVO meeting) throws SQLException {
		session.update("Meeting-Mapper.insertMeetingMem", meeting);
	}


	@Override
	public void deleteMeetingMem(MeetingVO meeting) throws SQLException {
		session.update("Meeting-Mapper.deleteMeetingMem", meeting);
		
	}


	@Override
	public List<MeetingVO> selectMeetingMember(int mtg_sn) throws SQLException {
		return session.selectList("Meeting-Mapper.selectMeetingMember",mtg_sn);
	}


	@Override
	public void updateMeetingFile(MeetingVO meeting) throws SQLException {
		session.update("Meeting-Mapper.updateMeetingFile", meeting);
	}

}
