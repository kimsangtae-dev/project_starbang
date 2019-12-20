package project.star.b2.model;

import java.util.List;

import lombok.Data;

@Data
public class Filter {
	// 매물종류
	private List<String> roomtype;
	// 월세, 전세, 매매
	private List<String> dealingtype;
	// 보증금/전세
	private int depositFrom;
	private int depositTo;
	// 월세
	private int monthFrom;
	private int monthTo;
	// 매매
	private int buyingFrom;
	private int buyingTo;
	// 관리비
	private int feeFrom;
	private int feeTo;
	// 방크기
	private int sizeFrom;
	private int sizeTo;
	// 위도 경도
	double lat;
	double lng;
	int level;
}
