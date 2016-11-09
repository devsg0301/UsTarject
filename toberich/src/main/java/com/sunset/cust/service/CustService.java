package com.sunset.cust.service;

import com.sunset.model.Tcustomer;

public interface CustService {
	
	Tcustomer getCustomer(String cust_id, String password);
	
	void insertCust(Tcustomer tcustomer);
	
	Integer getMaxCustNo(String strDate);
}
