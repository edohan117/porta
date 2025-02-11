package com.edohan.porta.mapper;

import java.util.*;

import org.apache.ibatis.annotations.Param;

public interface MemberMapper {

    void insertMember(Map<String, String> member);

    Integer deleteMember(String userId);

    List<Map<String, Object>> memberList();

    Map<String, Object> getProfile(String userId);

    Map<String, Object> loginCheck(@Param("userId") String userId, @Param("password") String password);
    
    Integer checkIdExists(String id);
}
