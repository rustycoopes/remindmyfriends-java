package com.rustyware.remindmyfriends.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "users")
public class User {
	
	@Column(name = "name")
	private String name;
	
	@Column(name = "emailAddress")
	private String emailAddress;
	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name = "id")
	private long id;
	        
	public long getId()
	{
	   return id;
	}
	
	public String getEmailAddress(){
		return emailAddress;
	}
	
	public String getName(){
		return name;
	}
	
	@Override
	public String toString(){
		return String.format("{user id=%s name=%s email=%s}", id, name, emailAddress);
	}
}
