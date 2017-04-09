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
 * The persistent class for the hospital_type database table.
 * 
 */
@Entity
@Table(name="hospital_type")
@NamedQuery(name="HospitalType.findAll", query="SELECT h FROM HospitalType h")
public class HospitalType implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int hospitaltypeid;

	@Temporal(TemporalType.TIMESTAMP)
	private Date createdtime;

	private String hospitaltype;

	@Temporal(TemporalType.TIMESTAMP)
	private Date modifiedtime;

	public HospitalType() {
	}

	public int getHospitaltypeid() {
		return this.hospitaltypeid;
	}

	public void setHospitaltypeid(int hospitaltypeid) {
		this.hospitaltypeid = hospitaltypeid;
	}

	public Date getCreatedtime() {
		return this.createdtime;
	}

	public void setCreatedtime(Date createdtime) {
		this.createdtime = createdtime;
	}

	public String getHospitaltype() {
		return this.hospitaltype;
	}

	public void setHospitaltype(String hospitaltype) {
		this.hospitaltype = hospitaltype;
	}

	public Date getModifiedtime() {
		return this.modifiedtime;
	}

	public void setModifiedtime(Date modifiedtime) {
		this.modifiedtime = modifiedtime;
	}
}