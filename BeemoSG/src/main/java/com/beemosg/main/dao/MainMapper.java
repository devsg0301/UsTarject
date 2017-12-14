package com.beemosg.main.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.beemosg.model.Tbroadcast;
import com.beemosg.model.Tcustomer;

@Repository(value="mainMapper")
public interface MainMapper {
	
	Tcustomer getCustomer(String cust_id, String password);

	List getFolderList(String category, String genre);

	List<Tbroadcast> getBroadcastList();
	
}