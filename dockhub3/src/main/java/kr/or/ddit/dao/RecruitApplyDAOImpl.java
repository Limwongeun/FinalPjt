package kr.or.ddit.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.command.SearchCriteria;
import kr.or.ddit.dto.ProjectVO;
import kr.or.ddit.dto.RecruitApplyVO;
import kr.or.ddit.dto.RecruitVO;

public class RecruitApplyDAOImpl implements RecruitApplyDAO {
	
	private SqlSession session;
	public void setSqlSession(SqlSession session) {
		this.session=session;
	}
	
	@Override
	public List<RecruitApplyVO> myRecruitApplyList(String mber_sn) throws SQLException {
		return session.selectList("RecruitApply-Mapper.selectSearchRecruitList",mber_sn);
	}

	@Override
	public int selectApplyByMberPrjct(RecruitApplyVO recruitApply) throws SQLException {
		return session.selectOne("RecruitApply-Mapper.selectApplyByMberPrjct",recruitApply);
	}

	@Override
	public void insertRecruitApply(RecruitApplyVO recruitApply) throws SQLException {
		session.insert("RecruitApply-Mapper.insertRecruitApply", recruitApply);
	}

	@Override
	public List<RecruitApplyVO> selectApplyRecruitList(String pblanc_sport_man_sn, SearchCriteria cri) throws SQLException {
		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);
		return session.selectList("RecruitApply-Mapper.selectApplyRecruitList", pblanc_sport_man_sn,rowBounds);
	}

	@Override
	public int selectApplyRecruitCnt(String pblanc_sport_man_sn) throws SQLException {

		return session.selectOne("RecruitApply-Mapper.selectApplyRecruitCnt", pblanc_sport_man_sn);
	}

	@Override
	public List<RecruitApplyVO> myRecruitApplyListByPblancSn(int pblanc_sn, SearchCriteria cri) throws SQLException {
		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);
		return session.selectList("RecruitApply-Mapper.myRecruitApplyListByPblancSn", pblanc_sn,rowBounds);
	}

	@Override
	public int myRecruitApplyListByPblancSnCnt(int pblanc_sn) throws SQLException {
		return session.selectOne("RecruitApply-Mapper.myRecruitApplyListByPblancSnCnt", pblanc_sn);
	}

	@Override
	public List<RecruitApplyVO> recruitMeetingListByPblancSn(String mber_sn, SearchCriteria cri) throws SQLException {
		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);
		return session.selectList("RecruitApply-Mapper.recruitMeetingListByPblancSn", mber_sn,rowBounds);
	}

	@Override
	public int recruitMeetingListByPblancSnCnt(String mber_sn) throws SQLException {
		return session.selectOne("RecruitApply-Mapper.recruitMeetingListByPblancSnCnt", mber_sn);
	}

	@Override
	public List<RecruitApplyVO> meetingResultList(String mber_sn, SearchCriteria cri) throws SQLException {
		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);
		return session.selectList("RecruitApply-Mapper.meetingResultList", mber_sn,rowBounds);
	}

	@Override
	public int meetingResultListCnt(String mber_sn) throws SQLException {
		return session.selectOne("RecruitApply-Mapper.meetingResultListCnt", mber_sn);
	}

	@Override
	public List<RecruitApplyVO> applyMeetingListByMberSn(String mber_sn, SearchCriteria cri) throws SQLException {
		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);
		return session.selectList("RecruitApply-Mapper.applyMeetingListByMberSn", mber_sn,rowBounds);
	}

	@Override
	public int applyMeetingListByMberSnCnt(String mber_sn) throws SQLException {
		return session.selectOne("RecruitApply-Mapper.applyMeetingListByMberSnCnt", mber_sn);
	}

	@Override
	public List<RecruitApplyVO> myMeetingResultList(String mber_sn, SearchCriteria cri) throws SQLException {
		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);
		return session.selectList("RecruitApply-Mapper.myMeetingResultList", mber_sn,rowBounds);
	}

	@Override
	public int myMeetingResultListCnt(String mber_sn) throws SQLException {
		return session.selectOne("RecruitApply-Mapper.myMeetingResultListCnt", mber_sn);
	}
	
	@Override
	public RecruitApplyVO selectApplyByPblancSportSn(int pblanc_sport_sn) throws SQLException {
		return session.selectOne("RecruitApply-Mapper.selectApplyByPblancSportSn",pblanc_sport_sn);
	}

	@Override
	public void updateApplyRefuse(int pblanc_sport_sn) throws SQLException {
		session.update("RecruitApply-Mapper.updateApplyRefuse", pblanc_sport_sn);
	}

	@Override
	public void updateMeetingTime(RecruitApplyVO recruitApply) throws SQLException {
		session.update("RecruitApply-Mapper.updateMeetingTime", recruitApply);
	}

	@Override
	public void updateMeetingEnd(int pblanc_sport_sn) throws SQLException {
		session.update("RecruitApply-Mapper.updateMeetingEnd", pblanc_sport_sn);
	}

	@Override
	public void updateRefuseRecruit(int pblanc_sport_sn) throws SQLException {
		session.update("RecruitApply-Mapper.updateRefuseRecruit", pblanc_sport_sn);
	}

	@Override
	public void updateAcceptRecruit(int pblanc_sport_sn) throws SQLException {
		session.update("RecruitApply-Mapper.updateAcceptRecruit", pblanc_sport_sn);
	}






}
