package kr.or.ddit.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.or.ddit.command.PageMaker;
import kr.or.ddit.command.SearchCriteria;
import kr.or.ddit.dao.IssueReplyDAO;
import kr.or.ddit.dto.IssueReplyVO;
import kr.or.ddit.dto.MemberVO;

public class IssueReplyServiceImpl implements IssueReplyService {

	private IssueReplyDAO replyDAO;
	public void setReplyDAO(IssueReplyDAO replyDAO) {
		this.replyDAO = replyDAO;
	}
	
	@Override
	public Map<String, Object> getReplyList(int issue_sn, SearchCriteria cri) throws SQLException {
		
		
		Map<String, Object> dataMap = new HashMap<String, Object>();
		
		List<IssueReplyVO> replyList = replyDAO.selectReplyListPage(issue_sn, cri);
		
		int count = replyDAO.countReply(issue_sn);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(count);
		
		dataMap.put("replyList", replyList);
		dataMap.put("pageMaker", pageMaker);
		
		return dataMap;
	}

	@Override
	public int getReplyListCount(int issue_sn) throws SQLException {
		int count = replyDAO.countReply(issue_sn);
		return count;
	}

	@Override
	public void registReply(IssueReplyVO reply) throws SQLException {
		replyDAO.insertReply(reply);
	}

	@Override
	public void modifyReply(IssueReplyVO reply) throws SQLException {
		replyDAO.updateReply(reply);
	}

	@Override
	public void removeReply(int issue_reply_no) throws SQLException {
		replyDAO.deleteReply(issue_reply_no);
	}

}
