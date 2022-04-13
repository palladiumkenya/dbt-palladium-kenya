SELECT 
    TOP(100)
    stg_Patients.PatientID,
    stg_Patients.PatientPK,
    stg_Patients.SiteCode,
    stg_Patients.Gender,
    stg_Patients.DOB
FROM 
{{ source('kehmis_staging_tables', 'stg_Patients') }} AS stg_Patients