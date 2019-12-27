package project.star.b2.service;

import java.util.List;

import project.star.b2.model.Price;


public interface PriceService {
	
	public Price getPriceItem(Price input) throws Exception;
	
	List<Price> getPriceList_by_roomno(Price input) throws Exception;
	
	public List<Price> getPriceList(Price input) throws Exception;
	
	public int getPriceCount(Price input) throws Exception;

	public int addPrice(Price input) throws Exception;
	
	public int editPrice(Price input) throws Exception;

	public int deletePrice(Price input) throws Exception ;

	/**
     * @param 체크박스 값들을 가져와서 비교하기 목록 조회
     * @return
     * @throws Exception
     */
	public List<Price> getCompareList(List<String> input) throws Exception;
}