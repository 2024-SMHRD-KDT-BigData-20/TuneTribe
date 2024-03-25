package com.smhrd.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.db.SqlSessionManager;

public class SingersDAO {
   SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
   
   public List<SingersVO> lineuplist(int fes_idx) {
      List<SingersVO> lineuplist = null;
      SqlSession session = sqlSessionFactory.openSession(true);
      lineuplist = session.selectList("com.smhrd.db.SingersMapper.lineuplist", fes_idx);
      session.close();
      return lineuplist;
   }
   
   public int favsingeridx(String singer_name){
      int favsingeridx = 0;
      SqlSession session = sqlSessionFactory.openSession(true);
      favsingeridx = session.selectOne("com.smhrd.db.SingersMapper.indexlist", singer_name);
      session.close();
      return favsingeridx;
   }
   
}