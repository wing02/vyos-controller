package com.github.wing02.vyoscontroller.service;

import com.github.wing02.vyoscontroller.dao.ZonePolicyDao;

public class ZonePolicyService {
	ZonePolicyDao zonePolicyDao=new ZonePolicyDao();

	public String showZonePolicy(){
		return zonePolicyDao.showZonePolicy();
	}
}
