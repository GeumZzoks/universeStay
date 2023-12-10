package com.universestay.project.common.config;

import org.quartz.spi.TriggerFiredBundle;
import org.springframework.beans.factory.config.AutowireCapableBeanFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.scheduling.quartz.AdaptableJobFactory;

// 스프링에서 Quartz 를 사용할 수 있도록 설정
public class QuartzJobFactory extends AdaptableJobFactory implements ApplicationContextAware {

    // 스프링 컨테이너에서 빈을 가져오기 위해 ApplicationContext 를 사용
    private ApplicationContext applicationContext;


    @Override
    public void setApplicationContext(ApplicationContext applicationContext) {
        this.applicationContext = applicationContext;
    }

    @Override
    protected Object createJobInstance(TriggerFiredBundle bundle) throws Exception {
        Object jobInstance = super.createJobInstance(bundle);
        // 생성된 jobInstance 에 빈을 주입
        autowireBean(jobInstance);
        return jobInstance;
    }

    //
    private void autowireBean(Object jobInstance) {
        AutowireCapableBeanFactory autowireCapableBeanFactory = applicationContext.getAutowireCapableBeanFactory();
        autowireCapableBeanFactory.autowireBean(jobInstance);
    }
}
