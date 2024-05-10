package com.board.domain;

import java.time.LocalDateTime;

import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.annotation.LastModifiedDate;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import lombok.Data;

@Entity
@Data
public class Board {
	
	@Id @GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long board_id;
	private String member_id;
	private String title;
	private String content;
	private int views;
	
	@CreatedDate
	@Column(updatable = false)
	private LocalDateTime reg_date;
	
	@LastModifiedDate
	private LocalDateTime update_Date;
	
}
