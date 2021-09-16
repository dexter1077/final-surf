package com.kh.surf.lecture.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Getter @Setter
@ToString
public class SubCat {
	
	private String subCatNo;
	private String subCatName;
	private String mainCatNo;

	private String mainCatName;
}
