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
public class BoardFile {
	
	@Id @GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long file_id;
	private Long board_id;
	private String file_name;
	
	@CreatedDate
	@Column(updatable = false)
	private LocalDateTime reg_date;
	
}
