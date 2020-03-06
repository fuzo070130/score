package com.score.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.score.domain.vo.UserVO;
import com.score.persistence.UserDAO;

@Service
public class UserServiceImpl implements UserService{
	
	@Inject
	UserDAO dao;

	@Override
	public int register(UserVO vo) throws Exception {
		return dao.register(vo);
	}

	@Override
	public UserVO login(UserVO vo) throws Exception {
		return dao.login(vo);
	}

	@Override
	public UserVO registerCheck(UserVO vo) throws Exception {
		return dao.registerCheck(vo);
	}

	@Override
	public int idCheck(String userID) throws Exception {
		return dao.idCheck(userID);
	}

	@Override
	public int nickNameCheck(String userNickName) throws Exception {
		return dao.nickNameCheck(userNickName);
	}

}
