package com.board.repository;

import java.util.List;

import com.board.domain.Board;

public interface BoardRepository {
	List<Board> findAll();

}
