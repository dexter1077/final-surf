package com.kh.surf.category.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Getter @Setter
@ToString
public class Subcat {
	private int subcatNo;
	private String subcatName;
	private int maincatNo;
}
