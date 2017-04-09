package com.mrs.model;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;


/**
 * The persistent class for the hospital database table.
 * 
 */
@Entity
@Table(name="hospital")
@NamedQuery(name="Hospital.findAll", query="SELECT h FROM Hospital h")
public class Hospital implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int hospitalid;

	private String addressline1;

	private String addressline2;

	private String city;

	private String country;

	@Temporal(TemporalType.TIMESTAMP)
	private Date createdtime;

	private String district;

	private String emailid;

	private String faxno;

	@Temporal(TemporalType.TIMESTAMP)
	private Date modifiedtime;

	private String name;

	private String phone1;

	private String phone2;

	private String state;

	private String workingdays;

	private String workinghours;

	//bi-directional many-to-one association to HospitalType
	private int hospitaltypeid;

	//bi-directional many-to-one association to HospitalAccount
	@OneToMany
	@JoinColumn(name="hospitalid",insertable=false,updatable=false)
	private List<HospitalAccount> hospitalAccounts;

	//bi-directional many-to-one association to HospitalDepartment
	@OneToMany
	@JoinColumn(name="hospitalid",insertable=false,updatable=false)
	private List<HospitalDepartment> hospitalDepartments;
	
	public Hospital() {
	}

	public int getHospitalid() {
		return this.hospitalid;
	}

	public void setHospitalid(int hospitalid) {
		this.hospitalid = hospitalid;
	}

	public String getAddressline1() {
		return this.addressline1;
	}

	public void setAddressline1(String addressline1) {
		this.addressline1 = addressline1;
	}

	public String getAddressline2() {
		return this.addressline2;
	}

	public void setAddressline2(String addressline2) {
		this.addressline2 = addressline2;
	}

	public String getCity() {
		return this.city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getCountry() {
		return this.country;
	}

	public void setCountry(String country) {
		this.country = country;
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

	public String getEmailid() {
		return this.emailid;
	}

	public void setEmailid(String emailid) {
		this.emailid = emailid;
	}

	public String getFaxno() {
		return this.faxno;
	}

	public void setFaxno(String faxno) {
		this.faxno = faxno;
	}

	public Date getModifiedtime() {
		return this.modifiedtime;
	}

	public void setModifiedtime(Date modifiedtime) {
		this.modifiedtime = modifiedtime;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPhone1() {
		return this.phone1;
	}

	public void setPhone1(String phone1) {
		this.phone1 = phone1;
	}

	public String getPhone2() {
		return this.phone2;
	}

	public void setPhone2(String phone2) {
		this.phone2 = phone2;
	}

	public String getState() {
		return this.state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getWorkingdays() {
		return this.workingdays;
	}

	public void setWorkingdays(String workingdays) {
		this.workingdays = workingdays;
	}

	public String getWorkinghours() {
		return this.workinghours;
	}

	public void setWorkinghours(String workinghours) {
		this.workinghours = workinghours;
	}

	public int getHospitaltypeid() {
		return this.hospitaltypeid;
	}

	public void setHospitaltypeid(int hospitaltypeid) {
		this.hospitaltypeid = hospitaltypeid;
	}

	public List<HospitalAccount> getHospitalAccounts() {
		return this.hospitalAccounts;
	}

	public void setHospitalAccounts(List<HospitalAccount> hospitalAccounts) {
		this.hospitalAccounts = hospitalAccounts;
	}

	public List<HospitalDepartment> getHospitalDepartments() {
		return this.hospitalDepartments;
	}

	public void setHospitalDepartments(List<HospitalDepartment> hospitalDepartments) {
		this.hospitalDepartments = hospitalDepartments;
	}

}