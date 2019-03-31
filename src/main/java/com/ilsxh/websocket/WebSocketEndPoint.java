package com.ilsxh.websocket;

import org.springframework.web.socket.server.standard.SpringConfigurator;

import javax.websocket.*;
import javax.websocket.server.ServerEndpoint;
import java.io.IOException;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;

/**
 * @author Tsaizhenya
 */
@ServerEndpoint(value = "/websocket", configurator = SpringConfigurator.class)
public class WebSocketEndPoint {

    private static int onlineCounter = 0;

    public WebSocketEndPoint() {
    }

    /**
     * 与客户端的连接会话，需要通过它来给客户端发送数据
     */
    public Session session;

    public static Map<String, Session> clients = new ConcurrentHashMap<String, Session>();


    /**
     * 连接建立成功调用的方法
     *
     * @param session 可选的参数。session为与某个客户端的连接会话，需要通过它来给客户端发送数据
     */
    @OnOpen
    public void onOpen(Session session) {
        this.session = session;
        clients.put(session.getId(), session);
        System.out.println("有新连接加入！当前在线人数为" + clients.size());
    }

    /**
     * 连接关闭调用的方法
     */
    @OnClose
    public void onClose() {
        clients.remove(session.getId(), session);
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
    public void sendMessage(String message) throws IOException {
        //保存数据到数据库
        this.session.getBasicRemote().sendText(message);
        //this.session.getAsyncRemote().sendText(message);
    }

    public static synchronized void sendAsynMessage(String message) {
        Set<Map.Entry<String, Session>> set = clients.entrySet();
        for (Map.Entry<String, Session> item : set) {
            item.getValue().getAsyncRemote().sendText(message);
        }
    }
}
