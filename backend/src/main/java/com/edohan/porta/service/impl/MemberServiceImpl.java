package com.edohan.porta.service.impl;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.edohan.porta.mapper.MemberMapper;
import com.edohan.porta.service.MemberService;

@Service("MemberService")
public class MemberServiceImpl implements MemberService {
    
    @Autowired
    private MemberMapper mapper;

    @Override
    @Transactional
    public Map<String, Object> register(Map<String, String> map) {
        mapper.insertMember(map);
        return Collections.singletonMap("status", "registered");
    }

    @Override
    @Transactional
    public Map<String, Object> login(String userId, String password) {
        Map<String, Object> map = mapper.loginCheck(userId, password);

            Map<String, Object> rs = new HashMap<>();

        if (map != null && password.equals(map.get("PASSWORD"))) {
            rs.put("status", "success");
            rs.put("userId", map.get("USER_ID"));
            rs.put("username", map.get("USER_NM"));
            rs.put("nickname", map.get("NICK_NM"));
            rs.put("email", map.get("EMAIL"));
            rs.put("role",map.get("ROLE"));
        } else {
            rs.put("status", "failure");
            rs.put("message", "Invalid credentials");
        }

        return rs;
    }

    @Override
    @Transactional(readOnly = true)
    public List<Map<String, Object>> memberList() {
        return mapper.memberList();
    }
    
    @Override
    @Transactional(readOnly = true)
    public Map<String, Object> getProfile(String userId) {
        return mapper.getProfile(userId);
    }
    
    @Override
    @Transactional(readOnly = true)
    public boolean deleteMember(String userId) {
        Integer rs = mapper.deleteMember(userId);
        return rs > 0;
    }

    @Override
    @Transactional(readOnly = true)
    public boolean checkIdExists(String id) {
        Integer count = mapper.checkIdExists(id);
    return count != null && count > 0;
    }
}
