package com.mrs.model;

import java.io.Serializable;
import javax.persistence.*;
import java.util.Date;


/**
 * The persistent class for the appointment database table.
 * 
 */
@Entity
@Table(name="appointment")
@NamedQuery(name="Appointment.findAll", query="SELECT a FROM Appointment a")
public class Appointment implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int appointmentid;

	@Temporal(TemporalType.TIMESTAMP)
	private Date appointmentdate;

	@Temporal(TemporalType.TIMESTAMP)
	private Date createdtime;

	private String department;

	private String details;

	private String doctorname;

	private String emailid;

	private int hospitalid;

	private String hospitalname;

	private int hospitaltype;
	@Temporal(TemporalType.TIMESTAMP)
	private Date modifiedtime;

	private byte nature;

	private String phone;
	private int claimid;
	//bi-directional many-to-one association to Emp

	public int getClaimid() {
		return claimid;
	}

	public void setClaimid(int claimid) {
		this.claimid = claimid;
	}

	@Column(name="beneficiary")
	private int empid;

	//bi-directional many-to-one association to AppointmentType

	private int appointmenttypeid;

	public Appointment() {
	}

	public int getAppointmentid() {
		return this.appointmentid;
	}

	public void setAppointmentid(int appointmentid) {
		this.appointmentid = appointmentid;
	}

	public Date getAppointmentdate() {
		return this.appointmentdate;
	}

	public void setAppointmentdate(Date appointmentdate) {
		this.appointmentdate = appointmentdate;
	}

	public Date getCreatedtime() {
		return this.createdtime;
	}

	public void setCreatedtime(Date createdtime) {
		this.createdtime = createdtime;
	}

	public String getDepartment() {
		return this.department;
	}

	public void setDepartment(String department) {
		this.department = department;
	}

	public String getDetails() {
		return this.details;
	}

	public void setDetails(String details) {
		this.details = details;
	}

	public String getDoctorname() {
		return this.doctorname;
	}

	public void setDoctorname(String doctorname) {
		this.doctorname = doctorname;
	}

	public String getEmailid() {
		return this.emailid;
	}

	public void setEmailid(String emailid) {
		this.emailid = emailid;
	}

	public int getHospitalid() {
		return this.hospitalid;
	}

	public void setHospitalid(int hospitalid) {
		this.hospitalid = hospitalid;
	}

	public String getHospitalname() {
		return this.hospitalname;
	}

	public void setHospitalname(String hospitalname) {
		this.hospitalname = hospitalname;
	}

	public int getHospitaltype() {
		return this.hospitaltype;
	}

	public void setHospitaltype(int hospitaltype) {
		this.hospitaltype = hospitaltype;
	}

	public Date getModifiedtime() {
		return this.modifiedtime;
	}

	public void setModifiedtime(Date modifiedtime) {
		this.modifiedtime = modifiedtime;
	}

	public byte getNature() {
		return this.nature;
	}

	public void setNature(byte nature) {
		this.nature = nature;
	}

	public String getPhone() {
		return this.phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public int getEmpid() {
		return this.empid;
	}

	public void setEmpid(int empid) {
		this.empid = empid;
	}

	public int getAppointmenttypeid() {
		return this.appointmenttypeid;
	}

	public void setAppointmenttypeid(int appointmenttypeid) {
		this.appointmenttypeid = appointmenttypeid;
	}

}