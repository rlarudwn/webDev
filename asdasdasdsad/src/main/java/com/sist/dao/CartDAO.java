package com.sist.dao;

import java.util.*;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import com.sist.vo.CartVO;

public class CartDAO {
    private static SqlSessionFactory ssf;

    static {
        try {
            ssf = CreateSqlSessionFactory.getSsf();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    public static void addCartItem(CartVO cartItem) {
        SqlSession session = null;
        try {
            session = ssf.openSession(true); 
            session.insert("addCartItem", cartItem);
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            if (session != null) session.close();
        }
    }

}