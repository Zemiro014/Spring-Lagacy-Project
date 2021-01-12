package kr.co.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.dao.ClientDAO;
import kr.co.vo.ClientVO;

@Service
public class ClientServiceImpl implements ClientService
{

	@Inject
	private ClientDAO cdao;
	
	@Override
	public void registerNewClient(ClientVO client) throws Exception 
	{
		cdao.registerNewClient(client);
	}
	
	@Override
	public ClientVO loginClient(ClientVO client) throws Exception
	{	
		/*
			System.out.println("Estou no ClientService");
			System.out.println("User Name ==> " + client.getUser_());
			System.out.println("User Pass ==> " + client.getPassword());
		*/
		return cdao.loginClient(client);
	}

	@Override
	public int userChck(ClientVO client) throws Exception 
	{
		return cdao.userChck(client);
	}

	@Override
	public int passChck(ClientVO client) throws Exception
	{
		return cdao.passChck(client);
	}
}
