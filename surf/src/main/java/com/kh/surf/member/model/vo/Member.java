package com.kh.surf.member.model.vo;

import java.sql.Date;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Getter @Setter
@ToString
public class Member {

	private int userNo;
	private String email;
	private String gender;
	private int ageRange;
	private String password;
	private String nickname;
	private String userCode;
	private String status;
	private Date memEnrollDate;
	private String enrollType;
}
