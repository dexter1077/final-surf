package com.kh.surf.studyBoard.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Getter @Setter
@ToString
public class Reply {
	
	private int replyNo;			// 댓글 번호
	private int studyNo;			// 스터디글 번호
	private int userNo;				// 작성자 번호
	private String replyWriter;		// 작성자
	private String replyContent;	// 댓글 내용
	private String status;			// 활성화여부 (삭제 시 N)
	private String createDate;		// 작성일
	private String modifyDate;		// 수정일
	
}
