package com.edohan.porta.mapper;

import java.util.*;

public interface PortaMapper {
    List<Map<String, Object>> portaList(String keyword, String  region, String  genre);
    List<Map<String, Object>> myLikeList(String userId, String keyword, String  region, String  genre);
    List<Map<String, Object>> myRecordList(String userId, String keyword, String  region, String  genre);
    List<Map<String, Object>> newList();
    List<Map<String, Object>> rcmdList();
    List<Map<String, Object>> getRankList();
    Map<String, Object> getPortaDetail(int id);
    void savePorta(Map<String, Object> map);
    void updatePorta(int id, Map<String, Object> map);
    void deletePorta(int id);
    void incViewCount(int id);
    Integer checkIfLiked(Map<String, Object> params);
    void addLikes(Map<String, Object> params);  // 반응 추가 또는 업데이트
    void removeLikes(Map<String, Object> params); // 반응 삭제
}
