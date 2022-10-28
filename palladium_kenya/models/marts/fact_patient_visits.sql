{{
    config(
        materialized='incremental',
        unique_key='VisitID',
        incremental_strategy='merge'
    )
}}


select
    top(20000)
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

--{% if is_incremental() %}

  -- this filter will only be applied on an incremental run
 -- where VisitDate >= (select max(VisitDate) from {{ this }})

--{% endif %}