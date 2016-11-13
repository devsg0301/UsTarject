package com.vicloud.main.service;

import com.vicloud.model.Tcustomer;

public interface MainService {
	
	Tcustomer getCustomer(String cust_id, String password);
	
}
