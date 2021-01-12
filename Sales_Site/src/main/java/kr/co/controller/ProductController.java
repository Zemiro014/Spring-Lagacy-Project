package kr.co.controller;
import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import kr.co.service.ProductService;
import kr.co.vo.ProductModelVO;
import kr.co.vo.ProductVO;

@Controller
@RequestMapping("/product/*")
public class ProductController
{
	private static final Logger logger = LoggerFactory.getLogger(ProductController.class);

	@Inject
	ProductService prodService;
	
	@RequestMapping(value="/productScreen", method=RequestMethod.GET)
	public void getProductScreen(Model model) throws Exception
	{
		logger.info("Product Screen");
	}
	
	@RequestMapping(value="/newProduct", method=RequestMethod.GET)
	public void getRegisterNewProduct(Model model) throws Exception
	{
		logger.info("Registering new product");
		
		//model.addAttribute("brand", prodService.getAllProductBrand());
		model.addAttribute("type", prodService.getAllProductType());
	}
	
	@RequestMapping(value="/newProduct", method = RequestMethod.POST)
	public String PostRegisterNewProduct(ProductVO product, MultipartHttpServletRequest mpRequest) throws Exception
	{
		logger.info("Registering new product");
		
		int id_type_ = (int)product.getId_type();
		int id_brand_ = (int)product.getId_brand();
		int id_model_ = (int)product.getId_model();
		
		product.setId_type(id_type_);
		product.setId_brand(id_brand_);
		product.setId_model(id_model_);
		
		System.out.println("Product ID >> "+product.getId_product());
		
		prodService.registerNewProduct(product, mpRequest);
		return "/product/listAllProducts";
	}
	
	// Desativado
	@RequestMapping(value="/listAllProducts", method = RequestMethod.GET)
	public String getAllProducts(Model model) throws Exception 
	{
		logger.info("Listing all products");
		
		model.addAttribute("product",prodService.getAllProducts());
		
		return "/product/listAllProducts";
	}
	
	@RequestMapping(value="/manageModel", method = RequestMethod.GET)
	public void getManageModel(Model model) throws Exception
	{
		logger.info("Get manager of Model");
		
		model.addAttribute("brand", prodService.getAllProductBrand());
		model.addAttribute("type", prodService.getAllProductType());
	}
	
	@ResponseBody
	@RequestMapping(value="/listAllProducts", method = RequestMethod.POST)
	public List<ProductVO> ListAllProducts() throws Exception 
	{
		logger.info("Listing all products");		
		
		return prodService.getAllProducts();
	}
	
	@ResponseBody
	@RequestMapping(value="/manageModel", method = RequestMethod.POST)
	public void postManageModel(ProductModelVO prModelVO) throws Exception
	{
		logger.info("Post manager of Model");	
		
		int typeProduct = (int)prModelVO.getProduct_type_id();
		int idBrand = (int)prModelVO.getId_brand();
		
		prModelVO.setProduct_type_id(typeProduct);
		prModelVO.setId_brand(idBrand);
		
		prodService.insertNewModel(prModelVO);
	}
	
	@ResponseBody
	@RequestMapping(value="/listModel", method = RequestMethod.POST)	
	public List<ProductModelVO> getModel(ProductVO product) throws Exception
	{		
		logger.info("Using Ajax to get product model");
		
		int id_type_ = (int)product.getId_type();
		int id_brand_ = (int)product.getId_brand();
		
		product.setId_type(id_type_);
		product.setId_brand(id_brand_);
		
		List<ProductModelVO> list_product_model = prodService.getAllProductModel(product);		
		
		return list_product_model;
	}
	
	@ResponseBody
	@RequestMapping(value="/listAllModel", method = RequestMethod.POST)
	public List<ProductModelVO> listAllModel(ProductModelVO prModelVO) throws Exception
	{
		logger.info("Using Ajax to get product model");
		
		int id_brand_ = (int)prModelVO.getId_brand();		
		prModelVO.setId_brand(id_brand_);
		
		System.out.println(">>>>>>> id_brand : "+prModelVO.getId_brand());
		
		List<ProductModelVO> listAllModel = prodService.listAllProductModel(prModelVO); 
		return listAllModel;
	}
	@ResponseBody
	@RequestMapping(value="/listBrand", method = RequestMethod.POST)
	public List<ProductVO> listBrand() throws Exception
	{	
		logger.info("Using Ajax to get product brand");
		return prodService.getAllProductBrand();
	}
}
