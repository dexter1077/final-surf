package com.kh.surf.admin.model.vo;

import java.sql.Date;
import java.util.ArrayList;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor @Getter @Setter @ToString
public class PaymentList {

	private int orderNo;
	private int classNo;
	private int userNo;
	private int price;
	private Date paymentDate;
	private String payMethod;
	private String status;
	private String refundStatus;
	private Date refundDate;
	private String refundReason;
	private int count;
	private String email;
	private String nickname;
	private String classTitle;
	private Date mon;
	
	private ArrayList<PaymentList> adminList;
}
