package com.mrs.model;

import java.io.Serializable;
import javax.persistence.*;
import java.util.Date;
import java.sql.Timestamp;
import java.math.BigInteger;


/**
 * The persistent class for the dependent database table.
 * 
 */
@Entity
@Table(name="dependent")
@NamedQuery(name="Dependent.findAll", query="SELECT d FROM Dependent d")
public class Dependent implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int dependentid;

	@Temporal(TemporalType.TIMESTAMP)
	private Date createdtime;

	@Temporal(TemporalType.DATE)
	private Date dob;

	private String firstname;

	private String lastname;

	private Timestamp modifiedtime;

	private BigInteger phone;

	private String relationship;

	private String title;

	//bi-directional many-to-one association to Emp
	@ManyToOne
	@JoinColumn(name="empid")
	private Emp emp;

	public Dependent() {
	}

	public int getDependentid() {
		return this.dependentid;
	}

	public void setDependentid(int dependentid) {
		this.dependentid = dependentid;
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

	public String getFirstname() {
		return this.firstname;
	}

	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}

	public String getLastname() {
		return this.lastname;
	}

	public void setLastname(String lastname) {
		this.lastname = lastname;
	}

	public Timestamp getModifiedtime() {
		return this.modifiedtime;
	}

	public void setModifiedtime(Timestamp modifiedtime) {
		this.modifiedtime = modifiedtime;
	}

	public BigInteger getPhone() {
		return this.phone;
	}

	public void setPhone(BigInteger phone) {
		this.phone = phone;
	}

	public String getRelationship() {
		return this.relationship;
	}

	public void setRelationship(String relationship) {
		this.relationship = relationship;
	}

	public String getTitle() {
		return this.title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public Emp getEmp() {
		return this.emp;
	}

	public void setEmp(Emp emp) {
		this.emp = emp;
	}

}