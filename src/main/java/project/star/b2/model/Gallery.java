package project.star.b2.model;

import lombok.Data;

@Data
public class Gallery {
	/** room */
	private int roomno;			// 방번호
	private String roomtype;	// 매물 종류 > 종류 선택 - 원룸 , 투룸 , 쓰리룸 , 오피스텔
	private String title;		// 상세설명 > 제목
	private String floor;		// 기본정보 > 건물층수 > 해당층수 : 반지층 / 옥탑 / 1층~20층
	private int area;			// 기본정보 > 건물크기 > 전용면적 제곱미터
	private int fee;			// 추가정보 > 관리비
	private String confirmdate;	// 확인매물 일자
	
	/** price */
	private String priceno;		// 거래정보 일련번호 (전월세 가격)
	private int deposit; 		// 거래정보 > 거래종류 > 보증금
	private String dealingtype;	// 거래정보 > 거래종류 > 전세,월세,매매
	private int price;			// 거래정보 > 거래종류 > 거래금액(월세,매매,전세)
	
	/** file */
	private int fileno;			// 첨부파일 일련번호
	private String filename; // 첨부파일 이름
	
	private String region_2depth_name;	// kakao api 를 위한 구 정보 저장
	private double latitude;	// 위도
	private double longitude;	// 경도
    
    
    /** 페이지 구현이 필요한 경우 아래 속성들을 추가한다. (static)  */
    private static int offset;      // LIMIT 절에서 사용할 검색 시작 위치
    private static int listCount;   // LIMIT 절에서 사용할 검색할 데이터 수
    
	public static int getOffset() { return offset; }
	public static void setOffset(int offset) { Gallery.offset = offset; }
	
	public static int getListCount() { return listCount; }
	public static void setListCount(int listCount) { Gallery.listCount = listCount; }
	
	
	/** 필터링을 위한 추가 변수 */
	// 보증금/전세
	private static int depositFrom;
	private static int depositTo;
	// 월세
	private static int monthFrom;
	private static int monthTo;
	// 매매
	private static int buyingFrom;
	private static int buyingTo;
	// 관리비
	private static int feeFrom;
	private static int feeTo;
	// 방크기
	private static int sizeFrom;
	private static int sizeTo;
	
	
	public static int getDepositFrom() { return depositFrom; }
	public static void setDepositFrom(int depositFrom) { Gallery.depositFrom = depositFrom; }
	
	public static int getDepositTo() { return depositTo; }
	public static void setDepositTo(int depositTo) { Gallery.depositTo = depositTo; }
	
	
	public static int getMonthFrom() { return monthFrom; }
	public static void setMonthFrom(int monthFrom) { Gallery.monthFrom = monthFrom; }
	
	public static int getMonthTo() { return monthTo; }
	public static void setMonthTo(int monthTo) { Gallery.monthTo = monthTo; }
	
	
	public static int getBuyingFrom() { return buyingFrom; }
	public static void setBuyingFrom(int buyingFrom) { Gallery.buyingFrom = buyingFrom; }
	
	public static int getBuyingTo() { return buyingTo; }
	public static void setBuyingTo(int buyingTo) { Gallery.buyingTo = buyingTo; }

	
	public static int getFeeFrom() { return feeFrom; }
	public static void setFeeFrom(int fromRoom) { Gallery.feeFrom = fromRoom; }
	
	public static int getFeeTo() { return feeTo; }
	public static void setFeeTo(int toRoom) { Gallery.feeTo = toRoom; }
	
	
	public static int getSizeFrom() { return sizeFrom; }
	public static void setSizeFrom(int sizeFrom) { Gallery.sizeFrom = sizeFrom; }
	
	public static int getSizeTo() { return sizeTo; }
	public static void setSizeTo(int sizeTo) { Gallery.sizeTo = sizeTo; }
}
