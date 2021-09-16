package com.kh.surf.admin.model.vo;

import java.sql.Date;
import java.util.ArrayList;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;



@NoArgsConstructor @Getter @Setter @ToString
public class Ad {

	
	private int adNo;
	private String adTitle;
	private String adLink;
	private Date modifyDate;
	private String adStatus;
	private String originName;
	private String changeName;
	private Date uploadDate;
	private int count;
	
	private ArrayList<Ad> adminList;
	
	
}
