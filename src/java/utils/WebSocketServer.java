///*
// * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
// * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
// */
//package utils;
//
///**
// *
// * @author thuhu
// */
//import jakarta.websocket.OnClose;
//import jakarta.websocket.OnMessage;
//import jakarta.websocket.OnOpen;
//import jakarta.websocket.Session;
//import jakarta.websocket.server.ServerEndpoint;
//import java.io.IOException;
//import java.util.Collections;
//import java.util.HashSet;
//import java.util.Set;
//
//@ServerEndpoint("/chat")
//public class WebSocketServer {
//
//    private static Set<Session> clients = Collections.synchronizedSet(new HashSet<>());
//    
//    @OnOpen
//    public void onOpen(Session session){
//        clients.add(session);
//    }
//    @OnClose
//    public void onClose(Session session){
//        clients.remove(session);
//    }
//    
//    @OnMessage
//    public void onMessage(String message, Session session) throws IOException{
//        synchronized (clients) {
//            for(Session client : clients){
//                if(!client.equals(session)){
//                    client.getBasicRemote().sendText(message);
//                }
//            }
//        }
//    }
//}
