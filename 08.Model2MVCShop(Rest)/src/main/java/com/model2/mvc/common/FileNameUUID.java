package com.model2.mvc.common;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import org.springframework.web.multipart.MultipartFile;

public class FileNameUUID {
	
	
	public static String saveFile(MultipartFile file) {
		
		String saveName = "NotImage.png";
		if(!file.getOriginalFilename().equals("")) {
			System.out.println("���������������������?");
		
		UUID uuid = UUID.randomUUID();
		saveName = uuid+"_"+ file.getOriginalFilename();
		System.out.println("�����̸���????   "+ "_"+file.getOriginalFilename()+"_");
		
		System.out.println("���ϸ�"+saveName);

		File saveFile = new File("C:\\Users\\USER\\git\\08.MVC-Rest-\\08.Model2MVCShop(Rest)\\WebContent\\images\\uploadFiles",saveName);
		// C:\\Users\\qwqws\\git\\08.MVC-Rest-\\08.Model2MVCShop(Rest)\\WebContent\\images\\uploadFiles
		// C:\\Users\\USER\\git\\08.MVC-Rest-\\08.Model2MVCShop(Rest)\\WebContent\\images\\uploadFiles
		try {
			file.transferTo(saveFile);
		} catch (IOException e) {
			e.printStackTrace();
			return null;
			}
		}
		return saveName;
	}

}
