package com.tj.pj.dao;

import com.tj.pj.dto.Admin;

public interface AdminDao {
	public int adminJoin(Admin admin);
	public Admin getAdmin(String aId);
	public Admin adminGet(String aId);
}
