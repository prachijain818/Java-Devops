package com.DAOImpl;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.DAO.CartDao;
import com.Model.Cart;
import com.Model.Product;

@Transactional
@Repository
public class CartDaoImpl implements CartDao{

	@Autowired 
	SessionFactory sessionfactory;
	
	public void insert(Cart c) {
		
		 sessionfactory.getCurrentSession().save(c);
	}

	
	public List<Cart> getCartList(String usermail) {
		
	   List<Cart> list=sessionfactory.getCurrentSession().createQuery("from Cart where usermail = :usermail").setString("usermail", usermail).list();
	        
		return list;
		
	}

	public void delete(int cart) {
		
		 Cart car=(Cart)sessionfactory.getCurrentSession().load(Cart.class, cart);
		 sessionfactory.getCurrentSession().delete(car);
	}

	public void update(Cart cart) {
		sessionfactory.getCurrentSession().update(cart);
	}

	
	public Cart getCartById(int cartid) {
	        Cart car=sessionfactory.getCurrentSession().get(Cart.class, cartid);
		return car;
	}
	

	public Cart getCartItem(int pid, String userid) {
		
	        Cart car=(Cart)sessionfactory.getCurrentSession().createQuery("from Cart where usermail=:uid and proid=:id").setString("uid", userid).setInteger("id", pid).uniqueResult();
		return car;

	}

}
