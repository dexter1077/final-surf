package com.kh.surf.lecture.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Getter @Setter
@ToString
public class ClassFunding {
	private int classNo;
	private int standard;
	private int count;
	private String startDate;
	
	private String classTitle;
	private String thumbnail;
}
