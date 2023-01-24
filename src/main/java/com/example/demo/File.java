package com.example.demo;

import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.NoSuchFileException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Calendar;
import java.util.Random;

import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

@Service
@Component
public class File {
	// ============== PATH 주소 입력 변수 ==================
	private static String PATH = "/Users/jinwoong/Documents/workspace-spring-tool-suite-4-4.16.1.RELEASE/newportfolio/bin/main/static/upload"; // 자신의 프로젝트 이미지 업로드할 폴더 주소를 가져옴
	// ==================================================

	// ============== 전역 변수 선언 ==================
	private Calendar calendar = Calendar.getInstance(); // 파일이름을 현재 시간으로 만들기 위해 Calender라는 인스턴스를 얻어온다
	Random random = new Random();
	// ================================================

	// ============== 인덱스 생성 ===================
	
//	public String[] idx_create(String... param) {		// String... 타입은 변수가 여러게 들어올 시 배열형태로 받는다는 의미 이다.
//		if (param.length != 0) {			// 배열의 길이를 조사해서 length가 0이 아닐경우 처리를 함
//			String[] new_name = new String[param.length];		// 새로운 배열을 만들기위해 String 타입에 길이는 param.length만큼 선언한다
//			for (String str : param) {			// forEach를 써서 param안에 값들을 모두 처리를 해준다.
//				str += calendar.get(Calendar.SECOND);				// 현재 SECOND 단위를 문자열로 더해준다.
//				str += calendar.get(Calendar.MILLISECOND);			// 현재 MILLISECOND 단위를 문자열로 더해준다.
//			}
//			return new_name;				// 만들어진 문자열을 보내준다.
//		} else {
//			String[] name = new String[1];			// param에 길이가 0일경우 name이라는 새로운 배열을 선언
//			name[0] = "";							// 배열 선언후 0번째 인덱스만 쓰기위해 0번째 인덱스를 초기화
//			name[0] += calendar.get(Calendar.SECOND);		// 초기화 후 현재 SECOND 단위를 문자열로 더해준다.
//			name[0] += calendar.get(Calendar.MILLISECOND);	// 현재 MILLISECOND 단위를 문자열로 더해준다.
//			return name;			// 만들어진 문자열을 보내준다.
//		}
//	}
	
	// ==================================================

	// ============== 파일이름 생성 ===================	
	
	private String File_name_create(String etcName) {		// File name을 만들어주는 함수 파라미터로 .jpg , .gif 라는 확장자를 받아온다.
		
		String File_name = "";				// File 이름을 만들어줄 변수를 생성후 초기화
		
		File_name += random.nextInt(1000000000);
		File_name += etcName;				// 만들어진 문자열에 받아온 확장자를 넣어준다.
		
		return File_name;			// 만들어진 문자열을 보내준다.
	}		// 만들어진 문자열을 보내준다.
	
	// =================================================
	
	// ====================== 파일 업로드 =====================
	
	public String FileUpload(MultipartFile File) throws IOException {
		
		String originFilename = File.getOriginalFilename();
		String extName = originFilename.substring(originFilename.lastIndexOf("."), originFilename.length());
		
		String File_name = File_name_create(extName);
		byte[] data = File.getBytes();	
		
		FileOutputStream fos = new FileOutputStream(PATH + "/" + File_name);
		fos.write(data);
		fos.close();
		
		return File_name;
	}
	
	// ========================================================
	
	// ====================== 파일 읽기 =====================
	
	// ========================================================
	
	// ====================== 파일 삭제 =====================
	public String FileDelete(String File_name) {
		Path filePath = Paths.get(PATH+"/"+File_name);
		try {
			Files.delete(filePath);
		} catch(NoSuchFileException e) {
			return "삭제하려는 파일이 없습니다.";
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "파일 삭제를 성공했습니다.";
	}
	// ========================================================
}