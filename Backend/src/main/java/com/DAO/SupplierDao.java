package com.DAO;

import java.util.List;


import com.Model.Supplier;

public interface SupplierDao {
	public void insert(Supplier s);
	public List <Supplier> getAllSupplier();
	public Supplier getSupplierById(int id);

}
