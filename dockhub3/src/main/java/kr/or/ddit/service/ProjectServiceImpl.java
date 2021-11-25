package kr.or.ddit.service;

import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.or.ddit.command.PageMaker;
import kr.or.ddit.command.SearchCriteria;
import kr.or.ddit.dao.MemberDAO;
import kr.or.ddit.dao.ProjectDAO;
import kr.or.ddit.dto.MemberVO;
import kr.or.ddit.dto.ProjectVO;
import kr.or.ddit.dto.RecruitApplyVO;

public class ProjectServiceImpl implements ProjectService {
	private ProjectDAO projectDAO;
	
	private MemberDAO memberDAO;
	
	public void setProjectDAO(ProjectDAO projectDAO) {
		this.projectDAO = projectDAO;
	}
	public void setMemberDAO(MemberDAO memberDAO) {
		this.memberDAO = memberDAO;
	}

	@Override
	public ProjectVO getProject(int sn) throws SQLException {
		ProjectVO project = projectDAO.selectPrjctBySn(sn);
		
		if (project.getPrjct_actvty_sttus_code().equals("1")) {
			if (project.getPrjct_bgnde()!=null) {
				if (project.getPrjct_endde()!=null) {
					//시작일
					String[] arr = project.getPrjct_bgnde().split("-");
					String sdate = "";
					for (int i = 0; i < arr.length; i++) {
						sdate += arr[i];
					}
					int sDate = Integer.parseInt(sdate);
					//오늘날짜
					Date date = new Date();
					SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
					String strDay = sdf.format(date);
					int dDate = Integer.parseInt(strDay);
					//종료일
					String[] arr2 = project.getPrjct_endde().split("-");
					String sdate2 = "";
					for (int i = 0; i < arr2.length; i++) {
						sdate2 += arr2[i];
					}
					int sDate2 = Integer.parseInt(sdate2);
					if (dDate<sDate) {
						project.setPrjct_ing("1");//시작전
					}else if (sDate<=dDate&&dDate<=sDate2) {
						project.setPrjct_ing("2");//진행중
					} else {
						project.setPrjct_ing("3");//기간 종료
					}
				}
			}
		}else {
			project.setPrjct_ing("4");//비활성화
		}
		
		
		return project;
	}

	@Override
	public int selectUserCnt(int sn) throws SQLException {
		int cnt = projectDAO.selectUserCnt(sn);
		return cnt;
	}

	@Override
	public int selectPrjctAuthor(ProjectVO project) throws SQLException {
		int author = projectDAO.selectPrjctAuthor(project); 
		return author;
	}


	@Override
	public void modify(ProjectVO project) throws SQLException {
		projectDAO.updateProject(project);
	}

	
	@Override
	public int getLike(ProjectVO project) throws SQLException {
		return projectDAO.getLike(project);
	}

	@Override
	public void likePrj(ProjectVO project) throws SQLException {
		projectDAO.likePrj(project);
		
	}

	@Override
	public void deletePrj(ProjectVO project) throws SQLException {
		projectDAO.deletePrj(project);
		
	}

	@Override
	public int getMark(ProjectVO project) throws SQLException {
		
		return projectDAO.getMark(project);
	}

	@Override
	public void markPrj(ProjectVO project) throws SQLException {
		projectDAO.markPrj(project);
		
	}

	@Override
	public void deleteMarkPrj(ProjectVO project) throws SQLException {
		projectDAO.deleteMarkPrj(project);
		
	}

	@Override
	public ProjectVO getPro(int prjct_sn) throws SQLException {
		
		return projectDAO.getPro(prjct_sn);
	}

	@Override
	public Map<String, Object> getMberProject(SearchCriteria cri, String mber_sn) throws SQLException {
		Map<String, Object> dataMap = new HashMap<String, Object>();
		cri.setPerPageNum(5);
		List<ProjectVO> projectList = projectDAO.getMberProject(cri, mber_sn);
		
		for (ProjectVO projectVO : projectList) {
			List<MemberVO> memberList = memberDAO.getPrjctMber(projectVO.getPrjct_sn());
			projectVO.setIssuePro(projectDAO.getPro(projectVO.getPrjct_sn()).getIssuePro());
			projectVO.setDutyPro(projectDAO.getPro(projectVO.getPrjct_sn()).getDutyPro());
			projectVO.setMemList(memberList);
		}
		int total = projectDAO.mberPrjctCnt(mber_sn);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(total);
		dataMap.put("projectList", projectList);
		dataMap.put("pageMaker", pageMaker);
		return dataMap;
	}
	
//	@Override
//	public List<ProjectVO> getMberProject(String mber_sn) throws SQLException {
//		List<ProjectVO> projectList = projectDAO.getMberProject(mber_sn);
//		for (ProjectVO projectVO : projectList) {
//			List<MemberVO> memberList = memberDAO.getPrjctMber(projectVO.getPrjct_sn());
//			projectVO.setIssuePro(projectDAO.getPro(projectVO.getPrjct_sn()).getIssuePro());
//			projectVO.setDutyPro(projectDAO.getPro(projectVO.getPrjct_sn()).getDutyPro());
//			projectVO.setMemList(memberList);
//		}
//
//		return projectList;
//	}
	
	@Override
	public List<ProjectVO> getMberProject2(String mber_sn) throws SQLException {
		List<ProjectVO> projectList2 = projectDAO.getMberProject2(mber_sn);
		for (ProjectVO projectVO : projectList2) {
			List<MemberVO> memberList2 = memberDAO.getPrjctMber(projectVO.getPrjct_sn());
			projectVO.setIssuePro(projectDAO.getPro(projectVO.getPrjct_sn()).getIssuePro());
			projectVO.setDutyPro(projectDAO.getPro(projectVO.getPrjct_sn()).getDutyPro());
			projectVO.setMemList(memberList2);
		}
		
		return projectList2;
	}
	@Override
	public List<ProjectVO> getMarkProject(String mber_sn) throws SQLException {
		return projectDAO.getMarkProject(mber_sn);
	}
	@Override
	public void registPrjct(ProjectVO project) throws SQLException {
		projectDAO.registPrjct(project);
	}
	@Override
	public void insertRoll(String mber_sn) throws SQLException {
		projectDAO.insertPL();
		projectDAO.insertAA();
		projectDAO.insertTA();
		projectDAO.insertDA();
		projectDAO.insertUA();
//		projectDAO.insertBA();
		projectDAO.insertAnuse();
		projectDAO.insertPrjctUser(mber_sn);
		
		
	}
	@Override
	public void insertPrjctFile(ProjectVO project) throws SQLException {
		projectDAO.insertPrjctFile(project);
	}
	@Override
	public List<String> getPrjctSjForSearch() throws SQLException {
		return projectDAO.getPrjctSjForSearch();
	}
	@Override
	public Map<String, Object> selectSearchProjectList(SearchCriteria cri) throws SQLException {
		Map<String, Object> dataMap = new HashMap<String, Object>();
		cri.setPerPageNum(5);
		List<ProjectVO> searchList = projectDAO.selectSearchProjectList(cri);
		
		int cnt = projectDAO.selectSearchProjectListCount(cri);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(cnt);
				
		dataMap.put("searchList", searchList);
		dataMap.put("pageMaker", pageMaker);		
		return dataMap;
	}

}
