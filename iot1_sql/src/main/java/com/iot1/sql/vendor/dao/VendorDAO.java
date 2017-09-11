package com.iot1.sql.vendor.dao;

import java.util.List;

import com.iot1.sql.vendor.dto.VendorInfo;

public interface VendorDAO {

	public VendorInfo selectVendorInfo(VendorInfo gi);

	public List<VendorInfo> selectVendorInfoList(VendorInfo gi);

	public List<VendorInfo> selectVendorInfoCombo();

	public int InsertVendorInfo(VendorInfo vi);

	public int DeleteVendorInfo(VendorInfo vi);

	public int UpdateVendorInfo(VendorInfo vi);
}
