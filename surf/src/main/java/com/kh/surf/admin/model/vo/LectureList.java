package com.kh.surf.admin.model.vo;

import java.sql.Date;
import java.util.ArrayList;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor @Getter @Setter @ToString
public class LectureList {
	
	private int userNo;
	private int teacherNo;
	private String email;
	private String nickname;
	private String maincatName;
	private Date createDate;
	private String status;
	private int subcatNo;
	private int maincatNo;
	private int classNo;
	private String introTitle;
	private int standard;
	private int count;
	private Date startDate;
}
