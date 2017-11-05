package com.controller;

import java.io.BufferedOutputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

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
import com.DAO.CategoryDao;
import com.DAO.ProductDao;
import com.DAO.SupplierDao;
import com.Model.Category;
import com.Model.Product;
import com.Model.Supplier;


@Controller

@RequestMapping(value="/admin")
public class AdminController {
	 @Autowired
	   Product p;
	@Autowired
	   ProductDao prodao;
	@Autowired
	   CategoryDao catdao;
	@Autowired
	   SupplierDao supdao;
	  

	@RequestMapping(value="/addP",method=RequestMethod.GET)
	
	public ModelAndView add(HttpServletRequest request){
		ModelAndView mav=new ModelAndView();
		mav.addObject("pro",new Product());
		
		List<Category> cl=catdao.getAllCategory();
		mav.addObject("clist",cl);
		
		List<Supplier> sl=supdao.getAllSupplier();
		mav.addObject("slist",sl);
//	for(Category l:cl)
//	{
//		System.out.println(l.getCategoryname());
//	}
		
		mav.addObject("cat",new Category());
		mav.addObject("sup",new Supplier());
		mav.setViewName("AddProduct");
		return mav;
    }
	
	@RequestMapping(value="/newPro",method=RequestMethod.POST)
	public ModelAndView  insertProduct(@ModelAttribute("pro") Product p,@RequestParam("image") MultipartFile file,HttpServletRequest request){
			
			p.setCategoryname(catdao.getCategoryById(Integer.parseInt(request.getParameter("categoryId"))));
			p.setSuppliername(supdao.getSupplierById(Integer.parseInt(request.getParameter("supplierId"))));
			
			String filepath=request.getSession().getServletContext().getRealPath("/");
			String originalfile=file.getOriginalFilename();
		
			prodao.insert(p);
			try{
				byte imagebyte[]=file.getBytes();
	BufferedOutputStream fos=new BufferedOutputStream(new FileOutputStream(filepath+"/resources/image/"+p.getProductid()+".png"));
				System.out.println("FilePath:"+filepath);
				fos.write(imagebyte);
				fos.close();
			}  catch(IOException e){
				e.printStackTrace();
			}  catch(Exception e){
				e.printStackTrace();
			}
			
			
			ModelAndView mav=new ModelAndView("Modal");
						return mav;
	 }
	 
	 
	 
	 @RequestMapping("/viewP")
	 public ModelAndView viewProduct(){  
	        List<Product> list=prodao.getAllProducts();  
	        
	        return new ModelAndView("ViewProduct","list",list);
	    }
	 

		 @RequestMapping(value="/newCat",method=RequestMethod.POST)
			public ModelAndView  insertCategory(@ModelAttribute("cat") Category c){
			ModelAndView mav=new ModelAndView("redirect:/admin/viewCat");
				catdao.insert(c);
				return mav;
		 }
	 
		 @RequestMapping("/viewCat")
		 public ModelAndView viewCategory(){  
		        List<Category> list=catdao.getAllCategory();
		        return new ModelAndView("ViewCategory","clist",list);
		    }
		 
		 
		 
		 
		 

		 
		 
		 
		 
		 @RequestMapping(value="/newSup",method=RequestMethod.POST)
			public ModelAndView  insertSupplier(@ModelAttribute("cat") Supplier s){
			ModelAndView mav=new ModelAndView("redirect:/admin/viewSup");
				supdao.insert(s);
				return mav;
		 }
	 
		 @RequestMapping("/viewSup")
		 public ModelAndView viewSupplier(){  
		        List<Supplier> list=supdao.getAllSupplier();  
		        return new ModelAndView("ViewSupplier","slist",list);
		    }
	 
		 
	 
		 
	 
	 
	 
	 @RequestMapping(value="/deleteP/{productid}")
	    public ModelAndView delete(@PathVariable int productid ){
	    	prodao.delete(productid);
	    	return new ModelAndView("redirect:/admin/viewP");
	    }
	    
	    
	    @RequestMapping(value="/editP/{productid}")
		 public ModelAndView update(@PathVariable int productid){
		    Product p=prodao.getProById(productid);
		    
		    ModelAndView mav=new ModelAndView("UpdateProduct","command",p);
			//ModelAndView mav=new ModelAndView();
			List<Category> cl=catdao.getAllCategory();
			mav.addObject("calist",cl);
//			for(Category l:cl)			{
//				System.out.println(l.getCategoryname());
//			}
			List<Supplier> sl=supdao.getAllSupplier();
			mav.addObject("sulist",sl);
            
            return mav;
	    }
   
	    @RequestMapping(value="/editSave",method = RequestMethod.POST)
		 public ModelAndView updateSave(@ModelAttribute ("command")Product pro,@RequestParam("image") MultipartFile file,HttpServletRequest req){
	    	
	    	pro.setCategoryname(catdao.getCategoryById(Integer.parseInt(req.getParameter("catId"))));
			pro.setSuppliername(supdao.getSupplierById(Integer.parseInt(req.getParameter("supId"))));
			

			String filepath=req.getSession().getServletContext().getRealPath("/");
			String originalfile=file.getOriginalFilename();
			 prodao.update(pro);
		
			try{
				byte imagebyte[]=file.getBytes();
	BufferedOutputStream fos=new BufferedOutputStream(new FileOutputStream(filepath+"/resources/image/"+pro.getProductid()+".png"));
				System.out.println("FilePath:"+filepath);
				fos.write(imagebyte);
				fos.close();
			}  catch(IOException e){
				e.printStackTrace();
			}  catch(Exception e){
				e.printStackTrace();
			}
			
			
			 return new ModelAndView("redirect:/admin/viewP");
	    }
	    
	    
	    @ModelAttribute
	    public void categoryList(Model m){
	    	m.addAttribute("catlist",catdao.getAllCategory());
	    }
	    
	    
	    
	    
	    
	    
	    
	    
	    
	   
	    
}
