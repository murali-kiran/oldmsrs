package com.mrs.controller;

import org.apache.log4j.Logger;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class LoginController {
		private static final Logger logger = Logger.getLogger(LoginController.class);
		
		@RequestMapping(value="/",method = RequestMethod.GET)
		public String welcomePage(Model model){
			SecurityContext context=SecurityContextHolder.getContext();
	    	Authentication authentication=context.getAuthentication();
	    	
	    	if(authentication !=null && authentication.isAuthenticated()){
	    		
	    		String userName=authentication.getName();
	    		if(userName !=null && !"anonymousUser".equals(userName))
	    		{	
	    			logger.info(" username is "+ userName);
	    		return "createEmp";  
	    		}
	    	}
			return "forward:/login";
		}
		
		@RequestMapping(value="/login",method = RequestMethod.GET)
		public String login(Model model){
			return "login";
		}
		
		@RequestMapping(value="/loginfailed", method = RequestMethod.GET)
		public String loginerror(ModelMap model) {
			model.addAttribute("error", "true");
			return "login";
		}
		
}
