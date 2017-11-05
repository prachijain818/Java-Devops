package com.DAOImpl;

import javax.transaction.Transactional;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.DAO.OrdersDao;
import com.Model.Orders;

@Repository
@Transactional
public class OrdersDaoImpl implements OrdersDao{

	@Autowired
	SessionFactory sessionfactory;

	public void insertOrder(Orders or) {
		sessionfactory.getCurrentSession().save(or);
		
	}
	
	
	
}
