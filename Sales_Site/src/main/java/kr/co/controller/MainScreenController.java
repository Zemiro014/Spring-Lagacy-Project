package kr.co.controller;


import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
		List<ProductVO> tvs = new ArrayList<ProductVO>();
		List<ProductVO> computers = new ArrayList<ProductVO>();
		List<ProductVO> watchs = new ArrayList<ProductVO>();
		
		List<ProductVO> listProducts = proService.getAllProductsWithImage();
		
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
			
			if(p.getId_type()==2)
			{
				tvs.add(p);
			}
			
			if(p.getId_type()==4)
			{
				watchs.add(p);
			}
		}
		model.addAttribute("ListCellPhones", cellPhone);
		model.addAttribute("ListComputers",computers);
		model.addAttribute("ListTVs",tvs);
		model.addAttribute("ListWatchs",watchs);
	}
}
