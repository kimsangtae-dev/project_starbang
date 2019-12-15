package project.star.b2.service;

import java.util.List;

import project.star.b2.model.Gallery;
import project.star.b2.model.Heart;
import project.star.b2.model.Popular;

public interface HeartService {
    /**
     * 찜 데이터 목록 조회
     * @return 조회 결과에 대한 컬렉션
     * @throws Exception
     */
    public List<Heart> getHeartGalleryList(Heart input) throws Exception;
    
    
    public List<Gallery> getGalleryList(Gallery input) throws Exception;
        
        /**
         * 갤러리 데이터가 저장되어 있는 갯수 조회
         * @return int
         * @throws Exception
         */
    public int getGalleryCount(Gallery input) throws Exception;
    
    public int getHeartGalleryCount(Heart input) throws Exception;
}

