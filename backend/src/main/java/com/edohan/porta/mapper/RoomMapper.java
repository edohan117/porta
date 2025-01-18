package com.edohan.porta.mapper;

import java.util.*;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface RoomMapper {
    List<Map<String, Object>> roomList(
        @Param("keyword") String keyword,
        @Param("region") String region,
        @Param("genre") String genre
    );
    List<Map<String, Object>> myLikeList(String userId, String keyword, String  region, String  genre);
    List<Map<String, Object>> myRecordList(String userId, String keyword, String  region, String  genre);
    List<Map<String, Object>> newList();
    List<Map<String, Object>> rcmdList();
    List<Map<String, Object>> getRankList();
    Map<String, Object> getRoomDetail(int id);
    List<Map<String, Object>> getRoomReviews(int roomId);
    void saveRoom(Map<String, Object> map);
    void updateRoom(int id, Map<String, Object> map);
    void deleteRoom(int id);
    void incViewCount(int id);
    Integer checkIfLiked(Map<String, Object> params);
    void addLikes(Map<String, Object> params);  // 반응 추가 또는 업데이트
    void removeLikes(Map<String, Object> params); // 반응 삭제
    void saveReview(Map<String, Object> params);
}
