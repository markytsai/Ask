package com.ilsxh.recommend.util;

import com.ilsxh.vo.UserTopicVo;

import java.util.*;

public class SimilarUserUtil {

    /**
     * 通过矩阵计算，得到前topK的相似用户集合
     * @param topK
     * @param targetUserId
     * @return
     */
    public static Set<String> getSimilarUserSet(List<UserTopicVo> list, int topK, String targetUserId) {


        list.stream().forEach(x -> System.out.println(x.getId()));

        // 通过set获取人数
        Set<String> set = new HashSet<>();
        for (UserTopicVo userTopicVo : list) {
            set.add(userTopicVo.getUserId());
        }
        int userNum = set.size();
        System.out.println("Total user number: " + set.size());

        String[] userIds = new String[userNum];
        int n = 0;
        // 用户user_id 和 矩阵序号的 对照
        Map<String, Integer> userIdSerialMap = new HashMap<>(userNum);
        int serialNum = 0;
        for (String s : set) {
            userIdSerialMap.put(s, serialNum++);
            userIds[n++] = s;
        }

        // 初始化关注集合<user_id对应的矩阵序号， 话题set>
        Map<Integer, Set<Integer>> map = new HashMap<>();
        for (Map.Entry<String, Integer> entry : userIdSerialMap.entrySet()) {
            map.put(entry.getValue(), new HashSet<>());
        }

        // 遍历列表，按照user_id进行归类
        for (UserTopicVo userTopicVo : list) {
            map.get(userIdSerialMap.get(userTopicVo.getUserId())).add(userTopicVo.getTopicId());
        }

        // set size = 4
        double[][] similarityMatrix = new double[userNum][userNum];
        Set<Integer> result = new HashSet<Integer>();
        for (int i = 0; i < userNum; i++) {
            for (int j = i + 1; j < userNum; j++) {

                result.clear();

                Set setA = map.get(i);
                int ASize = setA.size();
                result.addAll(setA);

                Set setB = map.get(j);
                int BSize = setB.size();

                result.retainAll(setB);

                similarityMatrix[i][j] = result.size() / (Math.sqrt(ASize * BSize) * 1.0);
            }
        }

        Arrays.sort(similarityMatrix[userIdSerialMap.get(targetUserId)]);
        Set<String> retUsers = new HashSet<>();

        for (int j = userNum - 1; j >= userNum - topK; j--) {
            for (int i = 0; i < userNum; i++) {
                if (similarityMatrix[userIdSerialMap.get(targetUserId)][i] == similarityMatrix[userIdSerialMap.get(targetUserId)][j]) {
                    retUsers.add(userIds[i]);
                }
            }
        }

        return retUsers;
    }
}
