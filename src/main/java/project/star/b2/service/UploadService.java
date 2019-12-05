package project.star.b2.service;

import java.util.List;

import project.star.b2.model.UploadItem;


public interface UploadService {
	/**
     * 학과 데이터 상세 조회
     * @param User 조회할 학과의 일련번호를 담고 있는 Beans
     * @return 조회된 데이터가 저장된 Beans
     * @throws Exception
     */
    public UploadItem getUploadItem(UploadItem input) throws Exception;
    
    /**
     * 학과 데이터 목록 조회
     * @return 조회 결과에 대한 컬렉션
     * @throws Exception
     */
    public List<UploadItem> getUploadItemList(UploadItem input) throws Exception;
    
    /**
     * 학과 데이터가 저장되어 있는 갯수 조회
     * @return int
     * @throws Exception
     */
    public int getUploadItemCount(UploadItem input) throws Exception;
    
    /**
     * 이미지 리스트 데이터 등록하기
     * @param User 저장할 정보를 담고 있는 Beans
     * @throws Exception
     */
    //public int addUploadItem(List<UploadItem> fileList) throws Exception;	
    
    
    /**
     * 이미지 리스트 데이터 등록하기
     * @param User 저장할 정보를 담고 있는 Beans
     * @throws Exception
     */
    public int addUploadItem(UploadItem input) throws Exception;
    
    
    /**
     * 학과 데이터 수정하기
     * @param User 수정할 정보를 담고 있는 Beans
     * @throws Exception
     */
    public int editUploadItem(UploadItem input) throws Exception;
    
    /**
     * 학과 데이터 삭제하기
     * @param User 삭제할 학과의 일련번호를 담고 있는 Beans
     * @throws Exception
     */
    public int deleteUploadItem(UploadItem input) throws Exception;
    
}