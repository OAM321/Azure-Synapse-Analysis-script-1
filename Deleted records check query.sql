--- these queries were used to find records that were marked as deleted my the Azure deletion pipeline which identifies deleted records in the source Oracle database.
select count(1) from orasarah_apps.AP_INVOICE_DISTRIBUTIONS_ALL
where IsDeleted is null 
order by creation_date desc 


select count(1) from orasarah_apps.AP_INVOICE_DISTRIBUTIONS_ALL
where IsDeleted is null 
and convert(date,creation_date) <= convert(date,'12-JUL-2024')