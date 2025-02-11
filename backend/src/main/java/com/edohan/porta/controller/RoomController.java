package com.edohan.porta.controller;

import java.util.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import com.edohan.porta.service.RoomService;
import jakarta.servlet.http.HttpServletRequest;

@RestController
@RequestMapping("/api/room")
public class RoomController {
    
    @Autowired
    private RoomService service;

    @GetMapping("/list")
    public List<Map<String, Object>> roomList(
        @RequestParam(value = "keyword", required = false) String keyword,
        @RequestParam(value = "region", required = false) String region,
        @RequestParam(value = "genre", required = false) String genre) {
        return service.roomList(keyword, region, genre);
    }

    @GetMapping("/myLikes")
    public List<Map<String, Object>> myLikeList(
        @RequestParam(value = "userId", required = false) String userId,
        @RequestParam(value = "keyword", required = false) String keyword,
        @RequestParam(value = "region", required = false) String region,
        @RequestParam(value = "genre", required = false) String genre) {
        return service.myLikeList(userId, keyword, region, genre);
    }

    @GetMapping("/myRecords")
    public List<Map<String, Object>> myRecordList(
        @RequestParam(value = "userId", required = false) String userId,
        @RequestParam(value = "keyword", required = false) String keyword,
        @RequestParam(value = "region", required = false) String region,
        @RequestParam(value = "genre", required = false) String genre) {
        return service.myRecordList(userId, keyword, region, genre);
    }

    @GetMapping("/newList")
    public List<Map<String, Object>> newList() {
        return service.newList();
    }
    
    @GetMapping("/rcmdList")
    public List<Map<String, Object>> rcmdList() {
        return service.rcmdList();
    }
    
    @GetMapping("/rankList")
    public List<Map<String, Object>> getRankList() {
        return service.getRankList();
    }

    @GetMapping("/detail/{id}")
    public Map<String, Object> getRoomDetail(@PathVariable("id") int id, HttpServletRequest request, @RequestHeader(value = "User-Id", required = false) String userId) {
        Map<String, Object> roomDetail = service.getRoomDetail(id);
        service.incViewCount(id);
        boolean isLiked = checkIfLiked(userId, id);
        roomDetail.put("isLiked", isLiked);
        return roomDetail;
    }
    
    @PostMapping("/submit")
    public void saveRoom(@RequestBody Map<String, Object> room) {
        Map<String, Object> map = new HashMap<>();
        
        // 문자열 필드
        map.put("themeNm", (String) room.get("THEME_NM"));
        map.put("roomNm", (String) room.get("ROOM_NM"));
        map.put("regionCd", (String) room.get("REGION_CD"));
        map.put("areaCd", (String) room.get("AREA_CD"));
        map.put("genreCd", (String) room.get("GENRE_CD"));
        map.put("content", (String) room.get("CONTENT"));
        map.put("site", (String) room.get("SITE"));
        map.put("imgPath", (String) room.get("IMG_PATH"));
        map.put("newTheme", (String) room.get("NEW_THEME"));
        map.put("rcmd", (String) room.get("RCMD"));
        map.put("price", (String) room.get("PRICE"));
        map.put("userId", (String) room.get("userId"));
        
        // 숫자 필드 처리
        map.put("minParty", (Integer) room.get("MIN_PARTY"));
        map.put("maxParty", (Integer) room.get("MAX_PARTY"));
        map.put("runTime", (Integer) room.get("RUN_TIME"));
        map.put("activiti", (Integer) room.get("ACTIVITY"));
        map.put("diviceRatio", (Integer) room.get("DEVICE_RATIO"));
        map.put("rating", (Double) room.get("RATING"));
        map.put("level", (Integer) room.get("LEVEL"));
        
        // 서비스 호출
        service.saveRoom(map);
    }
    
    @PutMapping("/update/{id}")
    public void updateRoom(@PathVariable("id") int id, @RequestBody Map<String, Object> room) {
        Map<String, Object> map = new HashMap<>();
        
        // 문자열 필드
        map.put("themeNm", (String) room.get("THEME_NM"));
        map.put("roomNm", (String) room.get("ROOM_NM"));
        map.put("regionCd", (String) room.get("REGION_CD"));
        map.put("areaCd", (String) room.get("AREA_CD"));
        map.put("genreCd", (String) room.get("GENRE_CD"));
        map.put("content", (String) room.get("CONTENT"));
        map.put("site", (String) room.get("SITE"));
        map.put("imgPath", (String) room.get("IMG_PATH"));
        map.put("newTheme", (String) room.get("NEW_THEME"));
        map.put("rcmd", (String) room.get("RCMD"));
        map.put("price", (String) room.get("PRICE"));
        map.put("userId", (String) room.get("userId"));
        
        // 숫자 필드 처리
        map.put("minParty", (Integer) room.get("MIN_PARTY"));
        map.put("maxParty", (Integer) room.get("MAX_PARTY"));
        map.put("runTime", (Integer) room.get("RUN_TIME"));
        map.put("activiti", (Integer) room.get("ACTIVITY"));
        map.put("diviceRatio", (Integer) room.get("DEVICE_RATIO"));
        map.put("rating", (Double) room.get("RATING"));
        map.put("level", (Integer) room.get("LEVEL"));
        
        // 서비스 호출
        service.updateRoom(id, map);
    }
    
    // 아이디어 삭제
    @DeleteMapping("/linkDelete/{id}")
    public void deleteLink(@PathVariable("id") int id) {
        service.deleteRoom(id);
    }
    
    private boolean checkIfLiked(String userId, int themeId) {
        return service.checkIfLiked(userId,themeId);
    }

    @PostMapping("/like/{id}")
    public ResponseEntity<String> addLikes(@PathVariable("id") int id, @RequestBody Map<String, String> request) {
        String userId = request.get("userId");
        if (userId != null && !userId.isEmpty() ) {
            service.addLikes(userId, id);
            return ResponseEntity.ok("Reaction added successfully.");
        } else {
            return ResponseEntity.badRequest().body("UserId is required.");
        }
    }

    @DeleteMapping("/like/{id}")
    public ResponseEntity<String> removeLikes(@PathVariable("id") int id, @RequestBody Map<String, String> request) {
        String userId = request.get("userId");
        if (userId != null && !userId.isEmpty() ) {
            service.removeLikes(userId, id);
            return ResponseEntity.ok("Reaction removeed successfully.");
        } else {
            return ResponseEntity.badRequest().body("UserId is required.");
        }
    }

    @PostMapping("/review")
    public ResponseEntity<String> submitReview(@RequestBody Map<String, Object> review) {
        Map<String, Object> map = new HashMap<>();
        
        map.put("userId", (String) review.get("userId"));
        map.put("themeId", (String) review.get("roomId"));
        map.put("content", (String) review.get("content"));
        map.put("rating", (Integer) review.get("rating"));
        map.put("playDate", review.get("playDate"));
        map.put("successFlag", (String) review.get("successFlag"));
        map.put("level", (Integer) review.get("difficulty"));
        map.put("leftTime", (String) review.get("leftTime")); // Ensure this matches your database schema

        service.saveReview(map); // You need to implement this in your service layer
        return ResponseEntity.ok("Review submitted successfully.");
    }

}
