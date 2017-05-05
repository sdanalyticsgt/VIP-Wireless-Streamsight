#!/bin/ksh

summary_daily()
{
${SQLPLUS} -s dash/dash123@elixirdb << EOFEOF
set pages 0
set lines 1000
set trimspool on
set feedback off

prompt VIP CLuster,VIP Location,2G Call Setup Failure Rate %,2G Drop Call Rate %,2G Call Setup Time (sec),2G SMS Sending Success Rate %,2G SMS Sending Time (sec),3G Call Setup Failure Rate %,3G Drop Call Rate %,3G Call Setup Time (sec),3G SMS Sending Success Rate %,3G SMS Sending Time (sec),3G Web Browsing Success %,3G Web Browsing Time (sec),3G Video Streaming Success Rate %,3G Video Streaming Buffer Time (msec),3G HTTP Upload Throughput (kbits/s),3G HTTP Download Throughput (kbits/s),4G SMS Sending Success Rate %,4G SMS Sending Time (sec),4G Web Browsing Success %,4G Web Browsing Time (sec),4G Video Streaming Success Rate %,4G Video Streaming Buffer Time (msec),4G HTTP Upload Throughput (kbits/s),4G HTTP Download Throughput (kbits/s),2G RSSI(AVG),2G %Time -85dBm,3G RSSI(AVG),3G %Time -85dBm,4G RSSI(AVG),4G %Time -85dBm

select VIP_CLUSTER||','||VIP_LOCATION||','||
decode(sign(nvl(sum(SAMPLE_CNT_2G),0) - 30),-1,'Low Sample',round(sum(VOICE_CSFR_2G * SAMPLE_CNT_2G)/sum(SAMPLE_CNT_2G),3))||','||
decode(sign(nvl(sum(SAMPLE_CNT_2G),0) - 30),-1,'Low Sample',round(sum(VOICE_DROP_CALL_RATE_2G * SAMPLE_CNT_2G)/sum(SAMPLE_CNT_2G),3))||','||
decode(sign(nvl(sum(SAMPLE_CNT_2G),0) - 30),-1,'Low Sample',round(sum(VOICE_SETUP_TIME_2G * SAMPLE_CNT_2G)/(1000 * sum(SAMPLE_CNT_2G)),3))||','||
decode(sign(nvl(sum(SAMPLE_CNT_2G),0) - 30),-1,'Low Sample',round(sum(SMS_SUCCESS_RATE_2G * SAMPLE_CNT_2G)/sum(SAMPLE_CNT_2G),3))||','||
decode(sign(nvl(sum(SAMPLE_CNT_2G),0) - 30),-1,'Low Sample',round(sum(SMS_TRANSFER_TIME_2G * SAMPLE_CNT_2G)/(1000 * sum(SAMPLE_CNT_2G)),3))||','||
decode(sign(nvl(sum(SAMPLE_CNT_3G),0) - 30),-1,'Low Sample',round(sum(VOICE_CSFR_3G * SAMPLE_CNT_3G)/sum(SAMPLE_CNT_3G),3))||','||
decode(sign(nvl(sum(SAMPLE_CNT_3G),0) - 30),-1,'Low Sample',round(sum(VOICE_DROP_CALL_RATE_3G * SAMPLE_CNT_3G)/sum(SAMPLE_CNT_3G),3))||','||
decode(sign(nvl(sum(SAMPLE_CNT_3G),0) - 30),-1,'Low Sample',round(sum(VOICE_SETUP_TIME_3G * SAMPLE_CNT_3G)/(1000 * sum(SAMPLE_CNT_3G)),3))||','||
decode(sign(nvl(sum(SAMPLE_CNT_3G),0) - 30),-1,'Low Sample',round(sum(SMS_SUCCESS_RATE_3G * SAMPLE_CNT_3G)/sum(SAMPLE_CNT_3G),3))||','||
decode(sign(nvl(sum(SAMPLE_CNT_3G),0) - 30),-1,'Low Sample',round(sum(SMS_TRANSFER_TIME_3G * SAMPLE_CNT_3G)/(1000 * sum(SAMPLE_CNT_3G)),3))||','||
decode(sign(nvl(sum(SAMPLE_CNT_3G),0) - 30),-1,'Low Sample',round(sum(WEB_SUCCESS_RATE_3G * SAMPLE_CNT_3G)/sum(SAMPLE_CNT_3G),3))||','||
decode(sign(nvl(sum(SAMPLE_CNT_3G),0) - 30),-1,'Low Sample',round(sum(WEB_SESSION_TIME_3G * SAMPLE_CNT_3G)/(1000 * sum(SAMPLE_CNT_3G)),3))||','||
decode(sign(nvl(sum(SAMPLE_CNT_3G),0) - 30),-1,'Low Sample',round(sum(WEB_STREAM_SUCCESS_RATE_3G * SAMPLE_CNT_3G)/sum(SAMPLE_CNT_3G),3))||','||
decode(sign(nvl(sum(SAMPLE_CNT_3G),0) - 30),-1,'Low Sample',round(sum(STREAM_BUFF_TIME_3G * SAMPLE_CNT_3G)/sum(SAMPLE_CNT_3G),3))||','||
decode(sign(nvl(sum(SAMPLE_CNT_3G),0) - 30),-1,'Low Sample',round(sum(HTTP_UL_TPUT_3G * SAMPLE_CNT_3G)/sum(SAMPLE_CNT_3G),3))||','||
decode(sign(nvl(sum(SAMPLE_CNT_3G),0) - 30),-1,'Low Sample',round(sum(HTTP_DL_TPUT_3G * SAMPLE_CNT_3G)/sum(SAMPLE_CNT_3G),3))||','||
decode(sign(nvl(sum(SAMPLE_CNT_4G),0) - 30),-1,'Low Sample',round(sum(SMS_SUCCESS_RATE_4G * SAMPLE_CNT_4G)/sum(SAMPLE_CNT_4G),3))||','||
decode(sign(nvl(sum(SAMPLE_CNT_4G),0) - 30),-1,'Low Sample',round(sum(SMS_TRANSFER_TIME_4G * SAMPLE_CNT_4G)/(1000 * sum(SAMPLE_CNT_4G)),3))||','||
decode(sign(nvl(sum(SAMPLE_CNT_4G),0) - 30),-1,'Low Sample',round(sum(WEB_SUCCESS_RATE_4G * SAMPLE_CNT_4G)/sum(SAMPLE_CNT_4G),3))||','||
decode(sign(nvl(sum(SAMPLE_CNT_4G),0) - 30),-1,'Low Sample',round(sum(WEB_SESSION_TIME_4G * SAMPLE_CNT_4G)/(1000 * sum(SAMPLE_CNT_4G)),3))||','||
decode(sign(nvl(sum(SAMPLE_CNT_4G),0) - 30),-1,'Low Sample',round(sum(WEB_STREAM_SUCCESS_RATE_4G * SAMPLE_CNT_4G)/sum(SAMPLE_CNT_4G),3))||','||
decode(sign(nvl(sum(SAMPLE_CNT_4G),0) - 30),-1,'Low Sample',round(sum(STREAM_BUFF_TIME_4G * SAMPLE_CNT_4G)/sum(SAMPLE_CNT_4G),3))||','||
decode(sign(nvl(sum(SAMPLE_CNT_4G),0) - 30),-1,'Low Sample',round(sum(HTTP_UL_TPUT_4G * SAMPLE_CNT_4G)/sum(SAMPLE_CNT_4G),3))||','||
decode(sign(nvl(sum(SAMPLE_CNT_4G),0) - 30),-1,'Low Sample',round(sum(HTTP_DL_TPUT_4G * SAMPLE_CNT_4G)/sum(SAMPLE_CNT_4G),3))||','||
round(sum(AVG_RSSI_2G * SAMPLE_CNT_2G)/sum(SAMPLE_CNT_2G),3)||','||round((sum(GOOD_RSSI_CNT_2G) * 100)/sum(SAMPLE_CNT_2G),3)||','||
round(sum(AVG_RSSI_3G * SAMPLE_CNT_3G)/sum(SAMPLE_CNT_3G),3)||','||round((sum(GOOD_RSSI_CNT_3G) * 100)/sum(SAMPLE_CNT_3G),3)||','||
round(sum(AVG_RSSI_4G * SAMPLE_CNT_4G)/sum(SAMPLE_CNT_4G),3)||','||round((sum(GOOD_RSSI_CNT_4G) * 100)/sum(SAMPLE_CNT_4G),3)
from V3D_VIP_KPI_SUMMARY_VIEW
where timestamp >= (select max(timestamp)-28 from V3D_VIP_KPI_SUMMARY_VIEW)
and CATEGORY='CAMPAIGN_DAILY'
group by VIP_CLUSTER,VIP_LOCATION,CATEGORY
order by 1;

exit;

EOFEOF
}

