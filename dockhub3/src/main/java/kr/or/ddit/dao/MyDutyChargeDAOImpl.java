package kr.or.ddit.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.command.SearchCriteria;
import kr.or.ddit.dto.DutyChargeVO;

public class MyDutyChargeDAOImpl implements MyDutyChargeDAO {
	private SqlSession session;
	public void setSqlSession(SqlSession session) {
		this.session = session;
	}
	
	@Override
	public List<DutyChargeVO> selectDutyChargeList(SearchCriteria cri) throws SQLException {
		int offset = cri.getStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);
		return session.selectList("MydutyCharge-Mapper.selectDutyChargeList", cri, rowBounds);
	}

	@Override
	public int dutyChargeCnt(SearchCriteria cri) throws SQLException {
		return session.selectOne("MydutyCharge-Mapper.dutyChargeCnt", cri);
	}

	@Override
	public DutyChargeVO getDetailDutycharge(DutyChargeVO duty) throws SQLException {
		DutyChargeVO detailDutyCharge = session.selectOne("MydutyCharge-Mapper.getDetailDutycharge", duty);
		return detailDutyCharge;
	}

	@Override
	public void updateDutyCharge(DutyChargeVO duty) throws SQLException {
		session.update("MydutyCharge-Mapper.updateDutycharge", duty);
		
	}

	@Override
	public List<DutyChargeVO> getDutyChargeHistory(DutyChargeVO duty) throws SQLException {
		List<DutyChargeVO> dutyChargeHis = session.selectList("MydutyCharge-Mapper.getDutyChargeHistory", duty);
		return dutyChargeHis;
	}

}
