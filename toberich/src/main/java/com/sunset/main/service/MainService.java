package com.sunset.main.service;

import com.sunset.model.Tcustomer;

public interface MainService {
	
	Tcustomer getCustomer(String email, String password);
}
