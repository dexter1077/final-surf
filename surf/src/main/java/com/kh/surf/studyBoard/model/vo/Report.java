package com.kh.surf.studyBoard.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Getter @Setter
@ToString
public class Report {

	private int reportNo;			// 신고 번호
	private int reporter;			// 신고한 자
	private int reported;			// 신고당한 자
	private String refType;			// 신고글 타입(게시글, 댓글)
	private int refNo;				// 신고글 번호
	private String reportContent;	// 신고 사유
	private String reportDate;		// 신고일
	private String status;			// 상태

	private int rsno;				// 댓글 신고당했을 때 스터디 번호(화면 리다이렉트 위해 추가함)
	
	
	// 관리자 신고처리 관련
	private String studyContent;
	private String replyContent;
	private String reporterId;
	private String reportedId;
	
	
}
