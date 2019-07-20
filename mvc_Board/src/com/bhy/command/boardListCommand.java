package com.bhy.command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bhy.model.BoardDAO;
import com.bhy.model.BoardDTO;

public class boardListCommand implements boardCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub

		BoardDAO dao = new BoardDAO();
		List<BoardDTO> boards = dao.SelectAll();
		request.setAttribute("list", boards);
	}

}
