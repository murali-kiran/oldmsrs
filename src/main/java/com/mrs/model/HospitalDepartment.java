package com.mrs.model;

import java.io.Serializable;
import javax.persistence.*;
import java.util.Date;
import java.sql.Timestamp;


/**
 * The persistent class for the hospital_department database table.
 * 
 */
@Entity
@Table(name="hospital_department")
@NamedQuery(name="HospitalDepartment.findAll", query="SELECT h FROM HospitalDepartment h")
public class HospitalDepartment implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int hospitaldepartmentid;

	@Temporal(TemporalType.TIMESTAMP)
	private Date createdtime;

	private String department;

	private Timestamp modifiedtime;

	//bi-directional many-to-one association to Hospital
	private int hospitalid;

	public HospitalDepartment() {
	}

	public int getHospitaldepartmentid() {
		return this.hospitaldepartmentid;
	}

	public void setHospitaldepartmentid(int hospitaldepartmentid) {
		this.hospitaldepartmentid = hospitaldepartmentid;
	}

	public Date getCreatedtime() {
		return this.createdtime;
	}

	public void setCreatedtime(Date createdtime) {
		this.createdtime = createdtime;
	}

	public String getDepartment() {
		return this.department;
	}

	public void setDepartment(String department) {
		this.department = department;
	}

	public Timestamp getModifiedtime() {
		return this.modifiedtime;
	}

	public void setModifiedtime(Timestamp modifiedtime) {
		this.modifiedtime = modifiedtime;
	}

	public int getHospitalid() {
		return this.hospitalid;
	}

	public void setHospitalid(int hospitalid) {
		this.hospitalid = hospitalid;
	}

}