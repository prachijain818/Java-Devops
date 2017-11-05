package com.DAO;

import java.util.List;

import com.Model.Product;

public interface ProductDao {

	public void insert(Product p);
	public List <Product> getAllProducts();
	public List <Product> getProByCat(int categoryid);
	public void delete(int pro);
	public void update(Product pro);
	public Product getProById(int productid);
	//public List <Product> getProDetails(int productid);
	//public Product getProductById(int pid);

}
