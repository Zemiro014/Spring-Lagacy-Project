package kr.co.controller;

import java.io.File;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.service.ProductService;
import kr.co.vo.ProductVO;

@Controller
@RequestMapping("/main/*")
public class MainScreenController
{
	private static final Logger logger = LoggerFactory.getLogger(MainScreenController.class);
	
	@Inject
	ProductService proService;
	
	@RequestMapping(value="/mainScreen", method = RequestMethod.GET)
	public void getMainScreen(Model model) throws Exception
	{
		logger.info("Show main screen");		
		
		List<ProductVO> cellPhone = new ArrayList<ProductVO>();
		List<ProductVO> computers = new ArrayList<ProductVO>();
		
		List<ProductVO> listProducts = proService.getAllProducts();
		for(ProductVO p:listProducts) 
		{
			if(p.getId_type()==6)
			{
				cellPhone.add(p);
			}
			
			if(p.getId_type()==3)
			{
				computers.add(p);
			}
		}
		model.addAttribute("cellPhones", cellPhone);
		model.addAttribute("computers",computers);		
	}
	@RequestMapping(value="/fileDown")
	public void fileDown(@RequestParam Map<String, Object> map, HttpServletResponse response) throws Exception
	{
		Map<String, Object> resultMap = proService.selectFileInfo(map);
		String storedFileName = (String) resultMap.get("STORED_FILE_NAME");
		String originalFileName = (String) resultMap.get("ORG_FILE_NAME");
		
		// Leia o arquivo anexado do local onde o arquivo foi salvo e converta-o no formato byte [].
		byte fileByte[] = org.apache.commons.io.FileUtils.readFileToByteArray(new File("C:\\mp\\file\\"+storedFileName));
		
		response.setContentType("application/octet-stream");
		response.setContentLength(fileByte.length);
		response.setHeader("Content-Disposition",  "attachment; fileName=\""+URLEncoder.encode(originalFileName, "UTF-8")+"\";");
		response.getOutputStream().write(fileByte);
		response.getOutputStream().flush();
		response.getOutputStream().close();
	}
}
