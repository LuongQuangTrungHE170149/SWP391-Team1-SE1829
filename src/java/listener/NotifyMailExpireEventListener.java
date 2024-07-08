/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package listener;

import jakarta.servlet.ServletContextEvent;
import jakarta.servlet.ServletContextListener;
import java.util.Timer;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;

/**
 *
 * @author trand
 */
public class NotifyMailExpireEventListener implements ServletContextListener {

    private Timer timer;
    private ScheduledExecutorService scheduler;

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        if(scheduler != null){
            scheduler.shutdown();
        }
    }

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        scheduler = Executors.newScheduledThreadPool(1);
        
        scheduler.scheduleAtFixedRate(new NotifyEmailExpiredTask(), 0, 1, TimeUnit.MINUTES);
    }

}
