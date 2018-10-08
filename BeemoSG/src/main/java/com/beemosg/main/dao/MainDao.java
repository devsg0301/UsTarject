package com.beemosg.main.dao;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.beemosg.model.Tbroadcast;
import com.beemosg.model.Tcustomer;

@Service(value="mainDao")
public class MainDao {
	
	@Resource(name="mainMapper")
	private MainMapper mainMapper;
	
	public Tcustomer getCustomer(String cust_id, String password) throws Exception{
		return this.mainMapper.getCustomer(cust_id, password);
	}

	public List getFolderList(String category, String genre) throws Exception{
		return this.mainMapper.getFolderList(category, genre);
	}

	public List recentFolderList() throws Exception{
		return this.mainMapper.recentFolderList();
	}

	public List<Tbroadcast> getBroadcastList() throws Exception{
		return this.mainMapper.getBroadcastList();
	}
	
	public int insertLoginHistory(Tcustomer customer) throws Exception{
		return this.mainMapper.insertLoginHistory(customer);
	}
	
}
