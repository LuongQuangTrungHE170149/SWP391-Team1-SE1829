/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package socket;

import Model.Notification;
import com.google.gson.Gson;
import dal.NotificationDAO;
import java.io.IOException;
import java.util.Collections;
import java.util.HashSet;
import java.util.Set;
import jakarta.websocket.OnClose;
import jakarta.websocket.OnMessage;
import jakarta.websocket.OnOpen;
import jakarta.websocket.Session;
import jakarta.websocket.server.PathParam;
import jakarta.websocket.server.ServerEndpoint;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 *
 * @author trand
 */
@ServerEndpoint(value = "/notifications/{userId}")
public class NotificationWebSocket {

    private static Map<String, Session> sessions = Collections.synchronizedMap(new HashMap<>());

    @OnOpen
    public void onOpen(Session session, @PathParam("userId") String userId) {
        System.out.println("WebSocket opened: " + userId);
        sessions.put(userId, session);
        NotificationDAO dbNotification = new NotificationDAO();
        if (userId != null) {
            List<Notification> notifications = dbNotification.findLast7NotifcationsByUserId(Integer.parseInt(userId));
            System.out.println("Send message");
            for (Notification notification : notifications) {
                NotificationWebSocket.sendMessageToUser(userId, notification);
            }
        }else{
            System.out.println(userId);
        }
    }

    @OnClose
    public void onClose(Session session, @PathParam("userId") String userId) {
        System.out.println("WebSocket closed: " + userId);
        sessions.remove(userId);
    }

    @OnMessage
    public void onMessage(String message, Session session, @PathParam("userId") String userId) {
        System.out.println("Message received from " + userId + ": " + message);
//        sendMessageToUser(userId, message);
    }

    public static void sendMessageToUser(String userId, Notification notification) {
        Session session = sessions.get(userId);
        if (session != null && session.isOpen()) {
            try {
                Gson gson = new Gson();
                session.getBasicRemote().sendText(gson.toJson(notification));
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }
}
