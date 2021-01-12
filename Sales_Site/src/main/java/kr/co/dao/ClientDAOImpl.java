package kr.co.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.vo.ClientVO;

@Repository
public class ClientDAOImpl implements ClientDAO
{
	@Inject
	private SqlSession sqlSession;
	
	@Override
	public void registerNewClient(ClientVO client) throws Exception
	{		
		sqlSession.insert("clientMapper.registerNewClient", client);
	}

	@Override
	public ClientVO loginClient(ClientVO client) throws Exception
	{		
		return sqlSession.selectOne("clientMapper.loginClient", client);
	}

	@Override
	public int userChck(ClientVO client) throws Exception
	{		
		return sqlSession.selectOne("clientMapper.userChk", client);
	}

	@Override
	public int passChck(ClientVO client) throws Exception
	{
		return sqlSession.selectOne("clientMapper.passChk", client);
	}

}
