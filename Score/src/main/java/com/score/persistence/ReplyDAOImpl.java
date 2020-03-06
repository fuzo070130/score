package com.score.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.score.domain.vo.ReplyVO;

@Repository
public class ReplyDAOImpl implements ReplyDAO {
	
	@Autowired
	private SqlSession session;
	
	private static String namespace = "com.score.mapper.ReplyMapper";

	@Override
	public int insert(ReplyVO vo) {
		return session.insert(namespace + ".insert", vo);
	}

	@Override
	public List<ReplyVO> replyList(Integer boardNumber, Integer replyPoint) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("boardNumber", boardNumber);
		map.put("replyPoint", replyPoint);
		return session.selectList(namespace + ".replyList", map);
	}

}
