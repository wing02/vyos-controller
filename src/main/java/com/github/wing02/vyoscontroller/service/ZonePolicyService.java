package com.github.wing02.vyoscontroller.service;

import com.github.wing02.vyoscontroller.dao.ZonePolicyDao;

public class ZonePolicyService {
	private ZonePolicyDao zonePolicyDao = null;

	public ZonePolicyService() {
		zonePolicyDao = new ZonePolicyDao();
	}

	public String showZonePolicy() {
//		System.out.println("Get ShowZonePolicyService");
		return zonePolicyDao.showZonePolicy();
	}
}
