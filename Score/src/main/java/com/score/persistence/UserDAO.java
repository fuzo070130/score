package com.score.persistence;

import com.score.domain.vo.UserVO;

public interface UserDAO {
	
	public int register(UserVO vo)throws Exception;
	
	public UserVO registerCheck(UserVO vo)throws Exception;
	
	public UserVO login(UserVO vo)throws Exception;
	
}
