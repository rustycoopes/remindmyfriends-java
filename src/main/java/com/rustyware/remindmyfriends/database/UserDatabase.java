package com.rustyware.remindmyfriends.database;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.rustyware.remindmyfriends.domain.User;

@Component
@SuppressWarnings({"unchecked", "rawtypes"})
public class UserDatabase {
	@Autowired private SessionFactory sessionFactory;
	private static final Logger logger = LoggerFactory.getLogger(UserDatabase.class);

	@Transactional
	public List<User> findAll() {
		
		logger.info("finding all users from the database");
	
		Session session = sessionFactory.getCurrentSession();
		List users = session.createQuery("from User").list();
		logger.info("found {} users", users.size());

		
		return users;
	}

	@Transactional
	public void saveOrUpdate(User user) {
		logger.info("save or update user " + user.toString() + " in database");
		
		Session session = sessionFactory.getCurrentSession();
		
		session.saveOrUpdate(user);
		logger.info("saved " + user.toString() + " in database");
	}
	
	@Transactional
	public void delete(User user) {
		logger.info("deleting " + user.toString() + " in database");
		
		Session session = sessionFactory.getCurrentSession();
		session.delete(user);
		logger.info("deleted " + user.toString() + " in database");
	}
}
