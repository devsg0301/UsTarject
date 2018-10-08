package com.beemosg.main.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.beemosg.model.Tbroadcast;
import com.beemosg.model.Tcustomer;

@Repository(value="mainMapper")
public interface MainMapper {
	
	Tcustomer getCustomer(String cust_id, String password) throws Exception;

	List getFolderList(String category, String genre) throws Exception;

	List recentFolderList() throws Exception;

	List<Tbroadcast> getBroadcastList() throws Exception;
	
	int insertLoginHistory(Tcustomer customer) throws Exception;
	
}
