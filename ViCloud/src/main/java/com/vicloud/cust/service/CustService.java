package com.vicloud.cust.service;

import com.vicloud.model.Tcustomer;

public interface CustService {
	
	Tcustomer getCustomer(String cust_id, String password);
	
	void insertCust(Tcustomer tcustomer);
	
	Integer getMaxCustNo(String strDate);
}
