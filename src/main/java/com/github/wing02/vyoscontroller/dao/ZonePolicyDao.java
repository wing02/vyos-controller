package com.github.wing02.vyoscontroller.dao;

public class ZonePolicyDao {

	private Sh2Xml sh2Xml = null;
	private ShellExer shellExer = null;

	public ZonePolicyDao() {
		sh2Xml = new Sh2Xml();
		shellExer = new ShellExer();
	}

	public String showZonePolicy() {

		// String shellReq = "cli-shell-api showCfg zone-policy";
		String shellReq = "cat /home/wing/Project/cloud-platform/Test/shell";
		String shellResp = shellExer.execShell(shellReq);
//		System.out.println("shellResp" + shellResp);
		String xmlStr = sh2Xml.sh2Xml(shellResp);
//		System.out.println("xmlStr" + xmlStr);
		return xmlStr;
	}

}
