package com.universestay.project.dto;

import lombok.*;

import java.sql.Timestamp;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode
@ToString
public class AlertRuleDto {

    private String alert_rule_name;
    private String alert_rule_to;
    private Timestamp alert_rule_send_time;
    private String alert_rule_booking_sts;
}
