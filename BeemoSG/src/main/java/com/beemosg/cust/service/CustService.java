package com.beemosg.cust.service;

import com.beemosg.model.Tcustomer;

public interface CustService {
	
	public Tcustomer getCustomer(String cust_id, String password);
	
	public void insertCust(Tcustomer tcustomer);
	
	public Integer getMaxCustNo(String strDate);

	public Tcustomer selectCustomer(String cust_id) throws Exception;
}
