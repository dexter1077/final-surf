package com.kh.surf.lecture.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Getter @Setter
@ToString
public class ScrapSupport {
	
	private int userNo;
	private int classNo;
	private String type;
	private Date scrapDate;

}
