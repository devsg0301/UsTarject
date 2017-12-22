package com.beemosg.main.service;

import java.util.List;

import com.beemosg.model.Tbroadcast;
import com.beemosg.model.Tcustomer;

public interface MainService {
	
	Tcustomer getCustomer(String cust_id, String password) throws Exception;

	public List getFolderList(String category, String genre) throws Exception;

	List<Tbroadcast> getBroadcastList() throws Exception;
	
}
