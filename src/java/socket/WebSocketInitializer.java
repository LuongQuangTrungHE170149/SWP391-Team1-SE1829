/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package socket;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.websocket.server.ServerContainer;
import java.util.Set;
import jakarta.websocket.server.ServerContainer;

/**
 *
 * @author trand
 */
public class WebSocketInitializer implements jakarta.servlet.ServletContainerInitializer{

    @Override
    public void onStartup(Set<Class<?>> set, ServletContext sc) throws ServletException {
        ServerContainer serverContainer = (ServerContainer) sc.getAttribute("javax.websocket.server.ServerContainer");
        try {
            serverContainer.addEndpoint(NotificationWebSocket.class);
        } catch (Exception e) {
            throw  new ServletException(e);
        }
    }
    
}
