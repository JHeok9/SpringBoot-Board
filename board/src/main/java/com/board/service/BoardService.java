package com.board.service;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.board.domain.Board;
import com.board.repository.BoardRepository;

@Transactional
public class BoardService {

	private BoardRepository boardRepository;

	public BoardService(BoardRepository boardRepository) {
		this.boardRepository = boardRepository;
	}
	
	// 게시판 전체조회
	public List<Board> findBoardList(){
		return boardRepository.findAll();
	}
	
}
