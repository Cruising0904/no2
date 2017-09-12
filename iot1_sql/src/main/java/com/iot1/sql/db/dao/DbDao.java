package com.iot1.sql.db.dao;

import java.util.List;

import com.iot1.sql.db.dto.DataBase;
import com.iot1.sql.db.dto.DbInfo;
import com.iot1.sql.db.dto.Table;

public interface DbDao {

	List<DbInfo> selectDbInfoList(DbInfo di);
	DbInfo selectDbInfo(DbInfo di);
	boolean isConnectDB(DbInfo di) throws Exception;
	List<DataBase> selectDatabaseList() throws Exception;
	List<Table> selectTableList(DataBase di) throws Exception;
	
}
