package com.github.wing02.vyoscontroller.dao;

public class ZonePolicyDao {
	Sh2Xml sh2Xml = new Sh2Xml();
	ShellExer shellExer = new ShellExer();

	String showZonePolicy() {
		String shellReq = "cli-shell-api showCfg zone-policy";
		String shellResp = shellExer.execShell(shellReq);
		String xmlStr = sh2Xml.sh2Xml(shellResp);
		return xmlStr;
	}

}
