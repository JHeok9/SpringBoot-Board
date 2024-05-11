package com.board.Contoller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.board.domain.Board;
import com.board.service.BoardService;

@Controller
@RequestMapping("/board/api")
public class BoardApiController {
	
	private final BoardService boardService;

	@Autowired
	public BoardApiController(BoardService boardService) {
		this.boardService = boardService;
	}

	// 게시판 리스트 반환 API
	@GetMapping("/list")
	@ResponseBody
	public List<Board> boardView() {
		List<Board> boardList = boardService.findBoardList();
		return boardList;
	}
	
}
