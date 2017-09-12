package com.iot1.sql.db.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.iot1.sql.db.dao.DbDao;
import com.iot1.sql.db.dto.DataBase;
import com.iot1.sql.db.dto.DbInfo;
import com.iot1.sql.db.dto.Table;

@Service
public class DbServiceImpl implements DbService {

	@Autowired
	DbDao dDao;
	@Override
	public List<DbInfo> getDbInfoList(DbInfo di) {
		return dDao.selectDbInfoList(di);
	}

	@Override
	public boolean isConnectDB(DbInfo pDi) throws Exception {
		DbInfo di = dDao.selectDbInfo(pDi);
		return dDao.isConnectDB(di);
	}
	
	public List<DataBase> getDataBaseList() throws Exception{
		return dDao.selectDatabaseList();
	}

	@Override
	public List<Table> getTableList(DataBase di) throws Exception {
		// TODO Auto-generated method stub
		return dDao.selectTableList(di);
	}


}
