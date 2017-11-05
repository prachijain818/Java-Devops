package com.Model;


import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Transient;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

@Component
@Entity
public class Product{

	@Id
	@GeneratedValue
	private int productid;
	private String productname;
	
	 @ManyToOne(fetch=FetchType.LAZY)
	  @JoinColumn(name="categoryid")
	private Category categoryname;
	 
	 @ManyToOne(fetch=FetchType.LAZY)
	  @JoinColumn(name="supplierid")
	private Supplier suppliername;
	 
	private String description;
	private double price;
	private long stock;
	@Transient
	private MultipartFile image;
	
	
	
	public int getProductid() {
		return productid;
	}
	public void setProductid(int productid) {
		this.productid = productid;
	}
	public String getProductname() {
		return productname;
	}
	public void setProductname(String productname) {
		this.productname = productname;
	}
	
	public Supplier getSuppliername() {
		return suppliername;
	}
	public void setSuppliername(Supplier suppliername) {
		this.suppliername = suppliername;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	
	public Category getCategoryname() {
		return categoryname;
	}
	public void setCategoryname(Category categoryname) {
		this.categoryname = categoryname;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public long getStock() {
		return stock;
	}
	public void setStock(long stock) {
		this.stock = stock;
	}
	public MultipartFile getImage() {
		return image;
	}
	public void setImage(MultipartFile image) {
		this.image = image;
	}
		
		
}
