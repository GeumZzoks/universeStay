package com.universestay.project.common.config;

import com.universestay.project.admin.service.ReservationToEmailJob;
import lombok.RequiredArgsConstructor;
import org.quartz.JobDetail;
import org.quartz.Trigger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.scheduling.quartz.CronTriggerFactoryBean;
import org.springframework.scheduling.quartz.JobDetailFactoryBean;
import org.springframework.scheduling.quartz.SchedulerFactoryBean;

@RequiredArgsConstructor
@Configuration
public class QuartzConfig {

    @Autowired
    private ApplicationContext applicationContext;

    @Bean // 작업을 실행할 클래스 빈 등록
    public JobDetailFactoryBean reservationEmailJob() {
        JobDetailFactoryBean jobDetailFactory = new JobDetailFactoryBean();
        jobDetailFactory.setJobClass(ReservationToEmailJob.class);
        return jobDetailFactory;
    }

    @Bean // 작업을 실행할 주기 빈 등록
    public CronTriggerFactoryBean reservationEmailJobTrigger(JobDetail reservationEmailJob) {
        CronTriggerFactoryBean trigger = new CronTriggerFactoryBean();
        trigger.setJobDetail(reservationEmailJob);
        trigger.setCronExpression("0 0 0 * * ?"); // 매일 자정에 실행
        return trigger;
    }

    @Bean // 작업과 관련한 스케줄러 생성하는 빈 등록
    public SchedulerFactoryBean schedulerFactory(Trigger reservationEmailJobTrigger) {
        QuartzJobFactory quartzJobFactory = new QuartzJobFactory();
        quartzJobFactory.setApplicationContext(applicationContext);

        SchedulerFactoryBean schedulerFactory = new SchedulerFactoryBean();
        schedulerFactory.setJobFactory(quartzJobFactory);
        schedulerFactory.setTriggers(reservationEmailJobTrigger);
        return schedulerFactory;
    }
}
