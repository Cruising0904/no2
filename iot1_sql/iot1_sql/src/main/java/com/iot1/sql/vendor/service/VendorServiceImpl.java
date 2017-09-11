package com.iot1.sql.vendor.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.iot1.sql.vendor.dao.VendorDAO;
import com.iot1.sql.vendor.dto.VendorInfo;

@Service
public class VendorServiceImpl implements VendorService {

	@Autowired
	VendorDAO vDao;
	
	public VendorInfo getVendorInfo(VendorInfo vi) {
		return vDao.selectVendorInfo(vi);
	}

	public List<VendorInfo> getVendorInfoList(VendorInfo vi) {
		return vDao.selectVendorInfoList(vi);
	}

	public List<VendorInfo> getVendorInfoCombo() {
		return vDao.selectVendorInfoCombo();
	}
}
