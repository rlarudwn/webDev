/*
	request / response	=> session	=> cookie
	application	pageContext
	getRealPath()
 */
package com.sist.dao;

import lombok.Data;

@Data

public class MemverVO {
	private String id, name, pwd, msg;
}
