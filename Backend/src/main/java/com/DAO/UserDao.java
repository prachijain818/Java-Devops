package com.DAO;

import com.Model.User;

public interface UserDao {

	public void insert(User u);
	public User getUserById(int uid);
	public User getUserByName(String uname);
	
}
