package com.mrs.model;

import java.io.Serializable;
import javax.persistence.*;
import java.util.Date;
import java.sql.Timestamp;
import java.util.List;


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

	private Timestamp modifiedtime;

	//bi-directional many-to-one association to Hospital
	@OneToMany(mappedBy="hospitalType")
	private List<Hospital> hospitals;

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

	public Timestamp getModifiedtime() {
		return this.modifiedtime;
	}

	public void setModifiedtime(Timestamp modifiedtime) {
		this.modifiedtime = modifiedtime;
	}

	public List<Hospital> getHospitals() {
		return this.hospitals;
	}

	public void setHospitals(List<Hospital> hospitals) {
		this.hospitals = hospitals;
	}

	public Hospital addHospital(Hospital hospital) {
		getHospitals().add(hospital);
		hospital.setHospitalType(this);

		return hospital;
	}

	public Hospital removeHospital(Hospital hospital) {
		getHospitals().remove(hospital);
		hospital.setHospitalType(null);

		return hospital;
	}

}