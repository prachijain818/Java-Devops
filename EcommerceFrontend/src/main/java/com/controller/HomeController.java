package com.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.DAO.CategoryDao;
import com.DAO.ProductDao;
import com.Model.Product;

@Controller
public class HomeController {

	@Autowired
	   CategoryDao catdao;
	@Autowired
	   ProductDao prodao;
	
	
	@RequestMapping("/")
	public String acc() {
		
		return "index";
}
	@RequestMapping("/index")
	public String acc1() {
		
		return "index";
}

	@RequestMapping("/login")
	public String login() {
		
		return "Login";
}
	
	
	
	
	
	
	
	
	
	  
    @RequestMapping(value="/viewCatPro/{categoryid}")  		
  		public ModelAndView viewProCategory(@PathVariable int categoryid){  
	        List<Product> list=prodao.getProByCat(categoryid); 
	        System.out.println(categoryid);
	        return new ModelAndView("ViewProByCat","prolist",list);
	    }
    
    @ModelAttribute
    public void categoryList(Model m){
    	m.addAttribute("catlist",catdao.getAllCategory());
      	m.addAttribute("productlist",prodao.getAllProducts());
    }

    @RequestMapping(value="/prodetails/{productid}")  		
		public ModelAndView proDetails(@PathVariable int productid){  
     	ModelAndView mav=new ModelAndView();
     	Product pl= prodao.getProductById(productid);
    	mav.addObject("pro",pl);
    	mav.setViewName("ProductDetails");
   
		return mav;
    }
   
	
}
