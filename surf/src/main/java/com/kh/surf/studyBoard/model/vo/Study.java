package com.kh.surf.studyBoard.model.vo;

import java.sql.Date;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Getter @Setter
@ToString
public class Study {
	
	private int studyNo;			// 고유번호
	private String studyTitle;		// 제목
	private String studyContent;	// 내용
	private int userNo;				// 작성자 번호
	private String writer;			// 작성자 닉네임
	private String recruit;			// 모집여부(모집 중 Y)
	private String status;			// 활성화 여부(삭제 시 N)
	private int count;				// 조회수
	private String createDate;		// 작성일
	private String modifyDate;		// 수정일
	
}
