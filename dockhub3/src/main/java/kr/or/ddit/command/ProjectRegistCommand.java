package kr.or.ddit.command;

import kr.or.ddit.dto.ProjectVO;

public class ProjectRegistCommand {
	private String title;
	private String content;
	private String startDate;
	private String endDate;
	private String mber_repo;
	private String prjct_photo;
	private String prjct_job_type_code;
	
	public String getPrjct_job_type_code() {
		return prjct_job_type_code;
	}
	public void setPrjct_job_type_code(String prjct_job_type_code) {
		this.prjct_job_type_code = prjct_job_type_code;
	}
	public String getPrjct_photo() {
		return prjct_photo;
	}
	public void setPrjct_photo(String prjct_photo) {
		this.prjct_photo = prjct_photo;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	public String getMber_repo() {
		return mber_repo;
	}
	public void setMber_repo(String mber_repo) {
		this.mber_repo = mber_repo;
	}
	
	public ProjectVO toProjectVO() {
		ProjectVO project = new ProjectVO();
		project.setPrjct_job_type_code(this.prjct_job_type_code);
		project.setPrjct_sj(this.title);
		project.setPrjct_cn(this.content);
		project.setPrjct_endde(this.endDate);
		project.setPrjct_bgnde(this.startDate);
		project.setPrjct_repo(this.mber_repo);
		project.setPrjct_photo(this.prjct_photo);
		return project;
	}
	
}
