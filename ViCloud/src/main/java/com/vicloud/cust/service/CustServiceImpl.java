package com.vicloud.cust.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.vicloud.cust.dao.CustDao;
import com.vicloud.model.Tcustomer;

@Service(value="custService")
public class CustServiceImpl implements CustService {
	
	@Resource(name="custDao")
	private CustDao custDao;

	public Tcustomer getCustomer(String cust_id, String password) {
		return custDao.getCustomer(cust_id, password);
	}
	
	public void insertCust(Tcustomer tcustomer){
		custDao.insertCust(tcustomer);
	}
	
	public Integer getMaxCustNo(String strDate){
		return custDao.getMaxCustNo(strDate);
	}

}
