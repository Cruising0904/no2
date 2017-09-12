package com.iot1.sql.db.service;

import java.util.List;

import com.iot1.sql.db.dto.DataBase;
import com.iot1.sql.db.dto.DbInfo;
import com.iot1.sql.db.dto.Table;

public interface DbService {

	List<DbInfo> getDbInfoList(DbInfo di);
	List<DataBase> getDataBaseList() throws Exception;
	boolean isConnectDB(DbInfo pDi) throws Exception;
	List<Table> getTableList(DataBase di) throws Exception;
}
