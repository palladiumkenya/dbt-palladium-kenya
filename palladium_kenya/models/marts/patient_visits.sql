SELECT 
    TOP(100)
    stg_PatientVisits.SiteCode,
    stg_PatientVisits.VisitDate,
    stg_PatientVisits.NextAppointmentDate
FROM 
{{ source('kehmis_staging_tables', 'stg_PatientVisits') }} AS stg_PatientVisits