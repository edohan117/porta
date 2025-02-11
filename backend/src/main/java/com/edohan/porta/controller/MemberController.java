package com.edohan.porta.controller;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.*;

import jakarta.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import com.edohan.porta.service.MemberService;

@RestController
@RequestMapping("/api/member")
public class MemberController {
    
    @Autowired
    private MemberService service;
    
    @GetMapping("/list")
    public List<Map<String, Object>> memberList() {
        return service.memberList();
    }
    
    @PostMapping(value = "/register", consumes = "multipart/form-data")
        public Map<String, Object> register(@RequestParam("id") String id,
                                            @RequestParam("password") String password,
                                            @RequestParam("username") String username,
                                            @RequestParam("nickName") String nickName,
                                            @RequestParam("phone") String phone,
                                            @RequestParam("birthdate") String birthdate,
                                            @RequestParam("email") String email,
                                            @RequestParam("address") String address) {
            try {
                String hashedPassword = hashPassword(password);
                Map<String, String> map = new HashMap<>();
                map.put("id", id);
                map.put("password", hashedPassword);
                map.put("userNm", username);
                map.put("nickNm", nickName);
                map.put("phone", phone);
                map.put("email", email);
                map.put("birth", birthdate);
                map.put("address", address);
                return service.register(map);
            } catch (NoSuchAlgorithmException e) {
                return Collections.singletonMap("status", "error");
            }
        }
        
    @PostMapping("/login")
    public Map<String, Object> login(@RequestBody Map<String, String> loginRequest, HttpSession session) {
        String userId = loginRequest.get("id");
        String password = loginRequest.get("password");
        try {
            String hashedPassword = hashPassword(password); // 입력된 비밀번호 해시화
            Map<String, Object> response = service.login(userId, hashedPassword); // 해시된 비밀번호로 로그인
            
            if ("success".equals(response.get("status"))) {
                session.setAttribute("id", userId);
                session.setAttribute("username", response.get("username"));
                session.setAttribute("nickname", response.get("nickname"));
                session.setAttribute("email", response.get("email"));
                session.setAttribute("role", response.get("role")); // 사용자 권한 저장
            }
    
            return response;
        } catch (NoSuchAlgorithmException e) {
            return Collections.singletonMap("status", "error");
        }
    }

    @GetMapping("/profile")
    public Map<String, Object> getProfile(HttpSession session) {
        String userId = (String) session.getAttribute("id");
        if (userId == null) {
            return Collections.singletonMap("status", "error");
        }
        return service.getProfile(userId);
    }

    @PostMapping("/check-id")
    public Map<String, Object> checkId(@RequestBody Map<String, String> request) {
        String id = request.get("id");
        boolean result = service.checkIdExists(id);
        Map<String, Object> response = new HashMap<>();
        response.put("available", !result);
        return response;
    }

    
    @DeleteMapping("/delete/{userId}")
    public Map<String, Object> deleteMember(@PathVariable String userId) {
        boolean result = service.deleteMember(userId);
        Map<String, Object> response = new HashMap<>();
        if (result) {
            response.put("status", "deleted");
        } else {
            response.put("status", "failure");
            response.put("message", "Member not found or could not be deleted");
        }
        return response;
    }

    public static String hashPassword(String password) throws NoSuchAlgorithmException {
        MessageDigest md = MessageDigest.getInstance("SHA-512");
        byte[] hashedBytes = md.digest(password.getBytes());
        
        // 바이트 배열을 16진수 문자열로 변환
        StringBuilder hexString = new StringBuilder();
        for (byte b : hashedBytes) {
            String hex = Integer.toHexString(0xff & b);
            if (hex.length() == 1) hexString.append('0');
            hexString.append(hex);
        }
        return hexString.toString();
    }
    @PostMapping(value = "/profile", consumes = "multipart/form-data")
        public void profileUpdate(@RequestParam("id") String id,
                                            @RequestParam("password") String password,
                                            @RequestParam("username") String username,
                                            @RequestParam("nickName") String nickName,
                                            @RequestParam("phone") String phone,
                                            @RequestParam("birthdate") String birthdate,
                                            @RequestParam("email") String email,
                                            @RequestParam("address") String address) {
                Map<String, String> map = new HashMap<>();
                map.put("id", id);
                map.put("password", password);
                map.put("userNm", username);
                map.put("nickNm", nickName);
                map.put("phone", phone);
                map.put("email", email);
                map.put("birth", birthdate);
                map.put("address", address);
                System.out.println("     data    ::    " + id);
                System.out.println("     data    ::    " + password);
                System.out.println("     data    ::    " + nickName);
                System.out.println("     data    ::    " + phone);
                System.out.println("     data    ::    " + birthdate);
                System.out.println("     data    ::    " + address);
        }
}
