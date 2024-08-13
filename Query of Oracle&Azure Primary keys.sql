							--Queries to find the missing Unique IDs using primary key identifiers in either Oracle EBS source or Synapse if records don't match
--Synapse:


SELECT ATTACHED_DOCUMENT_ID, convert(date, creation_date)
FROM orasarah_apps.FND_ATTACHED_DOCUMENTS
WHERE IsDeleted is null 
	And CONVERT(date, creation_date) >= '2024-05-10'
	AND CONVERT(date, creation_date) <= '2024-06-28'
ORDER BY creation_date DESC;
 
 select INVENTORY_ITEM_ID, organization_id, COST_TYPE_ID
from orasarah_apps.CST_ITEM_COSTS
WHERE convert(date,creation_date) = convert(date,'03-JUL-2024')
order by INVENTORY_ITEM_ID, organization_id, COST_TYPE_ID
 
select DELIVERY_DETAIL_ID
from orasarah_apps.WSH_DELIVERY_DETAILS
WHERE convert(date,creation_date) = convert(date,'12-JUL-2024')
order by DELIVERY_DETAIL_ID

--Oracle:
select INVOICE_DISTRIBUTION_ID, trunc(creation_date) from AP_INVOICE_DISTRIBUTIONS_ALL
where trunc(creation_date) <= to_date('26-JUN-2024')
order by creation_date desc


SELECT EXTENSION_ID, trunc(creation_date)
FROM EGO_MTL_SY_ITEMS_EXT_B
WHERE trunc(creation_date) >= to_date('28-APR-2024','DD-MON-YYYY')
  AND trunc(creation_date) <= to_date('17-JUN-2024','DD-MON-YYYY')
ORDER BY creation_date DESC;

select PRICE_ADJUSTMENT_ID
from apps.OE_PRICE_ADJUSTMENTS
WHERE trunc(creation_date) = to_date('31-MAY-2024','DD-MON-YYYY')
order by PRICE_ADJUSTMENT_ID


select * from AR_RECEIVABLE_APPLICATIONS_ALL
where trunc(creation_date) > trunc(sysdate) -365
order by trunc(creation_date) desc


select trunc(creation_date), count(1) from AP_CHECKS_ALL 
where trunc(creation_date) > trunc(sysdate) -365
group by trunc(creation_date)
order by trunc(creation_date) desc


 SELECT INVENTORY_ITEM_ID, trunc(creation_date)
FROM apps.CST_ITEM_COSTS
WHERE trunc(creation_date) >= to_date('01-MAR-2024','DD-MON-YYYY')
  AND trunc(creation_date) <= to_date('28-JUN-2024','DD-MON-YYYY')
ORDER BY creation_date DESC;

select count(*) from apps.CST_ITEM_COSTS
where trunc(creation_date) >= to_date('01-MAR-2024','DD-MON-YYYY')
 AND trunc(creation_date) <= to_date('28-JUN-2024','DD-MON-YYYY')

--Oracle EBS									--- to find counts by each day and compare count differences by day in Oracle source and Azure Synapse

select  trunc(creation_date), count(1)
from AP_INVOICE_DISTRIBUTIONS_ALL
where trunc(creation_date) <= to_date('26-JUN-2024','DD-MON-YYYY')
group by trunc(creation_date)
order by trunc(creation_date) desc

select trunc(creation_date), count(1)	
from apps.CST_ITEM_COSTS	
group by trunc(creation_date)	
order by trunc(creation_date) desc	



--Azure SYNAPSE


select  convert(date,creation_date), count(1) 
from orasarah_apps.AP_INVOICE_DISTRIBUTIONS_ALL
where IsDeleted is null 
and convert(date,creation_date) <= convert(date,'26-JUN-2024')
group by convert(date,creation_date)
order by convert(date,creation_date) desc

select convert(date,creation_date), count(1)
from orasarah_apps.CST_ITEM_COSTS
where IsDeleted is null
group by convert(date,creation_date)
order by convert(date,creation_date) desc
 
 

