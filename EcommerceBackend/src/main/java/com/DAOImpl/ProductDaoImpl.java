package com.DAOImpl;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Repository;

import com.DAO.ProductDao;
import com.Model.Product;
@Transactional
@Repository
public class ProductDaoImpl implements ProductDao{

	@Autowired 
	SessionFactory sessionfactory;
	
	public void insert(Product p) {
		Session session=  sessionfactory.openSession();
		  Transaction t = session.getTransaction();
	        t.begin();
		 session.save(p);
         t.commit();
		
		
	}
	
	public List<Product> getAllProducts() {
		Session session=  sessionfactory.openSession();
		  Transaction t = session.getTransaction();
	        t.begin();
	        List<Product> list=session.createQuery("from Product").list();
	        
	            t.commit();
	            return list;
	}


	public void delete(int pro) {
		Session session=  sessionfactory.openSession();
		  Transaction t = session.getTransaction();
	        t.begin();
	        Product prod=(Product)session.load(Product.class, pro);
	        session.delete(prod);
	        t.commit();
	}

	public void update(Product pro) {
		Session session=  sessionfactory.openSession();
		  Transaction t = session.getTransaction();
	        t.begin();
		session.update(pro);
        t.commit();

		
	}

      public Product getProById(int productid) {
    		
	        Product prod=(Product)sessionfactory.getCurrentSession().get(Product.class, productid);   
	       

		return prod;

		
	}

	public List<Product> getProByCat(int categoryid) {
		Session session=  sessionfactory.openSession();
		  Transaction t = session.getTransaction();
	        t.begin();
	        List<Product> list=session.createQuery("from Product where categoryid="+categoryid).list();
	        t.commit();
		return list;
	}

	public List<Product> getProDetails(int productid) {
		
		 
	     //   List<Product> list=sessionfactory.getCurrentSession().get(Product.class,productid).list();
		return null;
	}

	public Product getProductById(int pid) {
		
        Product prod=(Product)sessionfactory.getCurrentSession().get(Product.class, pid);       
        	return prod;
	}

}
