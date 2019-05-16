package com.model2.mvc.common;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import org.springframework.web.multipart.MultipartFile;

public class FileNameUUID {
	
	
	public static String saveFile(MultipartFile file) {
		UUID uuid = UUID.randomUUID();
		String saveName = uuid+"_"+ file.getOriginalFilename();
		
		System.out.println("ÆÄÀÏ¸í"+saveName);

		File saveFile = new File("C:\\Users\\qwqws\\git\\07.addFunction\\07.Model2MVCShop(URI,pattern)\\WebContent\\images\\uploadFiles",saveName);
		
		try {
			file.transferTo(saveFile);
		} catch (IOException e) {
			e.printStackTrace();
			return null;
		}
		return saveName;
	}

}
