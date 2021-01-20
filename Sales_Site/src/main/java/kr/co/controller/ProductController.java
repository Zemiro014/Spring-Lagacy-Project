package kr.co.controller;
import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import kr.co.service.ProductService;
import kr.co.vo.ProductModelVO;
import kr.co.vo.ProductVO;
import kr.co.vo.SequenciaHarmonica;
import kr.co.vo.Tonalidades;

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
		model.addAttribute("brand", prodService.getAllProductBrand());
		model.addAttribute("type", prodService.getAllProductType());
	}
	
	@ResponseBody
	@RequestMapping(value="/newProduct", method = RequestMethod.POST)
	public String PostRegisterNewProduct(ProductVO product, MultipartHttpServletRequest mpRequest) throws Exception
	{
		logger.info("Registering new product");
		
		String msg = null;
		try
		{
			int id_type_ = (int)product.getId_type();
			int id_brand_ = (int)product.getId_brand();
			int id_model_ = (int)product.getId_model();
			
			product.setId_type(id_type_);
			product.setId_brand(id_brand_);
			product.setId_model(id_model_);
			
			System.out.println("Product ID >> "+product.getId_product());
			
			prodService.registerNewProduct(product, mpRequest);
			msg = "Registration was successful";
			
		} catch(Exception e) 
		{
			msg = "Error to register!!  Causa: " +e.getCause();
		}
		
		//return "/product/listAllProducts";
		return msg;
	}
	@RequestMapping(value="/payment", method = RequestMethod.GET)
	public void getPayment() throws Exception
	{
		logger.info("Get a payment form");
	}
	
	@RequestMapping(value="/countProduct", method=RequestMethod.POST)
	public String PostCountProduct(@RequestParam ("id_product")  int id_product, Model model) throws Exception
	{
		logger.info("Get count Product");
		
		model.addAttribute("getProduct",prodService.getProduct(id_product));
		return "/product/lightBoxNewProduct";
	}
	
	@ResponseBody
	@RequestMapping(value="/deleteProduct", method=RequestMethod.POST)
	public String deleteProduct(@RequestParam ("id_product")  int id_product) throws Exception
	{
		logger.info("Deleting the product from the database");
		String msg = null;
		try 
		{
			prodService.deleteProduct(id_product);
			msg = "successfully deleted";
		} 
		catch(Exception e)
		{
			msg="Failed to delete";
		}		
		
		return msg;
	}
	
	// Desativado
	@RequestMapping(value="/listAllProducts", method = RequestMethod.GET)
	public String getAllProducts(Model model) throws Exception 
	{
		logger.info("Listing all products");
		
		//model.addAttribute("product",prodService.getAllProducts());
		
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
	public List<ProductVO> ListAllProducts(ProductVO product) throws Exception 
	{
		logger.info("Listing all products");
		
		return prodService.getAllProducts(product);
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
	
	
	
	// Testando Exibição de cifras
	@RequestMapping(value="/ExibirCifras", method=RequestMethod.GET)
	public void getExibirCifras(Model model) throws Exception
	{
		logger.info("Mostrando exibidor de cifras");
		model.addAttribute("tonalidades", prodService.getTonalidades());
	}
	
	@ResponseBody
	@RequestMapping(value="/listSequenciaHarmonico", method = RequestMethod.POST)
	public List<SequenciaHarmonica> getSequenciasHarmonica(Tonalidades tonalidade) throws Exception
	{		
		logger.info("Usando Ajax para buscar a sequência harmonica");
		System.out.println("Estou no Controller");
		System.out.println("Tom >> "+tonalidade.getTom());
		
		return prodService.getSequenciasHarmonicas(tonalidade);
	}
}
