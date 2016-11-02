package com.sunset.main.dao;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.sunset.model.Tcustomer;

@Service(value="mainDao")
public class MainDao {
	
	@Resource(name="mainMapper")
	private MainMapper mainMapper;
	
	public Tcustomer getCustomer(String email, String password){
		return mainMapper.getCustomer(email, password);
	}
}
