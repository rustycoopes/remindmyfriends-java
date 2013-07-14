package com.rustyware.remindmyfriends;

import java.io.IOException;
import java.io.Writer;
import java.util.List;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.rustyware.remindmyfriends.domain.User;
import com.rustyware.remindmyfriends.repositories.UserRepository;



@Controller
@RequestMapping("/users")
public class UsersController {

	
private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired private UserRepository userRepo;
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String getAllUsers( Model model) {
		
		logger.info("User Controller asked for all users");
		
		List<User> users = userRepo.findAll();
		
		model.addAttribute("users", users);
		
		return "/users/users";
	}


	 @RequestMapping(value="/{id}/delete", method=RequestMethod.POST)
	 public String deleteUser(@PathVariable("id")long id, Model model) {
		
		userRepo.delete(id);
        return getAllUsers(model);
    }
	
	
	 @RequestMapping(value="/{id}", method=RequestMethod.GET)
	  public @ResponseBody User getUser(@PathVariable("id")long id) {
			
		logger.info("User Controller asked to retrieve a user");
		
		User user = userRepo.findOne(id);	
		
		return user;
	}
	 
	 @RequestMapping(value="/{id}", method = RequestMethod.POST)
	  public void update(@RequestBody User user) throws IOException {
			
		 logger.info("User Controller asked to update a user");
		
		 if(userRepo.findOne(user.getId()) == null)
			 userRepo.add(user);
		 else
			 userRepo.update(user);
		 
	  }
	
}
