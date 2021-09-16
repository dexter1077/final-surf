package com.kh.surf.teacher.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Getter @Setter
@ToString
public class StatsData {

	public String dataUnit;
	public int count;
	public int score5;
	public int score4;
	public int score3;
	public int score2;
	public int score1;
	
}
