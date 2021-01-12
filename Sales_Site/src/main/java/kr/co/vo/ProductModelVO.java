package kr.co.vo;

public class ProductModelVO 
{	
	private int model_id;
	private String model;
	private int product_type_id;
	
	// Gambiarra
	private int id_brand;
	
	public String getModel() 
	{
		return model;
	}
	public void setModel(String model) 
	{
		this.model = model;
	}
	
	
	public int getModel_id() 
	{
		return model_id;
	}
	public void setModel_id(int model_id)
	{
		this.model_id = model_id;
	}
	
	
	public int getProduct_type_id() 
	{
		return product_type_id;
	}
	public void setProduct_type_id(int product_type_id) 
	{
		this.product_type_id = product_type_id;
	}
	
	public int getId_brand() 
	{
		return id_brand;
	}
	public void setId_brand(int id_brand) 
	{
		this.id_brand = id_brand;
	}
	
	
}
