package project.star.b2.controllers;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import project.star.b2.helper.WebHelper;
import project.star.b2.model.Gallery;
import project.star.b2.model.Gu;
import project.star.b2.service.GalleryService;
import project.star.b2.service.RoomService;

@RestController
public class GalleryRestController {
	/** WebHelper 주입 */
	// --> import org.springframework.beans.factory.annotation.Autowired;
	// --> import study.spring.springhelper.helper.WebHelper;
	@Autowired WebHelper webHelper;
	
	@Autowired GalleryService galleryService;
	@Autowired RoomService roomService;
	
	/** "/프로젝트이름" 에 해당하는 ContextPath 변수 주입 */
	// --> import org.springframework.beans.factory.annotation.Value;
	@Value("#{servletContext.contextPath}")
	String contextPath;
	
	/**--------구 별 이름,위경도,매물개수에 대한 json을 위한 페이지--------*/
	@RequestMapping(value = "/assets/guposition", method = RequestMethod.GET)
	public Map<String, Object> get_list() {
		String[] name = {"강남구", "강동구", "강북구", "강서구", "관악구", "광진구", "구로구", "금천구", "노원구", "도봉구", "동대문구", "동작구", "마포구", "서대문구", "서초구", "성동구", "성북구", "송파구", "양천구", "영등포구", "용산구", "은평구", "종로구", "중구", "중랑구"};
		double[] lat = {37.4959854, 37.5492077, 37.6469954, 37.5657617, 37.4653993, 37.5481445, 37.4954856, 37.4600969, 37.655264, 37.6658609, 37.5838012, 37.4965037, 37.5622906, 37.5820369, 37.4769528, 37.5506753, 37.606991, 37.5048534, 37.5270616, 37.520641, 37.5311008, 37.6176125, 37.5990998, 37.5579452, 37.5953795};
		double[] lng = {127.0664091, 127.1464824, 127.0147158, 126.8226561, 126.9438071, 127.0857528, 126.858121, 126.9001546, 127.0771201, 127.0317674, 127.0507003, 126.9443073, 126.9087803, 126.9356665, 127.0378103, 127.0409622, 127.0232185, 127.1144822, 126.8561534, 126.9139242, 126.9810742, 126.9227004, 126.9861493, 126.9941904, 127.0939669};
		
		List<Gu> guPositions = new ArrayList<Gu>();
		int output = 0;
		
		for (int i=0; i<name.length; i++) {
			try {
				output = galleryService.getGalleryGuCount(name[i]);
			} catch (Exception e) {
				e.printStackTrace();
			}
			guPositions.add(new Gu(name[i], lat[i], lng[i], output));
		}
		
		
		Map<String, Object> data = new HashMap<String, Object>();
		data.put("guPositions", guPositions);
		
		return webHelper.getJsonData(data);
	}
	
	
	/**--------구 별 이름,위경도,매물개수에 대한 json을 위한 페이지--------*/
	/*
	 * @RequestMapping(value = "/guinfo", method = RequestMethod.GET) public void
	 * getGu() { String url = contextPath + "/views/assets/guPosition.json"; String
	 * source = fileHelper.readString(url, "utf-8");
	 * 
	 * 
	 * }
	 */
	
	/**--------지도에 매물을 보여주기 위한 json--------*/
	@RequestMapping(value = "/assets/roomposition", method = RequestMethod.GET)
	public Map<String, Object> getPositionlist() {
		List<Gallery> output = null;
		
		try {
			output = galleryService.getRoomPositionList(null);
		} catch (Exception e) {
			return webHelper.getJsonError(e.getLocalizedMessage());
		}
		
		
		/** 3) JSON 출력하기 */
		Map<String, Object> data = new HashMap<String, Object>();
		data.put("positions", output);
		
		return webHelper.getJsonData(data);
	}
}
