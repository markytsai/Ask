//package com.ilsxh.controller;
//
//import com.alibaba.fastjson.JSON;
//import com.alibaba.fastjson.JSONArray;
//import com.ilsxh.dao.TrainDao;
//import com.ilsxh.vo.UserQuestionVo;
//import com.ilsxh.vo.UserTopicVo;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.web.bind.annotation.RequestMapping;
//
//import java.util.*;
//
//@Controller
//public class TrainController {
//
//    @Autowired
//    private TrainDao trainDao;
//
//    @RequestMapping("/similarUser")
//    public void testUserSimilarity() {
//
//        String targetUserId = "aafe9be091e54773bb50bc93539f3328";
//        Set<String> retSet = this.getSimilarUserSet(2, targetUserId);
//        retSet.stream().forEach(x -> System.out.println("similar user number : " + x));
//
//        Map<String, Set<Integer>> userRecommendQuestionMap = new HashMap<>();
//
//        for (Iterator iterator = retSet.iterator(); iterator.hasNext(); ) {
//            String userId = (String) iterator.next();
//
//            // 计算得到用户感兴趣的话题
//            Set<Integer> set = this.getUserInterestedQuestions(userId);
//            userRecommendQuestionMap.put(targetUserId, set);
//            trainDao.insertUserRecommendQuestion(userId, JSONArray.toJSONString((set)));
//
//            for (Iterator iterator1 = set.iterator(); iterator1.hasNext(); ) {
//                System.out.print("similar question number : " + iterator1.next() + "  ");
//            }
//            System.out.println();
//        }
//    }
//
//    /**
//     * 通过矩阵计算，得到前topK的相似用户集合
//     * @param topK
//     * @param targetUserId
//     * @return
//     */
//    public Set<String> getSimilarUserSet(int topK, String targetUserId) {
//
//        List<UserTopicVo> list = trainDao.getAllUserTopic();
//        list.stream().forEach(x -> System.out.println(x.getId()));
//
//        // 通过set获取人数
//        Set<String> set = new HashSet<>();
//        for (UserTopicVo userTopicVo : list) {
//            set.add(userTopicVo.getUserId());
//        }
//        int userNum = set.size();
//        System.out.println("Total user number: " + set.size());
//
//        String[] userIds = new String[userNum];
//        int n = 0;
//        // 用户user_id 和 矩阵序号的 对照
//        Map<String, Integer> userIdSerialMap = new HashMap<>(userNum);
//        int serialNum = 0;
//        for (String s : set) {
//            userIdSerialMap.put(s, serialNum++);
//            userIds[n++] = s;
//        }
//
//        // 初始化关注集合<user_id对应的矩阵序号， 话题set>
//        Map<Integer, Set<Integer>> map = new HashMap<>();
//        for (Map.Entry<String, Integer> entry : userIdSerialMap.entrySet()) {
//            map.put(entry.getValue(), new HashSet<>());
//        }
//
//        // 遍历列表，按照user_id进行归类
//        for (UserTopicVo userTopicVo : list) {
//            map.get(userIdSerialMap.get(userTopicVo.getUserId())).add(userTopicVo.getTopicId());
//        }
//
//        // set size = 4
//        double[][] similarityMatrix = new double[userNum][userNum];
//        Set<Integer> result = new HashSet<Integer>();
//        for (int i = 0; i < userNum; i++) {
//            for (int j = i + 1; j < userNum; j++) {
//
//                result.clear();
//
//                Set setA = map.get(i);
//                int ASize = setA.size();
//                result.addAll(setA);
//
//                Set setB = map.get(j);
//                int BSize = setB.size();
//
//                result.retainAll(setB);
//
//                similarityMatrix[i][j] = result.size() / (Math.sqrt(ASize * BSize) * 1.0);
//            }
//        }
//
//        Arrays.sort(similarityMatrix[userIdSerialMap.get(targetUserId)]);
//        Set<String> retUsers = new HashSet<>();
//
//        for (int j = userNum - 1; j >= userNum - topK; j--) {
//            for (int i = 0; i < userNum; i++) {
//                if (similarityMatrix[userIdSerialMap.get(targetUserId)][i] == similarityMatrix[userIdSerialMap.get(targetUserId)][j]) {
//                    retUsers.add(userIds[i]);
//                }
//            }
//        }
//
//        return retUsers;
//    }
//
//    /**
//     * 返回用户强关注问题序号列表
//     *
//     * @param userId
//     * @return
//     */
//    public Set<Integer> getUserInterestedQuestions(String userId) {
//
//        List<UserQuestionVo> userQuestionVos1 = trainDao.getUserFollowQuestion(userId);
//        List<UserQuestionVo> userQuestionVos2 = trainDao.getUserCollectAnswer(userId);
//        List<UserQuestionVo> userQuestionVos3 = trainDao.getUserVoteUpAnswer(userId);
//
//        Set<Integer> setContainer1 = new HashSet<>();
//        userQuestionVos1.stream().forEach(x -> setContainer1.add(x.getQuestionId()));
//
//        Set<Integer> setContainer2 = new HashSet<>();
//        userQuestionVos2.stream().forEach(x -> setContainer2.add(x.getQuestionId()));
//
//        Set<Integer> setContainer3 = new HashSet<>();
//        userQuestionVos3.stream().forEach(x -> setContainer3.add(x.getQuestionId()));
//
//        Set<Integer> tempSet = new HashSet<>();
//        tempSet.addAll(setContainer1);
//        tempSet.retainAll(setContainer2);
//        tempSet.retainAll(setContainer3);
//
//        return tempSet;
//    }
//
//
//}
