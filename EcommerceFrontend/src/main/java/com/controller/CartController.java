package com.controller;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.DAO.CartDao;
import com.DAO.ProductDao;
import com.DAO.UserDao;
import com.Model.Cart;
import com.Model.Product;
import com.Model.User;

@Controller
public class CartController {

	@Autowired
	CartDao cartdao;
	@Autowired
	UserDao userdao;
	@Autowired
	ProductDao prodao;
	@Autowired
	Cart cart;
	
	
	@RequestMapping(value="/InCart/{productid}",method=RequestMethod.POST)
	public ModelAndView add(@PathVariable("productid")int pid,@RequestParam("stock") String quant,Principal principal){
		System.out.println("inside cart");
		
		ModelAndView mav;
		if (principal!=null){
			 mav=new ModelAndView("AddToCart");
			@SuppressWarnings("unused")
			
			
		//	User u=userdao.getUserByName(principal.getName());
			String name=principal.getName();
			User u=  userdao.getUserByName(name);
			
			Product p=prodao.getProById(pid);
			
			double price=p.getPrice();
			String productname=p.getProductname();
			String description=p.getDescription();
			int id=p.getProductid();
			MultipartFile image=p.getImage();
			
			int stock=Integer.parseInt(quant);
			double totalprice=price*stock;
			
			cart.setFinalAmount(totalprice);
			
		//	String useremail=u.getEmail();
			cart.setUser(u);
			
			cart.setProid(id);
			cart.setPrice(price);
			cart.setCartproductname(productname);
			cart.setCartproductdesc(description);
			
			
			
			Cart cartexists=cartdao.getCartItem(pid, name);
			if(cartexists==null)
			{
				cart.setTotalItems(stock);  	
				cartdao.insert(cart);
				
			}
			
			else
			{
				cart.setCartid(cartexists.getCartid());
				cart.setTotalItems(cartexists.getTotalItems()+stock);
				cartdao.update(cart);
				//updating cart instance
//				double grandTotal= cart.getFinalAmount();
//				grandTotal +=totalprice;
//				cart.setFinalAmount(grandTotal);
//				long items=cart.getTotalItems();
//				items +=1;
//				cart.setTotalItems(items);
//				double totalAmount =0;
//				totalAmount+=grandTotal;
				//cart.setGrandAmount(totalAmount);
			}
			
			
			//updating product instance
			 long quantity=p.getStock();
			 long fin=quantity-stock;
			 p.setStock(fin);

			 prodao.update(p);			 
			 
			 mav.addObject("cartinfo",cartdao.getCartList(name));			
			
			
		 }
		 else
		 {
			 mav=new ModelAndView("Login");
			 
		 }
		return mav;
			
			
		   
		}

			
			
			
	
	
	
	
//	@RequestMapping(value="/newAdd",method=RequestMethod.POST)
//	public ModelAndView  insertProduct(@ModelAttribute("in") Cart c){
//	ModelAndView mav=new ModelAndView("redirect:/viewItems");
//		cartdao.insert(c);
//		return mav;
// }
//	
//	 @RequestMapping("/viewItems")
//	 public ModelAndView viewProduct(){  
//	        List<Cart> list=cartdao.getCartItem();  
//	        return new ModelAndView("ViewCartItems","list",list);
//	    }
//	 
//	 @RequestMapping(value="/deleteItems/{cartid}")
//	    public ModelAndView delete(@PathVariable int cartid ){
//	    	cartdao.delete(cartid);
//	    	return new ModelAndView("redirect:/viewItems");
//	    }
//	    
//	 @RequestMapping(value="/editItems/{cartid}")
//	 public ModelAndView update(@PathVariable int cartid){
//	    Cart c=cartdao.getCartById(cartid);
//        return new ModelAndView("UpdateCart","command",c);
//    }
//
//    @RequestMapping(value="/editSaveItems",method = RequestMethod.POST)
//	 public ModelAndView updateSave(@ModelAttribute ("command")Cart pro){
//		 cartdao.update(pro);
//		 return new ModelAndView("redirect:/viewItems");
//    }
}

