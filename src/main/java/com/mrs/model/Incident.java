package com.mrs.model;

import java.io.Serializable;
import javax.persistence.*;
import java.util.Date;
import java.sql.Timestamp;


/**
 * The persistent class for the incident database table.
 * 
 */
@Entity
@Table(name="incident")
public class Incident implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int incidentid;

	@Temporal(TemporalType.TIMESTAMP)
	private Date createdtime;

	private String details;
	
	private int empid;

	@Temporal(TemporalType.DATE)
	private Date firstdayofincident;

	private byte ishomevisitrequired;

	private Timestamp modifiedtime;

	//bi-directional many-to-one association to BenefitType
	@ManyToOne
	@JoinColumn(name="benefittypeid")
	private BenefitType benefitType;

	//bi-directional many-to-one association to OfficeLocation
	@ManyToOne
	@JoinColumn(name="administrativeoffice")
	private OfficeLocation officeLocation1;

	//bi-directional many-to-one association to OfficeLocation
	@ManyToOne
	@JoinColumn(name="customeroffice")
	private OfficeLocation officeLocation2;

	public Incident() {
	}

	public int getIncidentid() {
		return this.incidentid;
	}

	public void setIncidentid(int incidentid) {
		this.incidentid = incidentid;
	}

	public Date getCreatedtime() {
		return this.createdtime;
	}

	public void setCreatedtime(Date createdtime) {
		this.createdtime = createdtime;
	}

	public String getDetails() {
		return this.details;
	}

	public void setDetails(String details) {
		this.details = details;
	}

	public Date getFirstdayofincident() {
		return this.firstdayofincident;
	}

	public void setFirstdayofincident(Date firstdayofincident) {
		this.firstdayofincident = firstdayofincident;
	}

	public byte getIshomevisitrequired() {
		return this.ishomevisitrequired;
	}

	public void setIshomevisitrequired(byte ishomevisitrequired) {
		this.ishomevisitrequired = ishomevisitrequired;
	}

	public Timestamp getModifiedtime() {
		return this.modifiedtime;
	}

	public void setModifiedtime(Timestamp modifiedtime) {
		this.modifiedtime = modifiedtime;
	}

	public BenefitType getBenefitType() {
		return this.benefitType;
	}

	public void setBenefitType(BenefitType benefitType) {
		this.benefitType = benefitType;
	}

	public OfficeLocation getOfficeLocation1() {
		return this.officeLocation1;
	}

	public void setOfficeLocation1(OfficeLocation officeLocation1) {
		this.officeLocation1 = officeLocation1;
	}

	public OfficeLocation getOfficeLocation2() {
		return this.officeLocation2;
	}

	public void setOfficeLocation2(OfficeLocation officeLocation2) {
		this.officeLocation2 = officeLocation2;
	}

	public int getEmpid() {
		return empid;
	}

	public void setEmpid(int empid) {
		this.empid = empid;
	}

	@Override
	public String toString() {
		return "Incident [incidentid=" + incidentid + ", "
				+ (createdtime != null ? "createdtime=" + createdtime + ", " : "")
				+ (details != null ? "details=" + details + ", " : "") + "empid=" + empid + ", "
				+ (firstdayofincident != null ? "firstdayofincident=" + firstdayofincident + ", " : "")
				+ "ishomevisitrequired=" + ishomevisitrequired + ", "
				+ (modifiedtime != null ? "modifiedtime=" + modifiedtime + ", " : "")
				+ (benefitType != null ? "benefitType=" + benefitType + ", " : "")
				+ (officeLocation1 != null ? "officeLocation1=" + officeLocation1 + ", " : "")
				+ (officeLocation2 != null ? "officeLocation2=" + officeLocation2 : "") + "]";
	}

	
}