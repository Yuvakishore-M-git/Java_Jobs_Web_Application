package com.entities;

public class Jobs {

	private String jobTitle;
	private String jobContent;
	private String jobUrl;
	private String jobDate;
	
	

	public Jobs() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Jobs(String jobTitle, String jobContent, String jobUrl,String jobDate) {
		super();
		this.jobTitle = jobTitle;
		this.jobContent = jobContent;
		this.jobUrl = jobUrl;
		this.jobDate=jobDate;
	}

	public String getJobTitle() {
		return jobTitle;
	}

	public void setJobTitle(String jobTitle) {
		this.jobTitle = jobTitle;
	}

	public String getJobContent() {
		return jobContent;
	}

	public void setJobContent(String jobContent) {
		this.jobContent = jobContent;
	}

	public String getJobUrl() {
		return jobUrl;
	}

	public void setJobUrl(String jobUrl) {
		this.jobUrl = jobUrl;
	}

	@Override
	public String toString() {
		return this.getJobTitle()+" : "+this.getJobContent()+"  URL- "+this.getJobUrl();
	}

	public String getJobDate() {
		return jobDate;
	}

	public void setJobDate(String jobDate) {
		this.jobDate = jobDate;
	}
	
	
}
