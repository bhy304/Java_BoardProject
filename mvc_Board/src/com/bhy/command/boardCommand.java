package com.bhy.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface boardCommand {

	void execute(HttpServletRequest request, HttpServletResponse response);
}