summary_bh()
{
${SQLPLUS} -s dash/dash123@elixirdb << EOFEOF
set pages 0
set lines 1000
set trimspool on
set feedback off

prompt VIP CLuster,VIP Location,2G Call Setup Failure Rate %,2G Drop Call Rate %,2G Call Setup Time (sec),2G SMS Sending Success Rate %,2G SMS Sending Time (sec),3G Call Setup Failure Rate %,3G Drop Call Rate %,3G Call Setup Time (sec),3G SMS Sending Success Rate %,3G SMS Sending Time (sec),3G Web Browsing Success %,3G Web Browsing Time (sec),3G Video Streaming Success Rate %,3G Video Streaming Buffer Time (msec),3G HTTP Upload Throughput (kbits/s),3G HTTP Download Throughput (kbits/s),4G SMS Sending Success Rate %,4G SMS Sending Time (sec),4G Web Browsing Success %,4G Web Browsing Time (sec),4G Video Streaming Success Rate %,4G Video Streaming Buffer Time (msec),4G HTTP
Upload Throughput (kbits/s),4G HTTP Download Throughput (kbits/s),2G RSSI(AVG),2G %Time -85dBm,3G RSSI(AVG),3G %Time -85dBm,4G RSSI(AVG),4G %Time -85dBm

select VIP_CLUSTER||','||VIP_LOCATION||','||
decode(sign(nvl(sum(SAMPLE_CNT_2G),0) - 30),-1,'Low Sample',round(sum(VOICE_CSFR_2G * SAMPLE_CNT_2G)/sum(SAMPLE_CNT_2G),3))||','||
decode(sign(nvl(sum(SAMPLE_CNT_2G),0) - 30),-1,'Low Sample',round(sum(VOICE_DROP_CALL_RATE_2G * SAMPLE_CNT_2G)/sum(SAMPLE_CNT_2G),3))||','||
decode(sign(nvl(sum(SAMPLE_CNT_2G),0) - 30),-1,'Low Sample',round(sum(VOICE_SETUP_TIME_2G * SAMPLE_CNT_2G)/(1000 * sum(SAMPLE_CNT_2G)),3))||','||
decode(sign(nvl(sum(SAMPLE_CNT_2G),0) - 30),-1,'Low Sample',round(sum(SMS_SUCCESS_RATE_2G * SAMPLE_CNT_2G)/sum(SAMPLE_CNT_2G),3))||','||
decode(sign(nvl(sum(SAMPLE_CNT_2G),0) - 30),-1,'Low Sample',round(sum(SMS_TRANSFER_TIME_2G * SAMPLE_CNT_2G)/(1000 * sum(SAMPLE_CNT_2G)),3))||','||
decode(sign(nvl(sum(SAMPLE_CNT_3G),0) - 30),-1,'Low Sample',round(sum(VOICE_CSFR_3G * SAMPLE_CNT_3G)/sum(SAMPLE_CNT_3G),3))||','||
decode(sign(nvl(sum(SAMPLE_CNT_3G),0) - 30),-1,'Low Sample',round(sum(VOICE_DROP_CALL_RATE_3G * SAMPLE_CNT_3G)/sum(SAMPLE_CNT_3G),3))||','||
decode(sign(nvl(sum(SAMPLE_CNT_3G),0) - 30),-1,'Low Sample',round(sum(VOICE_SETUP_TIME_3G * SAMPLE_CNT_3G)/(1000 * sum(SAMPLE_CNT_3G)),3))||','||
decode(sign(nvl(sum(SAMPLE_CNT_3G),0) - 30),-1,'Low Sample',round(sum(SMS_SUCCESS_RATE_3G * SAMPLE_CNT_3G)/sum(SAMPLE_CNT_3G),3))||','||
decode(sign(nvl(sum(SAMPLE_CNT_3G),0) - 30),-1,'Low Sample',round(sum(SMS_TRANSFER_TIME_3G * SAMPLE_CNT_3G)/(1000 * sum(SAMPLE_CNT_3G)),3))||','||
decode(sign(nvl(sum(SAMPLE_CNT_3G),0) - 30),-1,'Low Sample',round(sum(WEB_SUCCESS_RATE_3G * SAMPLE_CNT_3G)/sum(SAMPLE_CNT_3G),3))||','||
decode(sign(nvl(sum(SAMPLE_CNT_3G),0) - 30),-1,'Low Sample',round(sum(WEB_SESSION_TIME_3G * SAMPLE_CNT_3G)/(1000 * sum(SAMPLE_CNT_3G)),3))||','||
decode(sign(nvl(sum(SAMPLE_CNT_3G),0) - 30),-1,'Low Sample',round(sum(WEB_STREAM_SUCCESS_RATE_3G * SAMPLE_CNT_3G)/sum(SAMPLE_CNT_3G),3))||','||
decode(sign(nvl(sum(SAMPLE_CNT_3G),0) - 30),-1,'Low Sample',round(sum(STREAM_BUFF_TIME_3G * SAMPLE_CNT_3G)/sum(SAMPLE_CNT_3G),3))||','||
decode(sign(nvl(sum(SAMPLE_CNT_3G),0) - 30),-1,'Low Sample',round(sum(HTTP_UL_TPUT_3G * SAMPLE_CNT_3G)/sum(SAMPLE_CNT_3G),3))||','||
decode(sign(nvl(sum(SAMPLE_CNT_3G),0) - 30),-1,'Low Sample',round(sum(HTTP_DL_TPUT_3G * SAMPLE_CNT_3G)/sum(SAMPLE_CNT_3G),3))||','||
decode(sign(nvl(sum(SAMPLE_CNT_4G),0) - 30),-1,'Low Sample',round(sum(SMS_SUCCESS_RATE_4G * SAMPLE_CNT_4G)/sum(SAMPLE_CNT_4G),3))||','||
decode(sign(nvl(sum(SAMPLE_CNT_4G),0) - 30),-1,'Low Sample',round(sum(SMS_TRANSFER_TIME_4G * SAMPLE_CNT_4G)/(1000 * sum(SAMPLE_CNT_4G)),3))||','||
decode(sign(nvl(sum(SAMPLE_CNT_4G),0) - 30),-1,'Low Sample',round(sum(WEB_SUCCESS_RATE_4G * SAMPLE_CNT_4G)/sum(SAMPLE_CNT_4G),3))||','||
decode(sign(nvl(sum(SAMPLE_CNT_4G),0) - 30),-1,'Low Sample',round(sum(WEB_SESSION_TIME_4G * SAMPLE_CNT_4G)/(1000 * sum(SAMPLE_CNT_4G)),3))||','||
decode(sign(nvl(sum(SAMPLE_CNT_4G),0) - 30),-1,'Low Sample',round(sum(WEB_STREAM_SUCCESS_RATE_4G * SAMPLE_CNT_4G)/sum(SAMPLE_CNT_4G),3))||','||
decode(sign(nvl(sum(SAMPLE_CNT_4G),0) - 30),-1,'Low Sample',round(sum(STREAM_BUFF_TIME_4G * SAMPLE_CNT_4G)/sum(SAMPLE_CNT_4G),3))||','||
decode(sign(nvl(sum(SAMPLE_CNT_4G),0) - 30),-1,'Low Sample',round(sum(HTTP_UL_TPUT_4G * SAMPLE_CNT_4G)/sum(SAMPLE_CNT_4G),3))||','||
decode(sign(nvl(sum(SAMPLE_CNT_4G),0) - 30),-1,'Low Sample',round(sum(HTTP_DL_TPUT_4G * SAMPLE_CNT_4G)/sum(SAMPLE_CNT_4G),3))||','||
round(sum(AVG_RSSI_2G * SAMPLE_CNT_2G)/sum(SAMPLE_CNT_2G),3)||','||round((sum(GOOD_RSSI_CNT_2G) * 100)/sum(SAMPLE_CNT_2G),3)||','||
round(sum(AVG_RSSI_3G * SAMPLE_CNT_3G)/sum(SAMPLE_CNT_3G),3)||','||round((sum(GOOD_RSSI_CNT_3G) * 100)/sum(SAMPLE_CNT_3G),3)||','||
round(sum(AVG_RSSI_4G * SAMPLE_CNT_4G)/sum(SAMPLE_CNT_4G),3)||','||round((sum(GOOD_RSSI_CNT_4G) * 100)/sum(SAMPLE_CNT_4G),3)
from V3D_VIP_KPI_SUMMARY_VIEW
where timestamp >= (select max(timestamp)-28 from V3D_VIP_KPI_SUMMARY_VIEW)
and CATEGORY='CAMPAIGN_BH'
group by VIP_CLUSTER,VIP_LOCATION,CATEGORY
order by 1;

exit;

EOFEOF
}



