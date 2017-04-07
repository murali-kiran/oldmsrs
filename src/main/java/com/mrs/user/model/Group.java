package com.mrs.user.model;

import java.io.Serializable;
import javax.persistence.*;
import java.util.List;


/**
 * The persistent class for the groups database table.
 * 
 */
@Entity
@Table(name="groups")
public class Group implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int id;

	@Column(name="group_name")
	private String groupName;

	//bi-directional many-to-one association to GroupAuthority
	@OneToMany(mappedBy="group")
	private List<GroupAuthority> groupAuthorities;

	//bi-directional many-to-one association to GroupMember
	@OneToMany(mappedBy="group")
	private List<GroupMember> groupMembers;

	public Group() {
	}

	public int getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getGroupName() {
		return this.groupName;
	}

	public void setGroupName(String groupName) {
		this.groupName = groupName;
	}

	public List<GroupAuthority> getGroupAuthorities() {
		return this.groupAuthorities;
	}

	public void setGroupAuthorities(List<GroupAuthority> groupAuthorities) {
		this.groupAuthorities = groupAuthorities;
	}

	public GroupAuthority addGroupAuthority(GroupAuthority groupAuthority) {
		getGroupAuthorities().add(groupAuthority);
		groupAuthority.setGroup(this);

		return groupAuthority;
	}

	public GroupAuthority removeGroupAuthority(GroupAuthority groupAuthority) {
		getGroupAuthorities().remove(groupAuthority);
		groupAuthority.setGroup(null);

		return groupAuthority;
	}

	public List<GroupMember> getGroupMembers() {
		return this.groupMembers;
	}

	public void setGroupMembers(List<GroupMember> groupMembers) {
		this.groupMembers = groupMembers;
	}

	public GroupMember addGroupMember(GroupMember groupMember) {
		getGroupMembers().add(groupMember);
		groupMember.setGroup(this);

		return groupMember;
	}

	public GroupMember removeGroupMember(GroupMember groupMember) {
		getGroupMembers().remove(groupMember);
		groupMember.setGroup(null);

		return groupMember;
	}

}