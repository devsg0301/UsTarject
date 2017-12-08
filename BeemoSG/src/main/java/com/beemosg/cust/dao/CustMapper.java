package com.beemosg.cust.dao;

import org.springframework.stereotype.Repository;

import com.beemosg.model.Tcustomer;

@Repository(value="custMapper")
public interface CustMapper {
	
	Tcustomer getCustomer(String cust_id, String password);
	
	void insertCust(Tcustomer tcustomer);
	
	Integer getMaxCustNo(String strDate);

}
