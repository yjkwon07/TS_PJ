package com.duojj.common;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.nio.file.Paths;
import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.duojj.service.LectureService;
import com.duojj.vo.FileImageVO;

@RequestMapping(value = "/file")
@Controller
public class FileUpload {
	private static String CURR_IMAGE_REPO_PATH = "C:"+File.separator+"shopping"+File.separator+"file_repo";

	@Inject
	private LectureService service;

	@RequestMapping(value="/download", method=RequestMethod.GET)
	protected void download(FileImageVO file, HttpServletResponse response) throws Exception {
		OutputStream outputStream = response.getOutputStream();
		String dirName = file.getClass_id();
		String fileName = file.getImage_name();
		String filePath = CURR_IMAGE_REPO_PATH + File.separator + dirName + File.separator + fileName;
		File image = new File(filePath);
		response.setHeader("Cache-Control", "no-cache");
		response.addHeader("Content-disposition", "attachment; fileName=" + fileName);
		FileInputStream fileInputStream = new FileInputStream(image);
		byte[] buffer = new byte[1024 * 8];
		while (true) {
			int count = fileInputStream.read(buffer);
			if (count == -1)
				break;
			outputStream.write(buffer, 0, count);
		}
		fileInputStream.close();
		outputStream.close();
	}
	
	@RequestMapping(value="/upload", method=RequestMethod.POST, headers = ("content-type=multipart/*"))
	@ResponseBody
	protected ResponseEntity<Map<String, String>> upload(FileImageVO file) throws Exception {
		try {		
			String fileName = file.getFile().getOriginalFilename();
			String dirName = file.getClass_id();
			String dirPath = Paths.get(CURR_IMAGE_REPO_PATH, dirName).toString();
			String filePath = Paths.get(dirPath, fileName).toString();
			File fileDir = new File(dirPath);
			File fileImage = new File(filePath);
			if(file.getFile().getSize() != 0) {
				fileDir.mkdirs();
				BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(fileImage));
				stream.write(file.getFile().getBytes());
				stream.close();
				// service 
				service.insertImage(file);
			}
			Map<String , String> map = new HashMap<String, String>();
			map.put("message", "업로드 성공");
			return new ResponseEntity <Map<String, String>>(map,HttpStatus.OK);
		} catch (Exception e) {
			System.out.println(e.getStackTrace());
			System.out.println(e.getMessage());
			Map<String , String> map = new HashMap<String, String>();
			map.put("message", "업로드 실패");
			return new ResponseEntity <Map<String, String>>(map,HttpStatus.BAD_REQUEST);
		}
	}
	
	@RequestMapping(value="/delete", method=RequestMethod.DELETE, headers = ("content-type=multipart/*"))
	@ResponseBody
	protected ResponseEntity<Map<String, String>> delete(FileImageVO file) throws Exception {
		try {
			String fileName = file.getImage_name();
			String dirName = file.getClass_id();
			String dirPath = Paths.get(CURR_IMAGE_REPO_PATH, dirName).toString();
			String filePath = Paths.get(dirPath, fileName).toString();
			File fileImage = new File(filePath);
			if( fileImage.exists() ){ 
				if(fileImage.delete()){ 
					// service
					service.deleteImage(file);
					Map<String , String> map = new HashMap<String, String>();
					map.put("message", "파일 삭제 성공");
					return new ResponseEntity <Map<String, String>>(map,HttpStatus.OK);
				}else{ 
					throw new Exception();
				} 
			}else{ 
				throw new Exception();
			}  
		} catch (Exception e) {
			System.out.println(e.getStackTrace());
			System.out.println(e.getMessage());
			Map<String , String> map = new HashMap<String, String>();
			map.put("message", "파일 삭제 실패");
			return new ResponseEntity <Map<String, String>>(map,HttpStatus.BAD_REQUEST);
		}
	}
	
}
