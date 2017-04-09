package com.mrs.model;

import java.io.Serializable;
import javax.persistence.*;
import java.util.Date;
import java.sql.Timestamp;
import java.util.List;


/**
 * The persistent class for the appointment_type database table.
 * 
 */
@Entity
@Table(name="appointment_type")
@NamedQuery(name="AppointmentType.findAll", query="SELECT a FROM AppointmentType a")
public class AppointmentType implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int appointmenttypeid;

	private String appointmenttype;

	@Temporal(TemporalType.TIMESTAMP)
	private Date createdtime;
	@Temporal(TemporalType.TIMESTAMP)
	private Date modifiedtime;

	//bi-directional many-to-one association to Appointment
	@OneToMany
	@JoinColumn(name="appointmenttypeid",insertable=false,updatable=false)
	private List<Appointment> appointments;

	public AppointmentType() {
	}

	public int getAppointmenttypeid() {
		return this.appointmenttypeid;
	}

	public void setAppointmenttypeid(int appointmenttypeid) {
		this.appointmenttypeid = appointmenttypeid;
	}

	public String getAppointmenttype() {
		return this.appointmenttype;
	}

	public void setAppointmenttype(String appointmenttype) {
		this.appointmenttype = appointmenttype;
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

	public List<Appointment> getAppointments() {
		return this.appointments;
	}

	public void setAppointments(List<Appointment> appointments) {
		this.appointments = appointments;
	}


}