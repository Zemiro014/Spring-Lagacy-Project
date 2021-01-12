package kr.co.dao;

import java.util.List;
import java.util.Map;

import kr.co.vo.ProductModelVO;
import kr.co.vo.ProductVO;
import kr.co.vo.TypeVO;

public interface ProductDAO 
{
	public List<ProductVO> getAllProducts() throws Exception;
	
	public List<TypeVO> getAllProductType() throws Exception;
	
	public List<ProductModelVO> getAllProductModel(ProductVO product) throws Exception;
	
	public List<ProductModelVO> listAllProductModel(ProductModelVO prModelVO) throws Exception;
	
	public List<ProductVO> getAllProductBrand() throws Exception;
	
	public void registerNewProduct(ProductVO product) throws Exception;
	
	public void insertNewModel(ProductModelVO proModelVO) throws Exception;
	
	public void insertFile(Map<String, Object> map) throws Exception;
	
	public List<Map<String, Object>> selectFile(int id_product) throws Exception;
	
	public Map<String, Object> selectFileInfo(Map<String, Object> map) throws Exception;
	
	public void updateFile(Map<String, Object> map) throws Exception;
}
