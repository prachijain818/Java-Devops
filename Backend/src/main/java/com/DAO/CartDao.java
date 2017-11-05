package com.DAO;

import java.util.List;
import com.Model.Cart;


public interface CartDao {
	
	public void insert(Cart c);
	public List <Cart> getCartList(String usermail);
	public void delete(int cart);
	public void update(Cart cart);
	public Cart getCartById(int cartid);
	public Cart getCartItem(int pid,String userid);


	
}
