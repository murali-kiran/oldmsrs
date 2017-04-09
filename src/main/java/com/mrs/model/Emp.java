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
 * The persistent class for the emp database table.
 * 
 */
@Entity
@Table(name="emp")
@NamedQuery(name="Emp.findAll", query="SELECT e FROM Emp e")
public class Emp implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int empid;

	private String adress;

	@Temporal(TemporalType.TIMESTAMP)
	private Date createdtime;

	@Temporal(TemporalType.DATE)
	private Date dob;

	private String email;

	private String firstname;

	private byte gender;

	private String lastname;

	private String middlename;

	@Temporal(TemporalType.TIMESTAMP)
	private Date modifiedtime;

	private String phone;

	private String title;

	//bi-directional many-to-one association to Appointment
	@OneToMany
	@JoinColumn(name="empid",insertable=false,updatable=false)
	private List<Appointment> appointments;

	//bi-directional many-to-one association to Claim
	@OneToMany
	@JoinColumn(name="empid",insertable=false,updatable=false)
	private List<Claim> claims;

	//bi-directional many-to-one association to Dependent
	@OneToMany
	@JoinColumn(name="empid",insertable=false,updatable=false)
	private List<Dependent> dependents;

	public Emp() {
	}

	public int getEmpid() {
		return this.empid;
	}

	public void setEmpid(int empid) {
		this.empid = empid;
	}

	public String getAdress() {
		return this.adress;
	}

	public void setAdress(String adress) {
		this.adress = adress;
	}

	public Date getCreatedtime() {
		return this.createdtime;
	}

	public void setCreatedtime(Date createdtime) {
		this.createdtime = createdtime;
	}

	public Date getDob() {
		return this.dob;
	}

	public void setDob(Date dob) {
		this.dob = dob;
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

	public String getMiddlename() {
		return this.middlename;
	}

	public void setMiddlename(String middlename) {
		this.middlename = middlename;
	}

	public Date getModifiedtime() {
		return this.modifiedtime;
	}

	public void setModifiedtime(Date modifiedtime) {
		this.modifiedtime = modifiedtime;
	}

	public String getPhone() {
		return this.phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getTitle() {
		return this.title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public List<Appointment> getAppointments() {
		return this.appointments;
	}

	public void setAppointments(List<Appointment> appointments) {
		this.appointments = appointments;
	}

	public List<Claim> getClaims() {
		return this.claims;
	}

	public void setClaims(List<Claim> claims) {
		this.claims = claims;
	}

	public List<Dependent> getDependents() {
		return this.dependents;
	}

	public void setDependents(List<Dependent> dependents) {
		this.dependents = dependents;
	}
}