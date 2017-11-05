package com.DAOImpl;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


import com.DAO.CategoryDao;
import com.Model.Category;
import com.Model.Product;

@Repository
@Transactional
public class CategoryDaoImpl implements CategoryDao{
	
	@Autowired 
	SessionFactory sessionfactory;

	public void insert(Category c) {
		Session session=  sessionfactory.openSession();
		  Transaction t = session.getTransaction();
	        t.begin();
		 session.save(c);
		 t.commit();
		
	}

	public List<Category> getAllCategory() {
		Session session=  sessionfactory.openSession();
		  Transaction t = session.getTransaction();
	        t.begin();
	        List<Category> list=session.createQuery("from Category").list();
	        t.commit();
	       
		return list;
	}

	public Category getCategoryById(int id) {
		
	        Category c=(Category)sessionfactory.getCurrentSession().load(Category.class,id);
	      	return c;
	}

}
