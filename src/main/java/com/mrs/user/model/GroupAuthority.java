package com.mrs.user.model;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the group_authorities database table.
 * 
 */
@Entity
@Table(name="group_authorities")
public class GroupAuthority implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int id;

	private String authority;

	//bi-directional many-to-one association to Group
	@ManyToOne
	private Group group;

	public GroupAuthority() {
	}

	public int getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getAuthority() {
		return this.authority;
	}

	public void setAuthority(String authority) {
		this.authority = authority;
	}

	public Group getGroup() {
		return this.group;
	}

	public void setGroup(Group group) {
		this.group = group;
	}

}