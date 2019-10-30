package study.jsp.b2.helper;

import java.awt.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

//@Slf4j
//public class WebHelper {
//	/** 기본 인코딩 타입 설정 */
//	private String encType ="UTF-8";
//
//	/** JSP의 requset 내장 객체 */
//	private HttpServletRequest request;
//	
//	/** JSP의 response 내장 객체 */
//	private HttpServletResponse response;
//	
//	/** JSP의 session 내장 객체 */
//	private HttpSession session;
//
//	/** 7강 */
//	/** 업로드 된 결과물이 저장될 폴더 */
//	private String uploadDir = "D:/KJS/workspace4/Model1/WebContent/upload";
//	
//	/** 업로드 가능한 최대 용량 */
//	private int uploadMaxFileSize = 32 * 1024 * 1024;
//		
//	/** Multipart 전송시 File 정보를 저장하기 위한 컬랙션 */
//	private List<UploadItem> fileList;
//	
//	/** Multipart 전송시 텍스트 데이터를 저장하기 위한 컬랙션 */
//	private Map<String, String> paramMap;
//	
//	public String getUploadDir() {
//		return uploadDir;
//	}
//	
//	public void setUploadDir(String uploadDir) {
//		this.uploadDir = uploadDir;
//	}
//	
//	public int getUploadMaxFileSize() {
//		return uploadMaxFileSize;
//	}
//	
//	public void setUploadMaxFileSize(int uploadMaxFileSize) {
//		this.uploadMaxFileSize = uploadMaxFileSize;
//	}
//	
//	public List<UploadItem> getFileList() {
//		return fileList;
//	}
//	
//	public void setFileList(List<UploadItem> fileList) {
//		this.fileList = fileList;
//	}
//	
//	// 싱글톤 객체 생성하기 
//	private static WebHelper current;
//	
//	public static WebHelper getInstance() {
//		if (current == null) {
//			current = new WebHelper();
//		}
//		return current;
//	}
//	
//	// JSP의 내장 객체는 일반 JAVA 클래스가 생성할 수 없기 때문에 
//	// JSP 페이지로부터 request와 response 객체를 전달받아야 한다
//	public static WebHelper getInstance(HttpServletRequest requset, HttpServletResponse response) {
//		if (current == null) {
//			current = new WebHelper();
//		}
//		
//		// JSP 내장객체를 연결하기 위한 메서드 호출
//		current.init(requset, response);
//		return current;
//	}
//	
//	
//	public static void freeInstance() {
//		current = null;
//	}
//	
//	private WebHelper() {
//		super();
//	}
//	
//	// 싱글톤 객체 생성하기 끝
//
//	public String getEncType() {
//		return encType;
//	}
//	
//	public void setEncType(String encType) {
//		this.encType = encType;
//	}
//	
//	public String getDomain() {
//		return domain;
//	}
//	
//	public void setDomain(String domain) {
//		this.domain = domain;
//	}
//	
//	public HttpServletRequest getRequset() {
//		return requset;
//	}
//	
//	public void setRequset(HttpServletRequest requset) {
//		this.requset = requset;
//	}
//	
//	public HttpServletResponse getResponse() {
//		return response;
//	}
//	
//	public void setResponse(HttpServletResponse response) {
//		this.response = response;
//	}
//	
//	public HttpSession getSession() {
//		return session;
//	}
//	
//	public void setSession(HttpSession session) {
//		this.session = session;
//	}
//	
//	// 자바클래스에서는 JSP내장 객체를 생성할 수 없기 때문에 JSP 페이지로부터 내장 객체를 주입 받기 위한 메서드를 준비한다
//	/**
//	 * JSP의 주요 내장 객체를 멤버변수에 연결한다
//	 * @param requset
//	 * @param response
//	 */
//	public void init(HttpServletRequest requset, HttpServletResponse response) {
//		this.request = requset; // JSP 내장객체 참조하기
//		this.response = response; // JSP 내장객체 참조하기  // 읽고 쓴는 것의 차이인가?
//		
//		this.session = this.request.getSession(); // request 객체를 사용하여 세션 생성하기
//		
//		String methodName = requset.getMethod(); // get방식인지, post방식인지 조회한다
//		String url = requset.getRequestURI().toString(); // 현재 URL을 획득한다
//		String queryString = requset.getQueryString(); // URL에서 "?"이후의 GET파라미터 문자열을 모두 가져온다
//		
//		if(queryString != null) { // 가져온 값이 있다면 URL과 결합하여 완전한 URL을 구성한다
//			url = url + "?" + queryString;
//		}
//		
//		log.debug(String.format("[%s] %s", methodName, url)); // 획득한 정보를 로그에 표시한다
//		
//		/** 내장객체 초기화 -> utf-8 설정 */
//		try {
//			this.requset.setCharacterEncoding(this.encType);
//			this.response.setCharacterEncoding(this.encType);
//		}catch (UnsupportedEncodingException e) {
//			e.printStackTrace();
//		}
//	}
//}
//   
//   /** 업로드(JSP 7강) */
//   
//   /**
//    *  Multipart로 전송된 데이터를 판별하여 파일리스트와 텍스트 파라미터로 분류한다
//    *  
//    * @throws Exception
//    */
//   public void upload() throws Exception {
//      /** 1) 업로드 사진 준비하기 */
//      // items에 저장 데이터가 분류될 컬렉션들 할당하기
//      fileList = new ArrayList<UploadItem>();
//      paramMap = new HashMap<String, String>();
//      
//      // 업로드가 수행될 폴더의 존재 여부 체크해서 없다면 생성하기
//      File uploadDirFile = new File(this.uploadDir);
//      if (!uploadDirFile.exists()) {
//         uploadDirFile.mkdirs();
//      }
//      
//      // 업로드가 수행될 폴더 연결
//      DiskFileItemFactory factory = new DiskFileItemFactory();
//      factory.setRepository(uploadDirFile);
//      
//      /** 2) 업로드 처리하기 */
//      // 업로드 수행을 위한 객체 생성
//      ServletFileUpload upload = new ServletFileUpload(factory);
//      // UTF-8처리 지정
//      upload.setHeaderEncoding(this.encType);
//      // 최대 파일 크기
//      upload.setSizeMax(this.uploadMaxFileSize);
//      // 실제 업로드를 수행하여 전송된 데이터에 대한 컬렉션 객체 추출하기
//      // -> 이 안에 파일과 텍스트 정보가 함께 들어 있기 때문에
//      // 반복문을 수행하면서 분류 작업을 진행해야 한다
//      List<FileItem> items = upload.parseRequest(requset);
//      
//      /** 3) 업로드 정보 분류하기 */
//      // 업로드 된 컬랙션의 데이터 수 만큼 반복하면서 처리한다
//      for(FileItem f : items) {
//         if (f.isFormField()) {
//            /** 텍스트 형식의 데이터인 경우 --> paramMap에 정보 분류 */
//            // <input>태그의 name 속성
//            String key = f.getFieldName();
//            // 사용자의 입력값을 UTF-8 형식으로 취득한다
//            String value = f.getString(this.encType);
//            
//            // 이미 동일한 키값이 map안에 존재한다면
//            // --> checkbox의 경우 이름이 동일한 요소가 여러개 전송될 수 있음
//            if(paramMap.containsKey(key)) {
//               // 기존의 값 뒤에 콤마(,)를 추가해서 값을 병합한다
//               value = paramMap.get(key) + "," + value;
//               paramMap.put(key, value);
//            }else {
//               paramMap.put(key, value);
//            }
//         }else {
//            /** 파일 형식의 데이터인 경우 --> fileList에 정보 분류 */
//            /** 3-1) 파일의 정보를 추출한다 */
//            String fieldName = f.getFieldName(); // <input type="file" />의 name 속성
//            String orginName = f.getName(); // 파일의 원본 이름
//            String contentType = f.getContentType(); // 파일 형식
//            long fileSize = f.getSize(); // 파일 사이즈
//            
//            // 파일 사이즈가 없다면 for문의 조건식으로 돌아간다
//            if(fileSize < 1) {
//               continue;
//            }
//            
//            /** 3-2) 동일한 이름의 파일이 존재하는지 검사한다 */
//            // 파일의 원본 이름에서 확장자만 추출
//            String ext = orginName.substring(orginName.lastIndexOf("."));
//            
//            String fileName = null; // 웹 서버에 저장될 파일이름
//            File uploadFile = null; // 저장된 파일 정보를 담기 위한 File 객체
//            String filePath = null; // 최종적으로 업로드 될 파일 경로
//            int count = 0; // 중복된 파일 수
//            
//            // 일반 무한루프
//            while (true) {
//               // 저장될 파일 이름 -> 현재시각 + 카운트값 + 확장자
//               fileName = String.format("%d%d%s", System.currentTimeMillis(), count, ext);
//               // 업로드 파일이 저장될 폴더 + 파일이름으로 파일객체를 생성한다
//               uploadFile = new File(uploadDirFile, fileName);
//               
//               // 동일한 이름의 파일이 없다면 반복 중단
//               if (!uploadFile.exists()) {
//                  filePath = uploadFile.getAbsolutePath();
//                  break;
//               }
//         
//            // if문을 빠져나올 경우 중복된 이름의 파일이 존재한다는 의미이므로 count를 1증가
//            count++;
//            }
//            
//            /** 3-3) 업로드 된 파일을 결정된 파일 경로로 저장 */
//            f.write(uploadFile);// 파일 저장
//            f.delete(); // 파일 객체는 삭제
//            
//            // 원도우에서 처리할 경우 파일 경로상에 존재하는 역슬래시로 변경한다
//            filePath = filePath.replace("\\", "/");
//            
//            // 최종적으로 생성된 경로에서 업로드 파일까지의 경로를 제거한다
//            // ex) D:/jsp/upload/2234234435.jpg -> /2234234435.jpg
//            filePath = filePath.replace(this.uploadDir.replace("\\", "/"), "");
//            
//            /** 3-4) 파일 정보 분류 처리 */
//            // 생성된 정보를 Beans의 객체로 설정해서 컬렉션에 저장한다
//            // -> 이 정보는 추후 파일의 업로드 내역을 DB에 저장할 때 사용된다.
//            UploadItem info = new UploadItem();
//            info.setFieldName(fieldName);
//            info.setOrginName(orginName);
//            info.setFilePath(filePath);
//            info.setContentType(contentType);
//            info.setFileSize(fileSize);
//            
//            fileList.add(info);
//         }
//      }
//      
//      /** 4) 취득한 정보를 로그에 기록한다 */
//      for (UploadItem item : fileList) {
//         log.debug(String.format("(f) <-- %s", item.toString()));
//      }
//      
//      for (String key : paramMap.keySet()) {
//         log.debug(String.format("(p) <-- %s = %s", key, paramMap.get(key)));
//      }
//      
//   }
   
