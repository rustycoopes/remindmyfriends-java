package com.rustyware.remindmyfriends.repositories;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.rustyware.remindmyfriends.database.UserDatabase;
import com.rustyware.remindmyfriends.domain.User;


@Repository
public class UserRepository {
	private static final Logger logger = LoggerFactory.getLogger(UserRepository.class);

	@Autowired private UserDatabase database;
	  
	public List<User> findAll() {
		logger.info("finding all users from repository");
		return database.findAll();
	}

	public void delete(long id) {
		// TODO Auto-generated method stub
		logger.info("deleting user");
		User user = findOne(id);
		if(user != null){
		database.delete(user);
		logger.info("User deleted");
			}
		else{
			logger.info("Couldnt find user to delete");
				
		}
	}

	public User findOne(long id) {

		logger.info("Finding user for id " + id + " very slowly !!!");
		for(User u : database.findAll()){
			if(u.getId() == id)
				return u;
		}
		return null;
	}

	public void add(User user) {
		logger.info("Adding new : " + user.toString());
		database.saveOrUpdate(user);
	}

	public void update(User user) {
		logger.info("Updating existing  : " + user.toString());
		database.saveOrUpdate(user);
	}

}

