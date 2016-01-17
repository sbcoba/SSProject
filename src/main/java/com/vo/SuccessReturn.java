package com.vo;

public class SuccessReturn {
	private String status;
	
	public SuccessReturn()
	{
		setStatus("ok");
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	
}
