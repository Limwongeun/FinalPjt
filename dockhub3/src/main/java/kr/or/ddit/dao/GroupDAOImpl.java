package kr.or.ddit.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import kr.or.ddit.command.SearchCriteria;
import kr.or.ddit.dto.GroupVO;

public class GroupDAOImpl implements GroupDAO {
	
	private SqlSession session;
	public void setSession(SqlSession session) {
		this.session = session;
	}
	

	@Override
	public List<GroupVO> selectMyGroupList(SearchCriteria cri,int mber_sn) throws SQLException {
		int offset=cri.getStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		List<GroupVO> groupList = session.selectList("Group-Mapper.selectMyGroupList",cri,rowBounds);
		return groupList;
	}
	
	@Override
	public void insertGroup(GroupVO group) throws SQLException {
		session.update("Group-Mapper.insertGroup",group);
	}
	
	@Override
	public int getSeqNextValue() throws SQLException {
		int group_sn = session.selectOne("Group-Mapper.selectGroupNext");
		return group_sn;
	}
	@Override
	public int selectGroupCriteriaTotalCount(int mber_sn) throws SQLException {
		int cnt = session.selectOne("Group-Mapper.selectMyGroupCount",mber_sn);
		return cnt;
	}
}
