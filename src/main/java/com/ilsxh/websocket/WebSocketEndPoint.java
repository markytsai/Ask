package com.ilsxh.websocket;

import com.ilsxh.redis.UserKey;
import com.ilsxh.service.RedisService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.socket.server.standard.SpringConfigurator;

import javax.servlet.http.HttpSession;
import javax.websocket.*;
import javax.websocket.server.ServerEndpoint;
import java.io.IOException;
import java.util.*;
import java.util.concurrent.ConcurrentHashMap;

/**
 * @author Tsaizhenya
 */
@ServerEndpoint(value = "/websocket", configurator = SpringConfigurator.class)
public class WebSocketEndPoint {

    @Autowired
    private RedisService redisService;

    public WebSocketEndPoint() {
    }

    /**
     * 与客户端的连接会话，需要通过它来给客户端发送数据
     */
    public Session session;
    public String tokenUserId;

    public static Map<String, List<Session>> clients = new ConcurrentHashMap<>();


    /**
     * 连接建立成功调用的方法
     *
     * @param session 可选的参数。session为与某个客户端的连接会话，需要通过它来给客户端发送数据
     */
    @OnOpen
    public void onOpen(Session session) {
        this.session = session;
        String tokenName = session.getRequestURI().getQuery().split("=")[1];
        this.tokenUserId = redisService.get(UserKey.loginUserKey, tokenName, String.class);
        if (clients.get(tokenUserId) == null) {
            clients.put(tokenUserId, new ArrayList<Session>());
        }
        clients.get(tokenUserId).add(this.session);
        System.out.println("有新连接加入！当前在线人数为" + clients.size());
    }

    /**
     * 连接关闭调用的方法
     */
    @OnClose
    public void onClose() {
        clients.get(tokenUserId).remove(this.session);
        System.out.println("有一连接关闭！当前在线人数为" + clients.size());
    }

    /**
     * 收到客户端消息后调用的方法
     *
     * @param message 客户端发送过来的消息
     * @param session 可选的参数
     */
    @OnMessage
    public void onMessage(String message, Session session) {
        System.out.println("来自客户端的消息:" + message);
    }

    /**
     * 发生错误时调用
     *
     * @param session
     * @param error
     */
    @OnError
    public void onError(Session session, Throwable error) {
        System.out.println("发生错误");
        clients.remove(session.getId(), session);
        error.printStackTrace();
    }

    /**
     * 这个方法与上面几个方法不一样。没有用注解，是根据自己需要添加的方法。
     *
     * @param message
     * @throws IOException
     */
    public void sendMessage(String userId, String message) throws IOException {

        //保存数据到数据库
        this.session.getBasicRemote().sendText(message);
        //this.session.getAsyncRemote().sendText(message);
    }

    /**
     * 发送给指定的用户ID，取出相同的token值
     *
     * @param messageTo
     * @param message
     */
    public static synchronized void sendAsynMessage(String messageTo, String message) {
        Set<Map.Entry<String, List<Session>>> set = clients.entrySet();
        for (Map.Entry<String, List<Session>> item : set) {
            if (item.getKey().equals(messageTo)) {
                System.out.println("发送了消息：" + message);
                item.getValue().forEach(session1 -> session1.getAsyncRemote().sendText(message));
            }
        }
    }
}
