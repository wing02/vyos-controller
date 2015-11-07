package com.github.wing02.vyoscontroller.servlet;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class InputServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public InputServlet() {
		super();
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String info = request.getParameter("info");
		try {
			Process ps = Runtime.getRuntime().exec(info);
			ps.waitFor();
			BufferedReader br = new BufferedReader(new InputStreamReader(ps.getInputStream()));
			StringBuffer sb = new StringBuffer();
			String line;
			while ((line = br.readLine()) != null) {
				sb.append(line).append("<br>");
				System.out.println(line);
			}
			String result = sb.toString();
			// System.out.println(result);
			request.getSession().setAttribute("result", result);
			response.sendRedirect("index.jsp");
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
	}

}
