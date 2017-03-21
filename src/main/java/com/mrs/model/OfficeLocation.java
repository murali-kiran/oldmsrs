package com.mrs.model;

import java.io.Serializable;
import java.sql.Timestamp;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;


/**
 * The persistent class for the office_location database table.
 * 
 */
@Entity
@Table(name="office_location")
public class OfficeLocation implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int officelocationid;

	@Temporal(TemporalType.TIMESTAMP)
	private Date createdtime;

	private Timestamp modifiedtime;

	private String officelocation;

	public OfficeLocation() {
	}

	public int getOfficelocationid() {
		return this.officelocationid;
	}

	public void setOfficelocationid(int officelocationid) {
		this.officelocationid = officelocationid;
	}

	public Date getCreatedtime() {
		return this.createdtime;
	}

	public void setCreatedtime(Date createdtime) {
		this.createdtime = createdtime;
	}

	public Timestamp getModifiedtime() {
		return this.modifiedtime;
	}

	public void setModifiedtime(Timestamp modifiedtime) {
		this.modifiedtime = modifiedtime;
	}

	public String getOfficelocation() {
		return this.officelocation;
	}

	public void setOfficelocation(String officelocation) {
		this.officelocation = officelocation;
	}

	@Override
	public String toString() {
		return "OfficeLocation [officelocationid=" + officelocationid + ", "
				+ (createdtime != null ? "createdtime=" + createdtime + ", " : "")
				+ (modifiedtime != null ? "modifiedtime=" + modifiedtime + ", " : "")
				+ (officelocation != null ? "officelocation=" + officelocation : "") + "]";
	}
	
}