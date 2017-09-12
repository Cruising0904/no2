package com.iot1.sql.db.dto;

import org.springframework.stereotype.Component;

@Component
public class Column {
	
	private String columnName;
	private String dataType;
	private String charactermaximuLength;
	private String isNullable;
	public String getColumnName() {
		return columnName;
	}
	public void setColumnName(String columnName) {
		this.columnName = columnName;
	}
	public String getDataType() {
		return dataType;
	}
	public void setDataType(String dataType) {
		this.dataType = dataType;
	}
	public String getCharactermaximuLength() {
		return charactermaximuLength;
	}
	public void setCharactermaximuLength(String charactermaximuLength) {
		this.charactermaximuLength = charactermaximuLength;
	}
	public String getIsNullable() {
		return isNullable;
	}
	public void setIsNullable(String isNullable) {
		this.isNullable = isNullable;
	}
	@Override
	public String toString() {
		return "Column [columnName=" + columnName + ", dataType=" + dataType + ", charactermaximuLength="
				+ charactermaximuLength + ", isNullable=" + isNullable + "]";
	}
	

}
