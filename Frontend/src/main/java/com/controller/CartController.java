package com.controller;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.DAO.CartDao;
import com.DAO.CategoryDao;
import com.DAO.OrdersDao;
import com.DAO.ProductDao;
import com.DAO.UserDao;
import com.Model.Cart;
import com.Model.Orders;
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
	@Autowired
	Orders ordertable;
	@Autowired
	OrdersDao orderdao;
	@Autowired
	   CategoryDao catdao;
	
	
	@RequestMapping(value="/InCart/{productid}")
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
			if(cartexists==null && stock!=0)
			{
				cart.setTotalItems(stock);  	
				cartdao.insert(cart);
				mav = new ModelAndView("AddToCart");
			}			
			
			else if(cartexists != null && stock!=0)
			{
				cart.setCartid(cartexists.getCartid());
				cart.setTotalItems(cartexists.getTotalItems()+stock);
				cartdao.update(cart);
				mav = new ModelAndView("AddToCart");
			}
			
			else if(stock==0)
			{
				mav = new ModelAndView("index");
			}
			
			 long quantity=p.getStock();
			 long fin=quantity-stock;
			 p.setStock(fin);
			 prodao.update(p);			 
			 
			 mav.addObject("cartinfo",cartdao.getCartList(name));			
			
		 }
		
		 else {
			 mav=new ModelAndView("Login");	 
		 }
		
		return mav;
		}

			
			
			

	 @RequestMapping(value="/deleteItems/{cartid}",method=RequestMethod.GET)
	    public ModelAndView delete(@PathVariable int cartid ,Principal principal){
		 
		 ModelAndView mav=new ModelAndView("AddToCart");
		 String name=principal.getName();
		 
	    	cartdao.delete(cartid);
	    	mav.addObject("cartinfo",cartdao.getCartList(name));

			 return mav; 
	    }
	 
	 
	 @RequestMapping(value="/CheckOut",method=RequestMethod.GET)
		public ModelAndView checkout(Principal principal)
		{
			ModelAndView mav=new ModelAndView("CheckOut");
			String name=principal.getName();
			User u=userdao.getUserByName(name);
			mav.addObject("cartli",cartdao.getCartList(name));
			mav.addObject("us",u);
			return mav;	
		}
	 
	 
	 @RequestMapping(value = "/Thankyou", method = RequestMethod.POST)
		public ModelAndView End() {
			ModelAndView mav = new ModelAndView("ThankYou");
			return mav;
		}
	 
	 
	 
	 @RequestMapping(value="/invoice",method=RequestMethod.POST)
		public ModelAndView invoice(Principal principal, @RequestParam("paymentType")String paymentType, @RequestParam("total")String total)
		{			
		 ModelAndView mav=new ModelAndView("Invoice");
			String name=principal.getName();
			List <Cart> cart=cartdao.getCartList(name);
			User u=userdao.getUserByName(name);
			ordertable.setUser(u);
			double totalamount=Double.parseDouble(total);
			ordertable.setTotalamount(totalamount);
			ordertable.setPaymenttype(paymentType);
			mav.addObject("use",u);
			mav.addObject("cart",cart);
			mav.addObject("tabl",ordertable);
		    orderdao.insertOrder(ordertable);
		    for (Cart ci : cart) {
				cartdao.delete(ci.getCartid());
			}		    
			return mav;	
		}
	 
	 
	 @RequestMapping(value = "/cart")
		public ModelAndView openCart(Principal principal) {
			ModelAndView mav;

			if (principal != null) {
				String name=principal.getName();
				mav = new ModelAndView("AddToCart");
				List<Cart> cart = cartdao.getCartList(name);
				mav.addObject("cartinfo", cart);
			} else {
				mav = new ModelAndView("Login");
			}
			return mav;
		}
	 
	 
	 @ModelAttribute
	    public void categoryList(Model m){
	    	m.addAttribute("catlist",catdao.getAllCategory());
	      	m.addAttribute("productlist",prodao.getAllProducts());
	    }
	    
	 
	 
}