petsa()
{
sqlplus -s dash/dash123@elixirdb << EOFEOF
set pages 0
set lines 1000
set trimspool on

select 'DAYNO:'||to_char(max(timestamp)-28,'YYYY-IW')||'_to_'||to_char(max(timestamp),'YYYY-IW') from V3D_VIP_KPI_SUMMARY_VIEW;

exit;

EOFEOF
}


#MAIN
PROFILE=/export/home/oracle/.profile
. $PROFILE

BASE_DIR=/apps/DASHBOARD/REPORTS
CONFIG=${BASE_DIR}/config
BIN=${BASE_DIR}/bin
ALARM=${BASE_DIR}/alarm
LOG=${BASE_DIR}/logs
DATA=${BASE_DIR}/data
SQLLDR=/export/home/oracle/product/11g/bin/sqlldr
SQLPLUS=/export/home/oracle/product/11g/bin/sqlplus
ouser=dash
opass=dash123

BODY=${BASE_DIR}/config/V3D_VIP_perf_report_body.txt
EMAIL_LIST=${BASE_DIR}/config/V3D_VIP_perf_report_list.txt
SENDER=elixir@globe.com.ph
HEADER=${BASE_DIR}/config/V3D_VIP_perf_report_header.cfg
TRAILER=${BASE_DIR}/config/V3D_VIP_perf_report_trailer.cfg
REPORT=${BASE_DIR}/REPORT_FILES/VIP
deyt=`date "+%Y%m%d"`
petsa=`petsa | grep DAYNO | cut -f 2 -d :`
SUBJECT=`echo "V3D VIP Performance Campaign Report for WEEK  ${petsa}" | sed -e 's/_to_/ to /g'`
ATTACH=${REPORT}/v3d_vip_perf_campaign_report_${petsa}.tar.gz

