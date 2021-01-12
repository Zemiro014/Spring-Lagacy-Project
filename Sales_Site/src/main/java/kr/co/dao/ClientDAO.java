package kr.co.dao;

import kr.co.vo.ClientVO;

public interface ClientDAO 
{
	public void registerNewClient(ClientVO client) throws Exception;
	
	public ClientVO loginClient(ClientVO client) throws Exception;
	
	public int userChck(ClientVO client) throws Exception;
	
	public int passChck(ClientVO client) throws Exception;
}
