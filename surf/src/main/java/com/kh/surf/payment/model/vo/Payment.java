package com.kh.surf.payment.model.vo;

import java.sql.Date;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Getter @Setter
@ToString
public class Payment {
	
	private int orderNo;
	private int classNo;
	private int userNo;
	private int price;
	private String classTitle;
	private Date paymentDate;
	private String payMethod;
	private String status;
	private String refundStatus;
	private Date refundDate;
	private String refundReason;

}
