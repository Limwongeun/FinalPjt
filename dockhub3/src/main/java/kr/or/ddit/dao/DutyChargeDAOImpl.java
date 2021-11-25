package kr.or.ddit.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.command.SearchCriteria;
import kr.or.ddit.dto.DutyChargeVO;

public class DutyChargeDAOImpl implements DutyChargeDAO {

	private SqlSession session;
	public void setSqlSession(SqlSession session) {
		this.session = session;
	}

	@Override
	public List<DutyChargeVO> selectDutyChargeCriteria(int prjct_sn) throws SQLException {
//		int offset = cri.getStartRowNum();
//		int limit = cri.getPerPageNum();
//		RowBounds rowBounds = new RowBounds(offset, limit);

		//List<DutyChargeVO> dutychargeList = session.selectList("DutyCharge-Mapper.selectSearchDutyChargeList", cri, rowBounds);
		List<DutyChargeVO> dutychargeList = session.selectList("DutyCharge-Mapper.selectSearchDutyChargeList", prjct_sn);

		return dutychargeList;
	}

	@Override
	public int selectDutyChargeCriteriaTotalCount(SearchCriteria cri) throws SQLException {
		
		int count = session.selectOne("DutyCharge-Mapper.selectSearchDutyChargeListCount",cri);
		
		return count;
	}

	
	
	@Override
	public int getSeqNextValue() throws SQLException {
		int unit_job_sn = session.selectOne("DutyCharge-Mapper.selectDutyChargeSeqNext");
		return unit_job_sn;
	}

	@Override
	public void insertdutycharge(DutyChargeVO dutycharge) throws SQLException {
		session.update("DutyCharge-Mapper.insertDutyCharge",dutycharge);
		
	}

	@Override
	public void updatedutycharge(DutyChargeVO dutycharge) throws SQLException {
		session.update("DutyCharge-Mapper.modifyDutyCharge", dutycharge);
		
	}

	@Override
	public void deletedutycharge(int unit_job_sn) throws SQLException {
		session.update("DutyCharge-Mapper.deleteDutyCharge",unit_job_sn);
		
	}

	@Override
	public DutyChargeVO selectdutychargeByUnit_job_sn(int unit_job_sn) throws SQLException {
		return session.selectOne("DutyCharge-Mapper.selectDutyChargeUnit_job_sn",unit_job_sn);
	}

	@Override
	public int selectDutyChargeSeqNext() throws SQLException {
		int seq_num=
				session.selectOne("DutyCharge-Mapper.selectDutyChargeSeqNext");
		return seq_num;
	}

	@Override
	public List<DutyChargeVO> selectProjectMember(int prjct_sn) throws SQLException {
		List<DutyChargeVO> userList = session.selectList("DutyCharge-Mapper.selectProjectMember", prjct_sn);
		return userList;
	}
	
	@Override
	public List<String> getDutyStatus(int prjct_sn) throws SQLException {
		return session.selectList("DutyCharge-Mapper.getDutyStatus",prjct_sn);
	}

	@Override
	public List<String> getMberDutyStatus(String mber_sn) throws SQLException {
		return session.selectList("DutyCharge-Mapper.getMberDutyStatus",mber_sn);
	}


}
