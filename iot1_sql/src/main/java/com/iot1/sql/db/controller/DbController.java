package com.iot1.sql.db.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.iot1.sql.db.dto.Column;
import com.iot1.sql.db.dto.DataBase;
import com.iot1.sql.db.dto.DbInfo;
import com.iot1.sql.db.dto.Table;
import com.iot1.sql.db.service.DbService;

@Controller
public class DbController {
   @Autowired
   DbService ds;
   
   @RequestMapping(value="/db/list/tree",method=RequestMethod.POST)
   public @ResponseBody List<DbInfo> getGoodsInfoList(@RequestBody DbInfo di){
      return ds.getDbInfoList(di); // SELECT_DB return type DbInfo
   }

   
   @RequestMapping(value="/db/connecte",method=RequestMethod.POST)
   public @ResponseBody ModelMap getConnectDB(@RequestBody DbInfo di, ModelMap map){
      try{
         if(ds.isConnecteDB(di)){ // diNum = #
            map.put("databaseList", ds.getDataBaseList()); //database select
         }else{
            map.put("error", "데이터베이스에 접속하지 못했습니다.");
         }
      }catch(Exception e){
         map.put("error", e.getMessage());
      }
      return map;
   }

   @RequestMapping(value="/db/table/list",method=RequestMethod.POST)
   public @ResponseBody ModelMap getTableList(@RequestBody DataBase db, ModelMap map){
      try{
         map.put("tableList", ds.getTableList(db));  //TABLE_SELECT database, tableName != null
      }catch(Exception e){
         map.put("error", e.getMessage());
      }
      return map;
   }
   
   @RequestMapping(value="/db/table/info",method=RequestMethod.POST)
   public @ResponseBody ModelMap getTableInfo(@RequestBody Table tableName, ModelMap map){
      try{
         map.put("tableInfo", ds.getTableInfo(tableName));
         map.put("key", "tableInfo");
      }catch(Exception e){
         map.put("error", e.getMessage());
      }
      return map;
   }
   
   @RequestMapping(value="/db/table/select",method=RequestMethod.POST)
   public @ResponseBody List<Column> getTableSelect(@RequestBody DataBase tableName, ModelMap map) {
      return ds.getTableSelect(tableName); 
   }
}