package com.Model;


import java.util.List;

import javax.persistence.*;

import org.springframework.stereotype.Component;

@Entity
@Component
public class Cart {

	@Id
	@GeneratedValue
	private int cartid;
	private long totalItems;
	private double finalAmount;
	private String cartproductname;
	private String cartproductdesc;
	private int proid;
	private double price;
	
	
	@OneToOne
	private User user;
	
	
	
	public String getCartproductname() {
		return cartproductname;
	}
	public void setCartproductname(String cartproductname) {
		this.cartproductname = cartproductname;
	}
	public String getCartproductdesc() {
		return cartproductdesc;
	}
	public void setCartproductdesc(String cartproductdesc) {
		this.cartproductdesc = cartproductdesc;
	}
	public int getProid() {
		return proid;
	}
	public void setProid(int proid) {
		this.proid = proid;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	
	public long getTotalItems() {
		return totalItems;
	}
	public void setTotalItems(long totalItems) {
		this.totalItems = totalItems;
	}
	public double getFinalAmount() {
		return finalAmount;
	}
	public void setFinalAmount(double finalAmount) {
		this.finalAmount = finalAmount;
	}
	
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	
	public int getCartid() {
		return cartid;
	}
	public void setCartid(int cartid) {
		this.cartid = cartid;
	}
	
}
