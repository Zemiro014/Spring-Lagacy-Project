package kr.co.vo;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

public class Paging 
{
	private int totalCount;
	private int startPage;
	private int endPage;
	private boolean prev;
	private boolean next;
	private int displayPageNum = 20;
	
	private Criteria cri;
	
	public void setCri(Criteria cri) 
	{
		this.cri = cri;
	}
	
	public void setTotalCount(int totalCount) 
	{
		this.totalCount = totalCount;
		calcData();
	}
	
	public int getTotalCount() 
	{
		return totalCount;
	}
	
	public int getStartPage() 
	{
		return startPage;
	}
	
	public int getEndPage() 
	{
		return endPage;
	}
	public boolean isPrev() 
	{
		return prev;
	}
	
	public boolean isNext() 
	{
		return next;
	}
	public int getDisplayPageNum() 
	{
		return displayPageNum;
	}
	
	public Criteria getCri() 
	{
		return cri;
	}
	
	private void calcData() 
	{
		endPage = (int) (Math.ceil(cri.getPage()/(double)displayPageNum)*displayPageNum);
		startPage = (endPage - displayPageNum)+1;
		
		int tempEndPage = (int)(Math.ceil(totalCount/(double)cri.getPerPageNum()));
		if(endPage > tempEndPage) 
		{
			endPage = tempEndPage;
		}
		
		prev = startPage == 1 ? false: true;
		next = endPage * cri.getPerPageNum() >= totalCount ? false : true;
	}
	
	public String makeQuery(int page) 
	{
		UriComponents uriComponents = UriComponentsBuilder.newInstance().queryParam("page", page).queryParam("perPageNum", cri.getPerPageNum()).build();
		return uriComponents.toUriString();
	}
	
	//After that, create a makeSearch so that you can use page, perPageNum, searchType and keyword as url.	
	public String makeSearch(int page)
	{
	  
	 UriComponents uriComponents =
	            UriComponentsBuilder.newInstance()
	            .queryParam("page", page)
	            .queryParam("perPageNum", cri.getPerPageNum())
	            .queryParam("searchType", ((SearchCriteria)cri).getSearchType())
	            .queryParam("keyword", encoding(((SearchCriteria)cri).getKeyword()))
	            .build(); 
	    return uriComponents.toUriString(); 
	}
	
	private String encoding(String keyword) 
	{
		// O método trim() da string java elimina espaços à esquerda e à direita
		if(keyword == null || keyword.trim().length() == 0) 
		{
			return "";
		}
		try 
		{
			return URLEncoder.encode(keyword, "UTF-8");
		}
		catch(UnsupportedEncodingException e)
		{
			return "";
		}
	}
}
