package com.mrs.model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;


/**
 * The persistent class for the hospital_account database table.
 * 
 */
@Entity
@Table(name="hospital_account")
@NamedQuery(name="HospitalAccount.findAll", query="SELECT h FROM HospitalAccount h")
public class HospitalAccount implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int hospitalaccountid;

	private String accountnumber;

	private String bank;

	private String branch;

	@Temporal(TemporalType.TIMESTAMP)
	private Date createdtime;

	private String ifsccode;

	@Temporal(TemporalType.TIMESTAMP)
	private Date modifiedtime;

	//bi-directional many-to-one association to Hospital
	private int hospitalid;

	public HospitalAccount() {
	}

	public int getHospitalaccountid() {
		return this.hospitalaccountid;
	}

	public void setHospitalaccountid(int hospitalaccountid) {
		this.hospitalaccountid = hospitalaccountid;
	}

	public String getAccountnumber() {
		return this.accountnumber;
	}

	public void setAccountnumber(String accountnumber) {
		this.accountnumber = accountnumber;
	}

	public String getBank() {
		return this.bank;
	}

	public void setBank(String bank) {
		this.bank = bank;
	}

	public String getBranch() {
		return this.branch;
	}

	public void setBranch(String branch) {
		this.branch = branch;
	}

	public Date getCreatedtime() {
		return this.createdtime;
	}

	public void setCreatedtime(Date createdtime) {
		this.createdtime = createdtime;
	}

	public String getIfsccode() {
		return this.ifsccode;
	}

	public void setIfsccode(String ifsccode) {
		this.ifsccode = ifsccode;
	}

	public Date getModifiedtime() {
		return this.modifiedtime;
	}

	public void setModifiedtime(Date modifiedtime) {
		this.modifiedtime = modifiedtime;
	}

	public int getHospitalid() {
		return this.hospitalid;
	}

	public void setHospitalid(int hospitalid) {
		this.hospitalid = hospitalid;
	}

}