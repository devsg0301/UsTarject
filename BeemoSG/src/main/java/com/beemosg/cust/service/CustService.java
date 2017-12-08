package com.beemosg.cust.service;

import com.beemosg.model.Tcustomer;

public interface CustService {
	
	Tcustomer getCustomer(String cust_id, String password);
	
	void insertCust(Tcustomer tcustomer);
	
	Integer getMaxCustNo(String strDate);
}
