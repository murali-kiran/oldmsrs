package com.mrs.model;

import java.io.Serializable;
import java.util.Date;

public class HospitalAppoinmentBean implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String hospitalCode;
	private Date appointmentDate;
	private String docterName;
	private String empName;
	private String deptName;
	
	public String getHospitalCode() {
		return hospitalCode;
	}
	public void setHospitalCode(String hospitalCode) {
		this.hospitalCode = hospitalCode;
	}
	public Date getAppointmentDate() {
		return appointmentDate;
	}
	public void setAppointmentDate(Date appointmentDate) {
		this.appointmentDate = appointmentDate;
	}
	public String getDocterName() {
		return docterName;
	}
	public void setDocterName(String docterName) {
		this.docterName = docterName;
	}
	public String getEmpName() {
		return empName;
	}
	public void setEmpName(String empName) {
		this.empName = empName;
	}
	public String getDeptName() {
		return deptName;
	}
	public void setDeptName(String deptName) {
		this.deptName = deptName;
	}
	@Override
	public String toString() {
		return "HospitalEnquiry [hospitalCode=" + hospitalCode + ", appointmentDate=" + appointmentDate
				+ ", docterName=" + docterName + ", empName=" + empName + ", deptName=" + deptName + "]";
	}
}
