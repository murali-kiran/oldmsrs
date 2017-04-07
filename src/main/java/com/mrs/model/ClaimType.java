package com.mrs.model;

import java.io.Serializable;
import javax.persistence.*;
import java.util.Date;
import java.util.List;


/**
 * The persistent class for the claim_type database table.
 * 
 */
@Entity
@Table(name="claim_type")
@NamedQuery(name="ClaimType.findAll", query="SELECT c FROM ClaimType c")
public class ClaimType implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int claimtypeid;

	private String claimtype;

	@Temporal(TemporalType.TIMESTAMP)
	private Date createdtime;

	@Temporal(TemporalType.TIMESTAMP)
	private Date modifiedtime;

	//bi-directional many-to-one association to Claim
	@OneToMany(mappedBy="claimType")
	private List<Claim> claims;

	public ClaimType() {
	}

	public int getClaimtypeid() {
		return this.claimtypeid;
	}

	public void setClaimtypeid(int claimtypeid) {
		this.claimtypeid = claimtypeid;
	}

	public String getClaimtype() {
		return this.claimtype;
	}

	public void setClaimtype(String claimtype) {
		this.claimtype = claimtype;
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

	public List<Claim> getClaims() {
		return this.claims;
	}

	public void setClaims(List<Claim> claims) {
		this.claims = claims;
	}

	public Claim addClaim(Claim claim) {
		getClaims().add(claim);
		claim.setClaimType(this);

		return claim;
	}

	public Claim removeClaim(Claim claim) {
		getClaims().remove(claim);
		claim.setClaimType(null);

		return claim;
	}

}