package kr.co.util;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletContext;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import kr.co.vo.ProductVO;

//FileUtils é uma classe que executa várias operações usando as informações de arquivos anexados.
@Component("fileUtils")
public class FileUtils {
	private static final String filePath = "/webapp/resources/uploadImages"; // where the file will be saved
	 ServletContext context;
	public List<Map<String, Object>> parseInsertFileInfo(ProductVO product, MultipartHttpServletRequest mpRequest) throws Exception
	{		
		/*
		Iterator is a collection of data? This is an interface that can get information from a collection in
		Lists and arrays can access data sequentially, but classes such as Map cannot be accessed sequentially.
		Iterator is used to access the data in Map sequentially using while statement.
		*/
		
		Iterator<String> iterator = mpRequest.getFileNames();
		
		MultipartFile multipartFile = null;
		String originalFileName = null;
		String originalFileExtension = null;
		String storedFileName = null;
		String storedfilePath = null;
		String absoluteFilePath = null;
		String root_path = null;
		String attach_path = null;
		List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
		Map<String, Object> listMap = null;
		
		int ID_PRODUCT = product.getId_product();
		
		
		//File file = new File(filePath);
		/*
		if(file.exists() == false)
		{
			file.mkdirs();
		}
		*/
		while(iterator.hasNext()) 
		{
			multipartFile = mpRequest.getFile(iterator.next());
			if(multipartFile.isEmpty() == false) 
			{
				originalFileName = multipartFile.getOriginalFilename();
				originalFileExtension = originalFileName.substring(originalFileName.lastIndexOf("."));
				storedFileName = getRandomString() + originalFileExtension;
				
				//String absoluteFilePath = context.getRealPath(filePath);
				try 
				{
					root_path = mpRequest.getSession().getServletContext().getRealPath("/");
					attach_path = "resources/uploadFiles/";
					//absoluteFilePath = context.getRealPath(filePath);
					
				}catch(Exception e)
				{
					e.getCause();
				}
				File file = new File(root_path + attach_path + storedFileName);
				System.out.println("File created: " + file.getName());
				System.out.println("Absolute path: " + file.getAbsolutePath());
				System.out.println("Path: " + file.getPath());
				multipartFile.transferTo(file);		
				storedfilePath = file.toString();
				listMap = new HashMap<String, Object>();
				listMap.put("ID_PRODUCT",ID_PRODUCT);
				listMap.put("ORG_FILE_NAME", originalFileName);
				listMap.put("STORED_FILE_NAME", storedFileName);
				listMap.put("FILE_SIZE", multipartFile.getSize());
				listMap.put("FILE_PATH", storedfilePath);
				list.add(listMap);
			}
		}
		return list;
	}
	
	public List<Map<String, Object>> parseUpdateFileInfo(ProductVO product, String[] files, String[] fileNames, MultipartHttpServletRequest mpRequest) throws Exception
	{ 
		Iterator<String> iterator = mpRequest.getFileNames();
		MultipartFile multipartFile = null; 
		String originalFileName = null; 
		String originalFileExtension = null; 
		String storedFileName = null; 
		List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
		Map<String, Object> listMap = null; 
		int ID_PRODUCT = product.getId_product();
		
		while(iterator.hasNext())
		{ 
			multipartFile = mpRequest.getFile(iterator.next()); 
			if(multipartFile.isEmpty() == false)
			{ 
				originalFileName = multipartFile.getOriginalFilename(); 
				originalFileExtension = originalFileName.substring(originalFileName.lastIndexOf(".")); 
				storedFileName = getRandomString() + originalFileExtension; 
				multipartFile.transferTo(new File(filePath + storedFileName)); 
				listMap = new HashMap<String,Object>();
				listMap.put("IS_NEW", "Y");
				listMap.put("ID_PRODUCT", ID_PRODUCT); 
				listMap.put("ORG_FILE_NAME", originalFileName);
				listMap.put("STORED_FILE_NAME", storedFileName); 
				listMap.put("FILE_SIZE", multipartFile.getSize()); 
				list.add(listMap); 
			} 
		}
		if(files != null && fileNames != null)
		{ 
			for(int i = 0; i<fileNames.length; i++)
			{
					listMap = new HashMap<String,Object>();
                 listMap.put("IS_NEW", "N");
					listMap.put("FILE_ID", files[i]); 
					list.add(listMap); 
			}
		}
		return list; 
	}

	
	public static String getRandomString() 
	{
		return UUID.randomUUID().toString().replaceAll("-", "");
	}
}