echo "`date` Processing..."
summary_daily >  ${REPORT}/V3D_VIP_perf_summary_DAILY_campaign_report_${petsa}.csv
summary_bh > ${REPORT}/V3D_VIP_perf_summary_BH_campaign_report_${petsa}.csv

cat ${HEADER} ${TRAILER} > ${BODY}

cd ${REPORT}
tar cvf v3d_vip_perf_campaign_report_${petsa}.tar V3D_VIP_perf_summary_DAILY_campaign_report_${petsa}.csv V3D_VIP_perf_summary_BH_campaign_report_${petsa}.csv

gzip -f ${REPORT}/v3d_vip_perf_campaign_report_${petsa}.tar

#EMAIL DATA

#DEBUG
#echo "/apps/EMAIL/bin/email2.ksh ${SENDER} ${EMAIL_LIST} ${BODY} "${SUBJECT}" ${ATTACH}"


/apps/EMAIL/bin/email.ksh ${SENDER} ${EMAIL_LIST} ${BODY} "${SUBJECT}" ${ATTACH}

rm -f ${REPORT}/V3D_VIP_perf_summary_DAILY_campaign_report_${petsa}.csv ${REPORT}/V3D_VIP_perf_summary_BH_campaign_report_${petsa}.csv

echo "`date` Done..."

#END PROGRAM
