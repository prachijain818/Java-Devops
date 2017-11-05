package com.DAO;

import java.util.List;

import com.Model.Category;
import com.Model.Product;

public interface CategoryDao {
	public void insert(Category c);
	public List <Category> getAllCategory();
	public Category getCategoryById(int id);

}
