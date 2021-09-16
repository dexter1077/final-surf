package com.kh.surf.teacher.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Getter @Setter
@ToString
public class Teacher {
	private int teacherNo;
	private String profileImage;
	private String nickname;
	private String phone;
	private String introContent;
	private String subCatNo;
	private String status;
	private int subNo;
	
	// 1:1
	private String classTitle;
	
	private String mainCatName;
	private String subCatName;
	
	private String email;
}