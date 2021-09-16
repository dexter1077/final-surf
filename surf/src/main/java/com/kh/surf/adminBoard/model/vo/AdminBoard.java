package com.kh.surf.adminBoard.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Getter @Setter
@ToString
public class AdminBoard {
	
	private int boardNo;
	private String boardTitle;
	private String boardContent;
	private int userNo;
	private String createDate;
	private String modifyDate;
	private String status;
	private int count;
	private String faqCategory; // 회원문의,주문결제 등
	private String boardType; // 공지사항orFAQ

	// 작성자
	private String nickname;
}
