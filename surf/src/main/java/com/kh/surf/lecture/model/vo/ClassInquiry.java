package com.kh.surf.lecture.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Getter @Setter
@ToString
public class ClassInquiry {

	private int inquiryNo;
	private String inqContent;
	private String inqDate;
	private String ansContent;
	private String ansDate;
	private int classNo;
	private String userNo;
	private String teacherNo;
	private int teaNo;

	private String classTitle;
	private String teacherImage;
}
