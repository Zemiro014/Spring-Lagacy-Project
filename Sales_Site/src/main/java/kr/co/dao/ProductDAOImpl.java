package kr.co.dao;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.vo.ProductModelVO;
import kr.co.vo.ProductVO;
import kr.co.vo.SequenciaHarmonica;
import kr.co.vo.Tonalidades;
import kr.co.vo.TypeVO;

@Repository
public class ProductDAOImpl implements ProductDAO 
{
	@Inject
	SqlSession sqlSession;
	
	@Override
	public List<ProductVO> getAllProducts() throws Exception
	{
		return sqlSession.selectList("productMapper.getAllProduct");
	}

	@Override
	public List<ProductVO> getAllProductsWithImage() throws Exception
	{
		return sqlSession.selectList("productMapper.ListAllProductWithImage");
	}
	
	@Override
	public void registerNewProduct(ProductVO product) throws Exception 
	{
		sqlSession.insert("productMapper.registerNewProduct", product);	
	}

	@Override
	public List<TypeVO> getAllProductType() throws Exception 
	{
		return sqlSession.selectList("productMapper.getAllProductType");
	}

	@Override
	public List<ProductVO> getAllProductBrand() throws Exception
	{
		return sqlSession.selectList("productMapper.getAllProductBrand");
	}

	@Override
	public List<ProductModelVO> getAllProductModel(ProductVO product) throws Exception 
	{
		return sqlSession.selectList("productMapper.getModelProduct",product);
	}

	@Override
	public List<ProductModelVO> listAllProductModel(ProductModelVO prModelVO) throws Exception
	{
		return sqlSession.selectList("productMapper.listAllModel",prModelVO);
	}

	@Override
	public void insertNewModel(ProductModelVO proModelVO) throws Exception 
	{
		sqlSession.insert("productMapper.insertNewModel", proModelVO);
	}

	@Override
	public void insertFile(Map<String, Object> map) throws Exception 
	{
		sqlSession.insert("productMapper.insertFile", map);
	}

	@Override
	public List<Map<String, Object>> selectFile(int id_product) throws Exception
	{
		return sqlSession.selectList("productMapper.selectFileList", id_product);
	}

	@Override
	public Map<String, Object> selectFileInfo(Map<String, Object> map) throws Exception
	{
		return sqlSession.selectOne("productMapper.selectFileInfo", map);
	}

	@Override
	public void updateFile(Map<String, Object> map) throws Exception
	{
		sqlSession.update("productMapper.updateFile", map);
	}

	
	// Testando Exibição de Cifras
	@Override
	public List<Tonalidades> getTonalidades() throws Exception
	{
		return sqlSession.selectList("productMapper.getTonalidades");
	}

	@Override
	public List<SequenciaHarmonica> getSequenciasHarmonicas(Tonalidades tom) throws Exception {
		 
		return sqlSession.selectList("productMapper.getSquenciaHarmonica", tom);
	}

}
