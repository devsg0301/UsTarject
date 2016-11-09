package com.sunset.main.dao;

import org.springframework.stereotype.Repository;

import com.sunset.model.Tcustomer;

@Repository(value="mainMapper")
public interface MainMapper {
	
	Tcustomer getCustomer(String cust_id, String password);
	
}
