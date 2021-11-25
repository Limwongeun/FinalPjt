package kr.or.ddit.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.or.ddit.command.PageMaker;
import kr.or.ddit.command.SearchCriteria;
import kr.or.ddit.dao.KnowhowReplyDAO;
import kr.or.ddit.dto.KnowhowReplyVO;

public class KnowhowReplyServiceImpl implements KnowhowReplyService {

	private KnowhowReplyDAO knowhowReplyDAO;
	
	public void setKnowhowReplyDAO(KnowhowReplyDAO knowhowReplyDAO) {
		this.knowhowReplyDAO = knowhowReplyDAO;
	}
	
	@Override
	public Map<String, Object> getKnowhowReplyList(SearchCriteria cri) throws SQLException {
		
		Map<String, Object> dataMap = new HashMap<String, Object>();
		
		cri.setPerPageNum(5);
		List<KnowhowReplyVO> knowhowReplyList = knowhowReplyDAO.selectKnowhowReplyList(cri);
		
		dataMap.put("knowhowReplyList", knowhowReplyList);
		
		return dataMap;
	}

	@Override
	public int getKnowhowReplListCount(int knh_no) throws SQLException {
		int count = knowhowReplyDAO.countKnowhowReply(knh_no);
		return count;
	}

	@Override
	public Map<String, Object> registKnowhowReply(KnowhowReplyVO reply, SearchCriteria cri) throws SQLException {
		int knowhow_reply_no = knowhowReplyDAO.selectKnowhowReplySeq();
		reply.setKnowhow_reply_no(knowhow_reply_no);
		knowhowReplyDAO.insertKnowhowReply(reply);
		int knh_no = reply.getKnh_no();
		
		Map<String, Object> asyncioMap = new HashMap<String, Object>();
		cri.setPage(1);
		List<KnowhowReplyVO> replyList = knowhowReplyDAO.selectKnowhowAsyncioReplyList(knh_no, cri);
		
		int cnt = knowhowReplyDAO.countKnowhowReply(knh_no);
		
		// 보고 있는 페이지 외에 무한스크롤 초기화 (5개씩 보기)
		cri.setPerPageNum(5);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(cnt);
		int repPage = cri.getPage();
		asyncioMap.put("replyList", replyList);
		asyncioMap.put("pageMaker", pageMaker);

		
		int endPage = pageMaker.getEndPage();
		asyncioMap.put("repPage", repPage);
		asyncioMap.put("endPage", endPage);
		
		return asyncioMap;
		
	}

	@Override
	public Map<String, Object> getAsyncioReplyList(int knh_no, SearchCriteria cri) throws SQLException {
		
		Map<String, Object> asyncioMap = new HashMap<String, Object>();
		cri.setPerPageNum(5);
		List<KnowhowReplyVO> replyList = knowhowReplyDAO.selectKnowhowAsyncioReplyList(knh_no, cri);
		
		int cnt = knowhowReplyDAO.countKnowhowReply(knh_no);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(cnt);
		int repPage = cri.getPage();
		// 보고 있는 페이지 외에 무한스크롤 초기화 (5개씩 보기)
		cri.setPerPageNum(5);
		pageMaker.setCri(cri);
		int endPage = pageMaker.getEndPage();
		asyncioMap.put("replyList", replyList);
		asyncioMap.put("pageMaker", pageMaker);
		asyncioMap.put("repPage", repPage);
		asyncioMap.put("endPage", endPage);
		asyncioMap.put("replyNum", cnt);
		return asyncioMap;
	}

	@Override
	public PageMaker getPageMaker(int knh_no, SearchCriteria cri) throws Exception {
		int cnt = knowhowReplyDAO.countKnowhowReply(knh_no);
		cri.setPerPageNum(5);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(cnt);
		
		return pageMaker;
	}

	@Override
	public Map<String, Object> modifyKnowhowReply(KnowhowReplyVO reply, SearchCriteria cri) throws SQLException {
		knowhowReplyDAO.updateKnowhowReply(reply);
		
		int knh_no = reply.getKnh_no();
		
		Map<String, Object> asyncioMap = new HashMap<String, Object>();
		cri.setPage(1);
		List<KnowhowReplyVO> replyList = knowhowReplyDAO.selectKnowhowAsyncioReplyList(knh_no, cri);
		
		int cnt = knowhowReplyDAO.countKnowhowReply(knh_no);
		
		// 보고 있는 페이지 외에 무한스크롤 초기화 (5개씩 보기)
		cri.setPerPageNum(5);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(cnt);
		int repPage = cri.getPage();
		asyncioMap.put("replyList", replyList);
		asyncioMap.put("pageMaker", pageMaker);

		int endPage = pageMaker.getEndPage();
		asyncioMap.put("repPage", repPage);
		asyncioMap.put("endPage", endPage);
		return asyncioMap;
		
	}

	@Override
	public Map<String, Object> removeKnowhowReply(KnowhowReplyVO reply, SearchCriteria cri) throws SQLException {
		knowhowReplyDAO.deleteKnowhowReply(reply.getKnowhow_reply_no());
		
		int knh_no = reply.getKnh_no();
		
		Map<String, Object> asyncioMap = new HashMap<String, Object>();
		cri.setPage(1);
		List<KnowhowReplyVO> replyList = knowhowReplyDAO.selectKnowhowAsyncioReplyList(knh_no, cri);
		
		int cnt = knowhowReplyDAO.countKnowhowReply(knh_no);

		// 보고 있는 페이지 외에 무한스크롤 초기화 (5개씩 보기)
		cri.setPerPageNum(5);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(cnt);
		int repPage = cri.getPage();
		asyncioMap.put("replyList", replyList);
		asyncioMap.put("pageMaker", pageMaker);
		
		int endPage = pageMaker.getEndPage();
		asyncioMap.put("repPage", repPage);
		asyncioMap.put("endPage", endPage);
		return asyncioMap;
		
	}

}
