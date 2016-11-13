package com.vicloud.main.dao;

import org.springframework.stereotype.Repository;

import com.vicloud.model.Tcustomer;

@Repository(value="mainMapper")
public interface MainMapper {
	
	Tcustomer getCustomer(String cust_id, String password);
	
}
