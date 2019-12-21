package project.star.b2.service;

import java.util.List;

import project.star.b2.model.Room;


/** 매물 데이터 관리 기능을 제공하기 위한 Service 계층. */
public interface RoomService {
    /**
     * 매물 데이터 상세 조회
     * @param Room 조회할 매물의 일련번호를 담고 있는 Beans
     * @return 조회된 데이터가 저장된 Beans
     * @throws Exception
     */
    public Room getRoomItem(Room input) throws Exception;
    
    /**
     * 매물 데이터 목록 조회
     * @return 조회 결과에 대한 컬렉션
     * @throws Exception
     */
    public List<Room> getRoomList(Room input) throws Exception;
    
    /**
     * 매물 데이터 목록 조회
     * @return 조회 결과에 대한 컬렉션
     * @throws Exception
     */
    public List<Room> getRoomList_host_rmli(Room input) throws Exception;
    
    
    /**
     * 매물 데이터가 저장되어 있는 갯수 조회
     * @return int
     * @throws Exception
     */
    public int getRoomCount(Room input) throws Exception;
    
    /**
     * 매물 데이터 등록하기
     * @param Room 저장할 정보를 담고 있는 Beans
     * @throws Exception
     */
    public int addRoom(Room input) throws Exception;
    
    /**
     * 매물 데이터 수정하기
     * @param Room 수정할 정보를 담고 있는 Beans
     * @throws Exception
     */
    public int editRoom(Room input) throws Exception;
    
    /**
     * 매물 데이터 삭제하기
     * @param Room 삭제할 매물의 일련번호를 담고 있는 Beans
     * @throws Exception
     */
    public int deleteRoom(Room input) throws Exception;
    
    /**
     * 관리자 확인매물 업데이트
     * @param Room 삭제할 매물의 일련번호를 담고 있는 Beans
     * @throws Exception
     */
    public int editConfirmRoom(Room input) throws Exception;
    
    /**
     * 관리자 숨김매물 업데이트
     * @param Room 삭제할 매물의 일련번호를 담고 있는 Beans
     * @throws Exception
     */
    public int editHiddenRoom(Room input) throws Exception;
    
    public List<Room> getRoomCheckList(int raval) throws Exception;
    
    public List<Room> getRoomCheckConfirmList(Room input) throws Exception;
}