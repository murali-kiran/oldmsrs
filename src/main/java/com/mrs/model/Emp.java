package com.mrs.model;

import java.io.Serializable;
import java.math.BigInteger;
import java.util.Date;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;


/**
 * The persistent class for the emp database table.
 * 
 */
@Entity
@Table(name="emp")
public class Emp implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int empid;

	private BigInteger aatharnumber;

	private String adress1;

	private String adress2;

	@Temporal(TemporalType.TIMESTAMP)
	private Date createdtime;

	private String district;

	@DateTimeFormat(pattern = "yyyy-MM-dd")
	@Temporal(TemporalType.DATE)
	private Date dob;

	@DateTimeFormat(pattern = "yyyy-MM-dd")
	@Temporal(TemporalType.DATE)
	private Date doj;

	@DateTimeFormat(pattern = "yyyy-MM-dd")
	@Temporal(TemporalType.DATE)
	private Date dor;

	private String email;

	private String firstname;

	private byte gender;

	private String lastname;

	@Temporal(TemporalType.TIMESTAMP)
	private Date modifiedtime;

	private String pancard;

	private String phone;

	private String pincode;

	private String state;

	//bi-directional many-to-one association to Nominee
	@OneToMany
	@JoinColumn(name="empid",insertable=false,updatable=false)
	private List<Nominee> nominees;
	
	@OneToMany
	@JoinColumn(name="empid",insertable=false,updatable=false)
	private List<Incident> incidents;

	public Emp() {
	}

	public int getEmpid() {
		return this.empid;
	}

	public void setEmpid(int empid) {
		this.empid = empid;
	}

	public BigInteger getAatharnumber() {
		return this.aatharnumber;
	}

	public void setAatharnumber(BigInteger aatharnumber) {
		this.aatharnumber = aatharnumber;
	}

	public String getAdress1() {
		return this.adress1;
	}

	public void setAdress1(String adress1) {
		this.adress1 = adress1;
	}

	public String getAdress2() {
		return this.adress2;
	}

	public void setAdress2(String adress2) {
		this.adress2 = adress2;
	}

	public Date getCreatedtime() {
		return this.createdtime;
	}

	public void setCreatedtime(Date createdtime) {
		this.createdtime = createdtime;
	}

	public String getDistrict() {
		return this.district;
	}

	public void setDistrict(String district) {
		this.district = district;
	}

	public Date getDob() {
		return this.dob;
	}

	public void setDob(Date dob) {
		this.dob = dob;
	}

	public Date getDoj() {
		return this.doj;
	}

	public void setDoj(Date doj) {
		this.doj = doj;
	}

	public Date getDor() {
		return this.dor;
	}

	public void setDor(Date dor) {
		this.dor = dor;
	}

	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getFirstname() {
		return this.firstname;
	}

	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}

	public byte getGender() {
		return this.gender;
	}

	public void setGender(byte gender) {
		this.gender = gender;
	}

	public String getLastname() {
		return this.lastname;
	}

	public void setLastname(String lastname) {
		this.lastname = lastname;
	}

	public Date getModifiedtime() {
		return this.modifiedtime;
	}

	public void setModifiedtime(Date modifiedtime) {
		this.modifiedtime = modifiedtime;
	}

	public String getPancard() {
		return this.pancard;
	}

	public void setPancard(String pancard) {
		this.pancard = pancard;
	}

	public String getPhone() {
		return this.phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getPincode() {
		return this.pincode;
	}

	public void setPincode(String pincode) {
		this.pincode = pincode;
	}

	public String getState() {
		return this.state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public List<Nominee> getNominees() {
		return this.nominees;
	}

	public void setNominees(List<Nominee> nominees) {
		this.nominees = nominees;
	}

	public List<Incident> getIncidents() {
		return incidents;
	}

	public void setIncidents(List<Incident> incidents) {
		this.incidents = incidents;
	}

	@Override
	public String toString() {
		return "Emp [empid=" + empid + ", " + (aatharnumber != null ? "aatharnumber=" + aatharnumber + ", " : "")
				+ (adress1 != null ? "adress1=" + adress1 + ", " : "")
				+ (adress2 != null ? "adress2=" + adress2 + ", " : "")
				+ (createdtime != null ? "createdtime=" + createdtime + ", " : "")
				+ (district != null ? "district=" + district + ", " : "") + (dob != null ? "dob=" + dob + ", " : "")
				+ (doj != null ? "doj=" + doj + ", " : "") + (dor != null ? "dor=" + dor + ", " : "")
				+ (email != null ? "email=" + email + ", " : "")
				+ (firstname != null ? "firstname=" + firstname + ", " : "") + "gender=" + gender + ", "
				+ (lastname != null ? "lastname=" + lastname + ", " : "")
				+ (modifiedtime != null ? "modifiedtime=" + modifiedtime + ", " : "")
				+ (pancard != null ? "pancard=" + pancard + ", " : "") + (phone != null ? "phone=" + phone + ", " : "")
				+ (pincode != null ? "pincode=" + pincode + ", " : "") + (state != null ? "state=" + state + ", " : "")
				+ (nominees != null ? "nominees=" + nominees + ", " : "")
				+ (incidents != null ? "incidents=" + incidents : "") + "]";
	}
}