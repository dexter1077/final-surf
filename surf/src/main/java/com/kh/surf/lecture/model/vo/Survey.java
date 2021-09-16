package com.kh.surf.lecture.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Getter @Setter
@ToString
public class Survey {

	private int surveyNo;
	private String userNo;
	private int quality;
	private int satisfaction;
	private int difficulty;
	private int price;
	private int score;
	private String review;
	private String createDate;
	private int classNo;
	private int teacherNo;
	
	private String classTitle;
}
