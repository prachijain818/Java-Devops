package com.DAOImpl;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.DAO.UserDao;
import com.Model.User;

@Repository
@Transactional
public class UserDaoImpl implements UserDao{

	@Autowired 
	SessionFactory sessionfactory;
	
	public void insert(User u) {
		
		 sessionfactory.getCurrentSession().save(u);
		
	      System.out.println("done properly");
	      
	}

	
	public User getUserById(int uid) {
	
	        User u=(User)sessionfactory.getCurrentSession().load(User.class,uid);
		 	return u;
	}
	

	
	public User getUserByName(String uname) {
		Session session=  sessionfactory.openSession();
		 Transaction t = session.getTransaction();
	     t.begin();
         User u=(User)session.get(User.class,uname);
         t.commit();
		 return u;
	}
	



}
