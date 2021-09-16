package com.kh.surf.lecture.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Getter @Setter
@ToString
public class Progress {
	private int userNo;
	private int videoNo;
	private String watched;
	private int degree;
}
