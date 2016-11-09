package com.sunset.main.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.sunset.main.dao.MainDao;
import com.sunset.model.Tcustomer;

@Service(value="mainService")
public class MainServiceImpl implements MainService {
	
	@Resource(name="mainDao")
	private MainDao mainDao;

	public Tcustomer getCustomer(String cust_id, String password) {
		return mainDao.getCustomer(cust_id, password);
	}

}
