package com.board.Contoller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.board.domain.Board;
import com.board.service.BoardService;

@Controller
@RequestMapping("/board")
public class BoardController {
	
	private final BoardService boardService;

	@Autowired
	public BoardController(BoardService boardService) {
		this.boardService = boardService;
	}

	// 게시판 페이지 접근
	@GetMapping("/view")
	public String boardView(Model model) {
		List<Board> boardList = boardService.findBoardList();
		model.addAttribute("boardList", boardList);
		
		return "boardView";
	}
	
}
