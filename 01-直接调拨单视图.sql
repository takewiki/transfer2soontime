create or replace view tk_v_trans2so  as 
select 
o.fname as FSaleOrgName,
a.fid,
a.FBILLNO,
b.fname as FBillTypeName,
'已审核' as FBillCheckStatus,
a.FDATE,
'普通' as FTransferDirect,
d.fname as FSaleDeptName,
s.fname as FSaleManName,
ad.FDATAVALUE as FPreOrderContact
from T_STK_STKTRANSFERIN  a
inner join T_ORG_ORGANIZATIONS_L o  ---组织表
on a.FSALEORGID = o.FORGID
inner join T_BAS_BILLTYPE_L  b
on b.FBILLTYPEID=a.FBILLTYPEID
inner join T_BD_DEPARTMENT_L d
on d.FDEPTID = a.FSALEDEPTID
left join T_BD_OPERATORENTRY op
on a.FSALERID=op.FENTRYID
inner join T_BD_STAFF_L s
on op.FSTAFFID=s.FSTAFFID
left join T_BAS_ASSISTANTDATAENTRY_L ad
on a.F_PAEZ_ASSISTANT=ad.FENTRYID
where o.flocaleid=2052
and b.fbilltypeid='59ccaf279ce132'
and a.FDOCUMENTSTATUS='C'
and a.FTRANSFERDIRECT='GENERAL'
and d.FLOCALEID=2052
and  s.flocaleid=2052
and ad.FLOCALEID=2052;
