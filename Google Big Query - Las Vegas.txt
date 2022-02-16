SELECT 
Connection_Start,
Location_City,
Connection_ServiceProviderBrandName,
Device_Model,
Connection_Technology,
Connection_Band,
Location_Latitude,
Location_Longitude,
Connection_ENodeBID,
QOS_RSRP,
QOS_RSRQ,
QOS_SignalStrength,
QOS_SignalLevel,
QOS_DownloadThroughput,
QOS_CQI,
Device_5GCapable,
QOS_NewRadioFrequencyRange,
QOS_DeltaTransmittedBytes,
QOS_DeltaReceivedBytes,
QOS_TA
FROM
  `reportdataexternal-nokia.Nokia.rawResults_USA_Sept_to_Dec_2021`
WHERE Location_Latitude >  35.86 AND   Location_Latitude < 36.35 AND   Location_Longitude > -115.40 AND   Location_Longitude < -114.53
AND Connection_Start > TIMESTAMP ('2021-09-01') AND Connection_Start < TIMESTAMP ('2021-09-31')
AND Connection_Start is not null
AND Connection_ServiceProviderBrandName is not null 
AND Connection_Band is not null 
AND Location_Latitude is not null 
AND Location_Longitude is not null 
AND QOS_RSRP is not null

RawResults_LasVegas_JosephKang_Sep2021
