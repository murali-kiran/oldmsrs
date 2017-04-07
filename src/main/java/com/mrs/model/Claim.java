package com.mrs.model;

import java.io.Serializable;
import javax.persistence.*;
import java.util.Date;
import java.sql.Timestamp;


/**
 * The persistent class for the claim database table.
 * 
 */
@Entity
@Table(name="claim")
@NamedQuery(name="Claim.findAll", query="SELECT c FROM Claim c")
public class Claim implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int claimid;

	private byte activeappointment;

	private String auditby;

	private String auditcomments;

	@Temporal(TemporalType.TIMESTAMP)
	private Date createdtime;

	@Temporal(TemporalType.DATE)
	private Date dateofoccurance;

	private String description;

	private String document;

	@Temporal(TemporalType.DATE)
	private Date modifiedtime;

	private String prognosis;

	private String status;

	//bi-directional many-to-one association to ClaimType
	@ManyToOne
	@JoinColumn(name="claimtypeid")
	private ClaimType claimType;

	//bi-directional many-to-one association to Emp
	@ManyToOne
	@JoinColumn(name="beneficiary")
	private Emp emp;

	public Claim() {
	}

	public int getClaimid() {
		return this.claimid;
	}

	public void setClaimid(int claimid) {
		this.claimid = claimid;
	}

	public byte getActiveappointment() {
		return this.activeappointment;
	}

	public void setActiveappointment(byte activeappointment) {
		this.activeappointment = activeappointment;
	}

	public String getAuditby() {
		return this.auditby;
	}

	public void setAuditby(String auditby) {
		this.auditby = auditby;
	}

	public String getAuditcomments() {
		return this.auditcomments;
	}

	public void setAuditcomments(String auditcomments) {
		this.auditcomments = auditcomments;
	}

	public Date getCreatedtime() {
		return this.createdtime;
	}

	public void setCreatedtime(Date createdtime) {
		this.createdtime = createdtime;
	}

	public Date getDateofoccurance() {
		return this.dateofoccurance;
	}

	public void setDateofoccurance(Date dateofoccurance) {
		this.dateofoccurance = dateofoccurance;
	}

	public String getDescription() {
		return this.description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getDocument() {
		return this.document;
	}

	public void setDocument(String document) {
		this.document = document;
	}

	public Date getModifiedtime() {
		return this.modifiedtime;
	}

	public void setModifiedtime(Date modifiedtime) {
		this.modifiedtime = modifiedtime;
	}

	public String getPrognosis() {
		return this.prognosis;
	}

	public void setPrognosis(String prognosis) {
		this.prognosis = prognosis;
	}

	public String getStatus() {
		return this.status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public ClaimType getClaimType() {
		return this.claimType;
	}

	public void setClaimType(ClaimType claimType) {
		this.claimType = claimType;
	}

	public Emp getEmp() {
		return this.emp;
	}

	public void setEmp(Emp emp) {
		this.emp = emp;
	}

}