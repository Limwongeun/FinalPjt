package kr.or.ddit.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.or.ddit.command.PageMaker;
import kr.or.ddit.command.SearchCriteria;
import kr.or.ddit.dao.RecruitDAO;
import kr.or.ddit.dto.ProjectVO;
import kr.or.ddit.dto.RecruitVO;

public class RecruitServiceImpl implements RecruitService {

	private RecruitDAO recruitDAO;
	
	public void setRecruitDAO(RecruitDAO recruitDAO) {
		this.recruitDAO = recruitDAO; 
	}
	
	
	@Override
	public Map<String, Object> getList(SearchCriteria cri) throws SQLException {

		List<RecruitVO> recruitList = recruitDAO.selectRecruitCriteria(cri);
		
		/*if (recruitList != null) {
			for (recruitVO recruit : recruitList) {
				
			}
		}*/
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(recruitDAO.selectRecruitCriteriaTotalCount(cri));
		
		Map<String, Object> dataMap = new HashMap<String, Object>();
		dataMap.put("recruitList", recruitList);
		dataMap.put("pageMaker", pageMaker);
		
		return dataMap;
		
		
	}
	
	@Override
	public Map<String, Object> getList2(SearchCriteria cri) throws SQLException {
		List<RecruitVO> recruitList2 = recruitDAO.selectRecruitCriteria2(cri);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(recruitDAO.selectRecruitCriteriaTotalCount(cri));
		Map<String, Object> dataMap2 = new HashMap<String, Object>();
		dataMap2.put("recruitList2", recruitList2);
		dataMap2.put("pageMaker", pageMaker);
		return dataMap2;
	}
	
	@Override
	public Map<String, Object> getList3(SearchCriteria cri) throws SQLException {
		List<RecruitVO> recruitList3 = recruitDAO.selectRecruitCriteria3(cri);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(recruitDAO.selectRecruitCriteriaTotalCount(cri));
		Map<String, Object> dataMap3 = new HashMap<String, Object>();
		dataMap3.put("recruitList3", recruitList3);
		dataMap3.put("pageMaker", pageMaker);
		return dataMap3;
	}
	
	

	@Override
	public RecruitVO getRecruit(int pblanc_sn) throws SQLException {
		RecruitVO board = recruitDAO.selectRecruitBypblanc_sn(pblanc_sn);
		recruitDAO.increaseViewCount(pblanc_sn);
		return board;
	}

	@Override
	public RecruitVO getRecruitForModify(int pblanc_sn) throws SQLException {
		RecruitVO board = recruitDAO.selectRecruitBypblanc_sn(pblanc_sn);
		return board;
	}


	@Override
	public void regist(RecruitVO recruit) throws SQLException {
		
		int pblanc_sn = recruitDAO.getSeqNextValue();
		
		recruit.setPblanc_sn(pblanc_sn);
		recruitDAO.insertRecruit(recruit);
	}


	@Override
	public Map<String, Object> getProject(String mber_sn) throws SQLException {
		
		Map<String, Object> projectMap = new HashMap<String, Object>();
		
		List<ProjectVO> projectList = recruitDAO.selectProjectByMbersnList(mber_sn);
		
		projectMap.put("projectList", projectList);
		return projectMap;
	}


	@Override
	public void modify(RecruitVO recruit) throws SQLException {
		
		recruitDAO.updateRecruit(recruit);
	}

	@Override
	public void remove(int pblanc_sn) throws SQLException {
		recruitDAO.deleteRecruit(pblanc_sn);
	}


	@Override
	public Map<String, Object> selectMyRecruitList(String pblanc_wrter, SearchCriteria cri) throws SQLException {
		Map<String, Object> dataMap = new HashMap<String, Object>();
		cri.setPerPageNum(5);
		List<RecruitVO> myRecruitList = recruitDAO.selectMyRecruitList(pblanc_wrter,cri);
		
		int cnt = recruitDAO.selectMyRecruitCnt(pblanc_wrter);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(cnt);
		dataMap.put("myRecruitList", myRecruitList);
		dataMap.put("pageMaker", pageMaker);
		
		return dataMap;
	}


	
	
}
