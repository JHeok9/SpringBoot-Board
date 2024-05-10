package com.board.domain;

import java.time.LocalDateTime;

import org.springframework.data.annotation.CreatedDate;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import lombok.Data;

@Entity
@Data
public class BoardComment {
	
	@Id @GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long comment_id;
	private Long member_id;
	private Long board_id;
	private Long is_reply_to_id;
	private String content;
	
	@CreatedDate
	@Column(updatable = false)
	private LocalDateTime reg_date;

}
