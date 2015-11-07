package com.github.wing02.vyoscontroller.servlet;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.github.wing02.vyoscontroller.service.ZonePolicyService;

public class ShowZonePolicyServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
	private ZonePolicyService zonePolicyService = new ZonePolicyService();

	public ShowZonePolicyServlet() {
		super();
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setCharacterEncoding("GBK");
		response.setContentType("text/html");
		String xmlStr = zonePolicyService.showZonePolicy();
		PrintWriter out = response.getWriter();
		out.print(xmlStr);
		out.close();
	}
}
