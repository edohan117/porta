package com.edohan.porta.service;

import java.util.*;

import org.apache.ibatis.annotations.Param;

public interface MemberService {
    Map<String, Object> register(Map<String, String> map);
    Map<String, Object> login(@Param("userId") String userId, @Param("password") String password);
    List<Map<String, Object>> memberList();
    Map<String, Object> getProfile(String userId);
    boolean deleteMember(String userId);
    boolean checkIdExists(String id);
}
