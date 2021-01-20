package kr.co.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import kr.co.vo.ProductModelVO;
import kr.co.vo.ProductVO;
import kr.co.vo.SearchCriteria;
import kr.co.vo.SequenciaHarmonica;
import kr.co.vo.Tonalidades;
import kr.co.vo.TypeVO;

public interface ProductService 
{
	public List<ProductVO> getAllProducts(ProductVO product) throws Exception;
	
	public List<ProductVO> getAllProductsWithImage() throws Exception;
	
	public List<TypeVO> getAllProductType() throws Exception;
	
	public List<ProductModelVO> getAllProductModel(ProductVO product) throws Exception;
	
	public List<ProductModelVO> listAllProductModel(ProductModelVO prModelVO) throws Exception;
	
	public List<ProductVO> getAllProductBrand() throws Exception;
	
	public void registerNewProduct(ProductVO product, MultipartHttpServletRequest mpRequest) throws Exception;
	
	public void insertNewModel(ProductModelVO proModelVO) throws Exception;	
	
	public List<Map<String, Object>> selectFileList(int id_product) throws Exception;
	
	public Map<String, Object> selectFileInfo(Map<String, Object> map) throws Exception;
	
	// 19/01/2021
	public List<ProductVO> listPage(SearchCriteria scri) throws Exception;
	
	public List<ProductVO> getProduct(int id_product) throws Exception;
	
	public void deleteProduct(int id_product) throws Exception;
	// Testando Exibição de Cifra
	public List<Tonalidades> getTonalidades() throws Exception;
	
	public List<SequenciaHarmonica> getSequenciasHarmonicas(Tonalidades tom) throws Exception;
}
