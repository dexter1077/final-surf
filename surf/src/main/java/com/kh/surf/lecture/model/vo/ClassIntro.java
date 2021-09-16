package com.kh.surf.lecture.model.vo;

import java.util.ArrayList;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Getter @Setter
@ToString
public class ClassIntro {
	private int introOrder;
	private int classNo;
	private String introImage; 
	private String introContent;
	
	private ArrayList<ClassIntro> classIntroList;
}
