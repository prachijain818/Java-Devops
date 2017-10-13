package com.DAOImpl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.DAO.SupplierDao;
import com.Model.Category;
import com.Model.Product;
import com.Model.Supplier;
@Repository
@Transactional
public class SupplierDaoImpl implements SupplierDao{

	@Autowired 
	SessionFactory sessionfactory;

	
	public void insert(Supplier s) {
		Session session=  sessionfactory.openSession();
		  Transaction t = session.getTransaction();
	        t.begin();
		 session.save(s);
		 t.commit();
		
	}


	public List<Supplier> getAllSupplier() {
		Session session=  sessionfactory.openSession();
		  Transaction t = session.getTransaction();
	        t.begin();
	        List<Supplier> list=session.createQuery("from Supplier").list();
	        t.commit();
	       
		return list;
	}


	public Supplier getSupplierById(int id) {
		
	        Supplier s=(Supplier)sessionfactory.getCurrentSession().load(Supplier.class,id);
	    
		return s;
	}
}
