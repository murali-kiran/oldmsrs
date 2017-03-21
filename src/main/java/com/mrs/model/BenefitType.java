package com.mrs.model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;


/**
 * The persistent class for the benefit_type database table.
 * 
 */
@Entity
@Table(name="benefit_type")
public class BenefitType implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int benefittypeid;

	private String benefittype;

	@Temporal(TemporalType.TIMESTAMP)
	private Date createdtime;

	@Temporal(TemporalType.TIMESTAMP)
	private Date modifiedtime;

	public BenefitType() {
	}

	public int getBenefittypeid() {
		return this.benefittypeid;
	}

	public void setBenefittypeid(int benefittypeid) {
		this.benefittypeid = benefittypeid;
	}

	public String getBenefittype() {
		return this.benefittype;
	}

	public void setBenefittype(String benefittype) {
		this.benefittype = benefittype;
	}

	public Date getCreatedtime() {
		return this.createdtime;
	}

	public void setCreatedtime(Date createdtime) {
		this.createdtime = createdtime;
	}

	public Date getModifiedtime() {
		return this.modifiedtime;
	}

	public void setModifiedtime(Date modifiedtime) {
		this.modifiedtime = modifiedtime;
	}

	@Override
	public String toString() {
		return "BenefitType [benefittypeid=" + benefittypeid + ", "
				+ (benefittype != null ? "benefittype=" + benefittype + ", " : "")
				+ (createdtime != null ? "createdtime=" + createdtime + ", " : "")
				+ (modifiedtime != null ? "modifiedtime=" + modifiedtime : "") + "]";
	}
}