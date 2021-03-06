/*******************************************************************************
 * Copyright (c) 2013 - 2014 Maksym Barvinskyi.
 * All rights reserved. This program and the accompanying materials
 * are made available under the terms of the GNU Public License v2.0
 * which accompanies this distribution, and is available at
 * http://www.gnu.org/licenses/old-licenses/gpl-2.0.html
 * 
 * Contributors:
 *     Maksym Barvinskyi - initial API and implementation
 ******************************************************************************/
package org.grible.servlets.app.save;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.grible.dao.PostgresDao;
import org.grible.model.User;
import org.grible.security.Security;
import org.grible.servlets.ServletHelper;
import org.grible.settings.GlobalSettings;

/**
 * Servlet implementation class GetStorageValues
 */
@WebServlet("/SaveSettings")
public class SaveSettings extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public SaveSettings() {
		super();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException,
			IOException {
		response.setContentType("text/plain");
		PrintWriter out = response.getWriter();
		try {
			if (Security.anyServletEntryCheckFailed(request, response)) {
				return;
			}
			boolean isTooltipOnClick = Boolean.parseBoolean(request.getParameter("tooltiponclick"));
			if (ServletHelper.isJson()) {
				GlobalSettings.getInstance().getConfigJson().setTooltipOnClick(isTooltipOnClick);
				GlobalSettings.getInstance().getConfigJson().save();
			} else {
				String userName = (String) request.getSession(false).getAttribute("userName");
				PostgresDao dao = new PostgresDao();
				User user = dao.getUserByName(userName);
				dao.updateUserIsTooltipOnClick(user.getId(), isTooltipOnClick);
			}
			out.print("success");

		} catch (Exception e) {
			e.printStackTrace();
			out.print(e.getLocalizedMessage());
		}
		out.flush();
		out.close();
	}
}
