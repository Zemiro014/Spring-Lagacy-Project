package kr.co.vo;

public class ProductVO 
{
	private int id_product;
	private String product_name;
	private float product_price;
	private String product_state;
	private String product_descri;
	
	private int id_type;
	private String type;
	
	private int id_brand;
	private String brand;
	
	private int id_model;
	private String model;
	
	public int getId_product() {
		return id_product;
	}
	public void setId_product(int id_product) {
		this.id_product = id_product;
	}
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	public float getProduct_price() {
		return product_price;
	}
	public void setProduct_price(float product_price) {
		this.product_price = product_price;
	}
	public String getProduct_state() {
		return product_state;
	}
	public void setProduct_state(String product_state) {
		this.product_state = product_state;
	}
	public String getProduct_descri() {
		return product_descri;
	}
	public void setProduct_descri(String product_descri) {
		this.product_descri = product_descri;
	}	
	
	public int getId_type() {
		return id_type;
	}
	public void setId_type(int id_type) {
		this.id_type = id_type;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}	
	
	public int getId_brand() 
	{
		return id_brand;
	}
	public void setId_brand(int id_brand) 
	{
		this.id_brand = id_brand;
	}
	public String getBrand() 
	{
		return brand;
	}
	public void setBrand(String brand) 
	{
		this.brand = brand;
	}
	
	public int getId_model() 
	{
		return id_model;
	}
	public void setId_model(int id_model) 
	{
		this.id_model = id_model;
	}
	public String getModel() {
		return model;
	}
	public void setModel(String model) {
		this.model = model;
	}
	
	
}
