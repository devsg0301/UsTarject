package com.beemosg.cust.dao;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.beemosg.model.Tcustomer;

@Service(value="custDao")
public class CustDao {
	
	@Resource(name="custMapper")
	private CustMapper custMapper;
	
	public Tcustomer getCustomer(String cust_id, String password){
		return this.custMapper.getCustomer(cust_id, password);
	}
	
	public void insertCust(Tcustomer tcustomer){
		this.custMapper.insertCust(tcustomer);
	}
	
	public Integer getMaxCustNo(String strDate){
		return this.custMapper.getMaxCustNo(strDate);
	}

	public Tcustomer selectCustomer(String cust_id) throws Exception{
		return this.custMapper.selectCustomer(cust_id);
	}
}
