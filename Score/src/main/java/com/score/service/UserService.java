package com.score.service;

import com.score.domain.vo.UserVO;

public interface UserService {
	
	public int register(UserVO vo)throws Exception;
	
	public UserVO registerCheck(UserVO vo)throws Exception;
	
	public UserVO login(UserVO vo)throws Exception;
	
	public int idCheck(String userID)throws Exception;
	
	public int nickNameCheck(String userNickName)throws Exception;

}
