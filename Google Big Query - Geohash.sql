SELECT
 -- Date,
-- Location_Country,
--  Connection_ServiceProviderBrandName,
--  Connection_GenerationCategory,
  Location_Geohash8,
  Connection_ServiceProviderBrandName,
  -- Calculations
  AVG_Location_Latitude,
  AVG_Location_Longitude,
 
  COUNT_Records,
  AVG_QOS_RSRP,
  AVG_QOS_RSRQ,
  AVG_QOS_DownloadThroughput,
  COUNT_QOS_DownloadThroughput,
  SUM_QOS_DeltaTransmittedBytes,
  SUM_QOS_DeltaReceivedBytes,
 
FROM (
  SELECT
    -- Connection_ServiceProviderBrandName,
    -- Connection_GenerationCategory,
    Location_Geohash8,
    Connection_ServiceProviderBrandName,
    -- Calculations
    AVG(Location_Latitude) AS AVG_Location_Latitude,
    AVG(Location_Longitude) AS AVG_Location_Longitude,
    COUNT(Location_Latitude) AS COUNT_Records,
    AVG(QOS_RSRP) AS AVG_QOS_RSRP,
    AVG(QOS_RSRP) AS AVG_QOS_RSRQ,
    AVG(QOS_DownloadThroughput) AS AVG_QOS_DownloadThroughput,
    COUNT(QOS_DownloadThroughput) AS COUNT_QOS_DownloadThroughput,
    SUM(QOS_DeltaTransmittedBytes) AS SUM_QOS_DeltaTransmittedBytes,
    SUM(QOS_DeltaReceivedBytes) AS SUM_QOS_DeltaReceivedBytes,
  
  FROM (
    SELECT
Location_Geohash8,
Connection_Start,
Location_Country,
Location_City,
Connection_CID,
Connection_ServiceProviderBrandName,
Device_Model,
Connection_Technology,
Connection_Band,
Location_Latitude,
Location_Longitude,
Connection_ENodeBID,
Location_VerticalAccuracy,
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
QOS_NewRadioEnDCState
    FROM
     `reportdataexternal-nokia.Standard_US_Asia.SaudiArabia`
WHERE Connection_Start > TIMESTAMP ('2020-12-01') AND Connection_Start < TIMESTAMP ('2021-02-01')
  GROUP BY
    Location_Geohash8,
    Connection_ServiceProviderBrandName )
ORDER BY
  Location_Geohash8 ASC