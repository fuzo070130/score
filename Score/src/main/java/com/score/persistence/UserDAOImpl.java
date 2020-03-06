package com.score.persistence;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.score.domain.vo.UserVO;

@Repository
public class UserDAOImpl implements UserDAO{
	
	@Autowired
	private SqlSession session;
	
	private static String namespace = "com.score.mapper.UserMapper";


	@Override
	public int register(UserVO vo) throws Exception {
		return session.insert(namespace + ".register", vo);
	}


	@Override
	public UserVO login(UserVO vo) throws Exception {
		return session.selectOne(namespace + ".login", vo);
	}


	@Override
	public UserVO registerCheck(UserVO vo) throws Exception {
		return session.selectOne(namespace + ".registerCheck", vo);
	}


	@Override
	public int idCheck(String userID) throws Exception {
		return session.selectOne(namespace + ".idCheck" , userID);
	}


	@Override
	public int nickNameCheck(String userNickName) throws Exception {
		return session.selectOne(namespace + ".nickNameCheck" , userNickName);
	}

}
