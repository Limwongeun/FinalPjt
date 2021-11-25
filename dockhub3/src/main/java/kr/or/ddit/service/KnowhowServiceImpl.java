package kr.or.ddit.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.or.ddit.command.PageMaker;
import kr.or.ddit.command.SearchCriteria;
import kr.or.ddit.dao.KnowhowDAO;
import kr.or.ddit.dao.KnowhowReplyDAO;
import kr.or.ddit.dto.KnowhowReplyVO;
import kr.or.ddit.dto.KnowhowVO;

public class KnowhowServiceImpl implements KnowhowService {

	private KnowhowDAO knowhowDAO;
	
	public void setKnowhowDAO(KnowhowDAO knowhowDAO) {
		this.knowhowDAO = knowhowDAO;
	}
	
	private KnowhowReplyDAO replyDAO;
	
	public void setKnowhowReplyDAO(KnowhowReplyDAO replyDAO) {
		this.replyDAO = replyDAO;
	}
	
	@Override
	public Map<String, Object> getList(SearchCriteria cri, String mber_sn) throws SQLException {
		// 게시글 put
		cri.setPerPageNum(5);
		List<KnowhowVO> knowhowList = knowhowDAO.selectKnowhowCriteria(cri);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(knowhowDAO.selectKnowhowCriteriaTotalCount(cri));
		Map<String, Object> dataMap = new HashMap<String, Object>();
		int page = cri.getPage();
		KnowhowVO knowhow = new KnowhowVO();
		// 댓글 put
		for (int i = 0; i < knowhowList.size(); i++) {
			Map<String, Object> replyMap = new HashMap<String, Object>();
			cri.setPage(1);
			List<KnowhowReplyVO> replyList = replyDAO.selectKnowhowAsyncioReplyList(knowhowList.get(i).getKnh_no(), cri);
			knowhow.setKnh_no(knowhowList.get(i).getKnh_no());
			knowhow.setMber_sn(mber_sn);
			int exist = knowhowDAO.getLikeExist(knowhow);
			knowhowList.get(i).setLikeExist(exist);
			if(replyList.size() > 0) {
				int cnt = replyDAO.countKnowhowReply(knowhowList.get(i).getKnh_no());
				PageMaker replyPageMaker = new PageMaker();
				replyPageMaker.setCri(cri);
				replyPageMaker.setTotalCount(cnt);
				replyMap.put("replyList", replyList);
				replyMap.put("replyPageMaker", replyPageMaker);
				replyMap.put("replyNum", cnt);
				knowhowList.get(i).setReplyMap(replyMap);
			}
		}
		dataMap.put("knowhowList", knowhowList);
		dataMap.put("pageMaker", pageMaker);
		dataMap.put("page", page);
		return dataMap;
	}



	@Override
	public void regist(KnowhowVO knowhow) throws SQLException {

		int knh_no = knowhowDAO.getSeqNextValue();
		
		knowhow.setKnh_no(knh_no);
		knowhowDAO.insertKnowhow(knowhow);
	}

	@Override
	public KnowhowVO getKnowhowForModify(int knh_no) throws SQLException {
		KnowhowVO board = knowhowDAO.selectknowhowByKnh_no(knh_no);
		return board;
	}

	@Override
	public void modify(KnowhowVO knowhow) throws SQLException {
		knowhowDAO.updateKnowhow(knowhow);
	}

	@Override
	public void remove(int knh_no) throws SQLException {
		knowhowDAO.deleteKnowhow(knh_no);
		
	}

	@Override
	public int getLikeExist(KnowhowVO knowhow) throws SQLException {
		int exist = knowhowDAO.getLikeExist(knowhow);
		return exist;
	}

	@Override
	public void likeKnowhow(KnowhowVO knowhow) throws SQLException {
		knowhowDAO.likeKnowhow(knowhow);
		knowhowDAO.updateKnowhowLike(knowhow.getKnh_no());
	}

	@Override
	public void cancleLike(KnowhowVO knowhow) throws SQLException {
		knowhowDAO.cancleLike(knowhow);
		knowhowDAO.updateKnowhowLike(knowhow.getKnh_no());
	}

}
