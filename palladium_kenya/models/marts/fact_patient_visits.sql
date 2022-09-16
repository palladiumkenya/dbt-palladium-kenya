select
    top(1000)
    stg_PatientVisits.VisitID,
    stg_PatientVisits.SiteCode,
    stg_PatientVisits.VisitDate,
    stg_PatientVisits.NextAppointmentDate,
    patients.patient_key
from 
{{ source('kehmis_staging_tables', 'stg_PatientVisits') }} as stg_PatientVisits
left join {{ ref('dim_patients') }}  as patients on patients.PatientID = stg_PatientVisits.PatientID
    and patients.PatientPK = stg_PatientVisits.PatientPK
    and patients.SiteCode = stg_PatientVisits.SiteCode