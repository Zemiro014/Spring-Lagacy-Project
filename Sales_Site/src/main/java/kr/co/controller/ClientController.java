package kr.co.controller;


import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.service.ClientService;
import kr.co.vo.ClientVO;

@Controller
@RequestMapping("/client/*")
public class ClientController 
{
	private static final Logger logger = LoggerFactory.getLogger(ClientController.class);
	
	@Inject
	ClientService clService;
	
	// Adicione BCryptPasswordEncoder para habilitar a função de criptografia.
	@Inject
	BCryptPasswordEncoder pwdEncoder;
	
	@RequestMapping(value="/registerNewClient", method = RequestMethod.GET)
	public void getRegisterNewClient() throws Exception
	{
		logger.info("Get form to register new Client");
	}
	
	@RequestMapping(value="/registerNewClient", method = RequestMethod.POST)
	public String postRegisterNewClient(ClientVO client) throws Exception
	{
		logger.info("Registering a new client to the system");
		int result = clService.userChck(client);
		try 
		{
			if(result == 1)
			{
				return "/client/registerNewClient";
			}
			else if(result == 0) 
			{
				String inputPassword = client.getPassword();
				
				String encryptedPassword = pwdEncoder.encode(inputPassword);
				
				client.setPassword(encryptedPassword);
				
				clService.registerNewClient(client);
			}			
		}
		catch(Exception e) 
		{
			throw new RuntimeException();
		}		
		
		return "redirect:/";		
	}
	
	@RequestMapping(value="/loginClient", method = RequestMethod.POST)
	public String login(ClientVO client, HttpSession session, RedirectAttributes rttr) throws Exception
	{
		logger.info("Client login process");
		
		session.getAttribute("client");
		
		/*	System.out.println("Estou no ClientController");
			System.out.println("User Name ==> " + client.getUser_());
			System.out.println("User Pass ==> " + client.getPassword());
		*/
		
		ClientVO clientLogin = clService.loginClient(client);
		
		/*
			System.out.println("Estou no ClientController");
			System.out.println("User Name ==> " + clientLogin.getUser_());
			System.out.println("User CPF ==> " + clientLogin.getCpf());
			System.out.println("User Pass ==> " + clientLogin.getPassword());
		*/
		
		//comparison pwdEncoder.matches (password entered (), password encrypted ()).
		boolean pwdMatch = pwdEncoder.matches(client.getPassword(), clientLogin.getPassword());
		// System.out.println("pwdMatch :: ##> " + pwdMatch);
		
		if(clientLogin != null && pwdMatch == true) 
		{
			session.setAttribute("client", clientLogin);			
		}
		else 
		{
			/*
			session.setAttribute("client", null);
			rttr.addFlashAttribute("msg", false);
			*/
			return "redirect:/";
		}
		//return "redirect:/";
		return "main/inversion";
	}
	
	@RequestMapping(value="/logoutClient", method = RequestMethod.GET)
	public String logout(HttpSession session) throws Exception
	{
		session.invalidate();
		
		return "redirect:/";
	}
}
