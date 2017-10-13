package com.controller;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.DAO.CategoryDao;
import com.DAO.ProductDao;
import com.DAO.SupplierDao;
import com.DAO.UserDao;
import com.Model.Category;
import com.Model.Product;
import com.Model.Supplier;
import com.Model.User;

@Controller
//@RequestMapping(value="/user")
public class UserController {

	@Autowired
	   UserDao userdao;
	
	
	@RequestMapping(value="/addU",method=RequestMethod.GET)
	public ModelAndView add(){
		ModelAndView mav=new ModelAndView("AddUser");
		mav.addObject("cmd",new User());
		return mav;
    }
    
    @RequestMapping(value="/newUser",method=RequestMethod.POST)
	public ModelAndView insertProduct(@Valid @ModelAttribute("cmd") User u,BindingResult result){
	ModelAndView mav=new ModelAndView();
	
	if(result.hasErrors()){
		mav.setViewName("AddUser");
		return mav;
	}
	else{
		u.setRole("USER");
		userdao.insert(u);
		mav.setViewName("redirect:/login");
		return mav;
	}
				
    }
    
  
    
      }
      


	

