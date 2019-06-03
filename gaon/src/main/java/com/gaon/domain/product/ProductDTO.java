package com.gaon.domain.product;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

//lombok(@만 붙여주면 자동으로 생성자, 전체생성자, getter, setter를 다 만들어 준다.)

// @Data
// Data 비추(사용하지 않는 내용들까지 추가됨)

@NoArgsConstructor  // 기본생성자
@AllArgsConstructor // 전체생성자
@Getter				// getter()
@Setter				// setter()
@ToString			// toString()
public class ProductDTO {
	private String p_code;
	private String p_name;
	private String p_type;
	private int p_price;
	private String p_img;
	private int p_cnt;
	private int p_good;
	private Date p_indate;
}
