package com.mrs.model;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the nominee database table.
 * 
 */
@Entity
@Table(name="nominee")
public class Nominee implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int nomineeid;

	private String address1;

	private String address2;

	private byte age;

	private String district;

	private String name;

	private String pincode;

	private String relationship;

	private String state;
	
	private int empid;

	public Nominee() {
	}

	public int getNomineeid() {
		return this.nomineeid;
	}

	public void setNomineeid(int nomineeid) {
		this.nomineeid = nomineeid;
	}

	public String getAddress1() {
		return this.address1;
	}

	public void setAddress1(String address1) {
		this.address1 = address1;
	}

	public String getAddress2() {
		return this.address2;
	}

	public void setAddress2(String address2) {
		this.address2 = address2;
	}

	public byte getAge() {
		return this.age;
	}

	public void setAge(byte age) {
		this.age = age;
	}

	public String getDistrict() {
		return this.district;
	}

	public void setDistrict(String district) {
		this.district = district;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPincode() {
		return this.pincode;
	}

	public void setPincode(String pincode) {
		this.pincode = pincode;
	}

	public String getRelationship() {
		return this.relationship;
	}

	public void setRelationship(String relationship) {
		this.relationship = relationship;
	}

	public String getState() {
		return this.state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public int getEmpid() {
		return empid;
	}

	public void setEmpid(int empid) {
		this.empid = empid;
	}

	@Override
	public String toString() {
		return "Nominee [nomineeid=" + nomineeid + ", " + (address1 != null ? "address1=" + address1 + ", " : "")
				+ (address2 != null ? "address2=" + address2 + ", " : "") + "age=" + age + ", "
				+ (district != null ? "district=" + district + ", " : "") + (name != null ? "name=" + name + ", " : "")
				+ (pincode != null ? "pincode=" + pincode + ", " : "")
				+ (relationship != null ? "relationship=" + relationship + ", " : "")
				+ (state != null ? "state=" + state + ", " : "") + "empid=" + empid + "]";
	}
	
}