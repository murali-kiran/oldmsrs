package com.mrs.user.model;

import java.io.Serializable;
import javax.persistence.*;


/**
 * The persistent class for the group_members database table.
 * 
 */
@Entity
@Table(name="group_members")
public class GroupMember implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int id;

	private String username;

	//bi-directional many-to-one association to Group
	@ManyToOne
	private Group group;

	public GroupMember() {
	}

	public int getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUsername() {
		return this.username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public Group getGroup() {
		return this.group;
	}

	public void setGroup(Group group) {
		this.group = group;
	}

}