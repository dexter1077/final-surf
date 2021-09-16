package com.kh.surf.lecture.model.vo;

import java.sql.Date;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Getter @Setter
@ToString
public class ClassStuding {
	
	private int userNo;
	private int classNo;
	private Date startDate;
	private Date endDate;
	private int videoNo;

}
