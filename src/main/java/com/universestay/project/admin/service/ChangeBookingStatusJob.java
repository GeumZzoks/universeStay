package com.universestay.project.admin.service;

import com.universestay.project.user.service.MyBookingService;
import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class ChangeBookingStatusJob implements Job {

    @Autowired
    MyBookingService myBookingService;


    @Override
    public void execute(JobExecutionContext jobExecutionContext) throws JobExecutionException {
        try {
            myBookingService.updateBookingStatus();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
