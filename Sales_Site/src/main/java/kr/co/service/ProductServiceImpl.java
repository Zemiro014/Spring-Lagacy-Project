package kr.co.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import kr.co.dao.ProductDAO;
import kr.co.util.FileUtils;
import kr.co.vo.ProductModelVO;
import kr.co.vo.ProductVO;
import kr.co.vo.SequenciaHarmonica;
import kr.co.vo.Tonalidades;
import kr.co.vo.TypeVO;

@Service
public class ProductServiceImpl implements ProductService 
{
	@Resource(name="fileUtils")
	private FileUtils fileUtils;
	
	@Inject
	ProductDAO prodDao;
	
	@Override
	public List<ProductVO> getAllProducts() throws Exception 
	{		
		return prodDao.getAllProducts();
	}
	
	@Override
	public List<ProductVO> getAllProductsWithImage() throws Exception 
	{
		return prodDao.getAllProductsWithImage();
	}

	@Override
	public void registerNewProduct(ProductVO product, MultipartHttpServletRequest mpRequest) throws Exception 
	{
		prodDao.registerNewProduct(product);
		
		List<Map<String, Object>> list = fileUtils.parseInsertFileInfo(product, mpRequest);
		int size = list.size();
		for(int i=0; i<size; i++)
		{
			prodDao.insertFile(list.get(i));
		}
	}

	@Override
	public List<TypeVO> getAllProductType() throws Exception 
	{
		return prodDao.getAllProductType();
	}

	@Override
	public List<ProductVO> getAllProductBrand() throws Exception 
	{
		return prodDao.getAllProductBrand();
	}

	@Override
	public List<ProductModelVO> getAllProductModel(ProductVO product) throws Exception
	{		
		return prodDao.getAllProductModel(product);
	}

	@Override
	public List<ProductModelVO> listAllProductModel(ProductModelVO prModelVO) throws Exception 
	{
		System.out.println(">>>>>>> Estou no Service ");
		System.out.println(">>>>>>> id_brand : "+prModelVO.getId_brand());
		return prodDao.listAllProductModel(prModelVO);
	}

	@Override
	public void insertNewModel(ProductModelVO proModelVO) throws Exception
	{		
		prodDao.insertNewModel(proModelVO);
	}

	@Override
	public List<Map<String, Object>> selectFileList(int id_product) throws Exception
	{
		return prodDao.selectFile(id_product);
	}

	@Override
	public Map<String, Object> selectFileInfo(Map<String, Object> map) throws Exception
	{
		return prodDao.selectFileInfo(map);
	}

	// Testando Exibição de Cifra
	@Override
	public List<Tonalidades> getTonalidades() throws Exception 
	{
		// TODO Auto-generated method stub
		return prodDao.getTonalidades();
	}

	@Override
	public List<SequenciaHarmonica> getSequenciasHarmonicas(Tonalidades tom) throws Exception {
		
		System.out.println("Estou no Service");
		System.out.println("Tom >> "+tom.getTom());
		
		return prodDao.getSequenciasHarmonicas(tom);
	}


}
