package kr.co.service;

import kr.co.vo.ClientVO;

public interface ClientService
{
	public void registerNewClient(ClientVO client) throws Exception;
	
	public ClientVO loginClient(ClientVO client) throws Exception;
	
	public int userChck(ClientVO client) throws Exception;
	
	public int passChck(ClientVO client) throws Exception;
}
