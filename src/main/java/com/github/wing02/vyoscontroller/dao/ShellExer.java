package com.github.wing02.vyoscontroller.dao;

import java.io.BufferedReader;
import java.io.InputStreamReader;

public class ShellExer {
	public String execShell(String shReq) {
		String shResp = null;
		try {
			Process ps = Runtime.getRuntime().exec(shReq);
			ps.waitFor();
			BufferedReader br = new BufferedReader(new InputStreamReader(ps.getInputStream()));
			StringBuffer sb = new StringBuffer();
			String line;
			while ((line = br.readLine()) != null) {
				sb.append(line).append(" ");
				// System.out.println(line);
			}
			shResp = sb.toString();
			// System.out.println(result);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return shResp;
	}
}
