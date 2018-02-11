-- Update tb_htms_transprice_dty d Set d.factoryid = (Select f.factoryid From tb_htms_factory f Where d.str3= f.factoryname );

-- Update tb_htms_transprice_dty d Set d.productid = (Select f.productid From tb_htms_product f Where d.str4= f.productname );
/*

Update tb_htms_transprice_dty d Set  pricestart= Trim(str6),priceend=Trim(str7),customerprice=Trim(str9),carrierprice=Trim(str8),
priceunit=24,pricetype=6,freightmodel=1 ,validatedate ='2018-01-02'
Where str5='按单价';

Update tb_htms_transprice_dty d Set  pricestart= Trim(str6),priceend=Trim(str7),customeroneprice=Trim(str9),carrieroneprice=Trim(str8),
priceunit=24,pricetype=6,freightmodel=2 ,validatedate ='2018-01-02'
Where str5='一口价';


Update tb_htms_transprice_dty  d Set  d.areacode1= (Select areacode From tb_htms_area a Where   a.areaname=d.str1)，
                                      d.areacname1= (Select areaname From tb_htms_area a Where   a.areaname=d.str1)，
                                      d.areaid1= (Select areaid From tb_htms_area a Where   a.areaname=d.str1)
                                      where d.areaid1 is null ;
                                      
Update tb_htms_transprice_dty  d Set  d.areacode1= (Select areacode From tb_htms_area a Where   a.areaname=d.str1||'省')，
                                      d.areacname1= (Select areaname From tb_htms_area a Where   a.areaname=d.str1||'省')，
                                      d.areaid1= (Select areaid From tb_htms_area a Where   a.areaname=d.str1||'省')
                                        where d.areaid1 is null ;

Update tb_htms_transprice_dty  d Set  d.areacode1= (Select areacode From tb_htms_area a Where   a.areaname=d.str1||'市')，
                                      d.areacname1= (Select areaname From tb_htms_area a Where   a.areaname=d.str1||'市')，
                                      d.areaid1= (Select areaid From tb_htms_area a Where   a.areaname=d.str1||'市')
                                      where d.areaid1 is null ;                                        
                                        
Update tb_htms_transprice_dty  d Set  d.areacode1= (Select areacode From tb_htms_area a Where   a.areaname=d.str1||'区')，
                                      d.areacname1= (Select areaname From tb_htms_area a Where   a.areaname=d.str1||'区')，
                                      d.areaid1= (Select areaid From tb_htms_area a Where   a.areaname=d.str1||'区')
                                        where d.areaid1 is null 
 
Update tb_htms_transprice_dty  d Set  d.areacode2 = (Select areacode From tb_htms_area a Where   a.areaname=d.str2 And areacode Like d.areacode1||'%')，
                                      d.areacname2 = (Select areaname From tb_htms_area a Where   a.areaname=d.str2 And areacode Like d.areacode1||'%')，
                                      d.areaid2 = (Select areaid From tb_htms_area a Where   a.areaname=d.str2 And areacode Like d.areacode1||'%')
                                      where d.areaid2 is null  And str2 Is not Null ;

 Update tb_htms_transprice_dty  d Set  d.areacode2 = (Select areacode From tb_htms_area a Where   a.areaname=d.str2||'市' And areacode Like d.areacode1||'%')，
                                      d.areacname2 = (Select areaname From tb_htms_area a Where   a.areaname=d.str2||'市' And areacode Like d.areacode1||'%')，
                                      d.areaid2 = (Select areaid From tb_htms_area a Where   a.areaname=d.str2||'市' And areacode Like d.areacode1||'%')
                                      where  d.areaid2 is null  And str2 Is not Null ;
                                      
                                      
 Update tb_htms_transprice_dty  d Set  d.areacode2 = (Select areacode From tb_htms_area a Where   a.areaname=d.str2||'镇' And areacode Like d.areacode1||'%')，
                                      d.areacname2 = (Select areaname From tb_htms_area a Where   a.areaname=d.str2||'镇' And areacode Like d.areacode1||'%')，
                                      d.areaid2 = (Select areaid From tb_htms_area a Where   a.areaname=d.str2||'镇' And areacode Like d.areacode1||'%')
                                      where d.areaid2 is null  And str2 Is not Null ;

 Update tb_htms_transprice_dty  d Set  d.areacode2 = (Select areacode From tb_htms_area a Where   a.areaname=d.str2||'区' And areacode Like d.areacode1||'%')，
                                      d.areacname2 = (Select areaname From tb_htms_area a Where   a.areaname=d.str2||'区' And areacode Like d.areacode1||'%')，
                                      d.areaid2 = (Select areaid From tb_htms_area a Where   a.areaname=d.str2||'区' And areacode Like d.areacode1||'%')
                                      where d.areaid2 is null  And str2 Is not Null ;
                                      
 Update tb_htms_transprice_dty  d Set  d.areacode2 = (Select areacode From tb_htms_area a Where   a.areaname=d.str2||'县' And areacode Like d.areacode1||'%')，
                                      d.areacname2 = (Select areaname From tb_htms_area a Where   a.areaname=d.str2||'县' And areacode Like d.areacode1||'%')，
                                      d.areaid2 = (Select areaid From tb_htms_area a Where   a.areaname=d.str2||'县' And areacode Like d.areacode1||'%')
                                      where d.areaid2 is null  And str2 Is not Null ;
                                      
 Update tb_htms_transprice_dty  d Set  d.areacode2 = (Select areacode From tb_htms_area a Where   a.areaname=d.str2||'街道' And areacode Like d.areacode1||'%')，
                                      d.areacname2 = (Select areaname From tb_htms_area a Where   a.areaname=d.str2||'街道' And areacode Like d.areacode1||'%')，
                                      d.areaid2 = (Select areaid From tb_htms_area a Where   a.areaname=d.str2||'街道' And areacode Like d.areacode1||'%')
                                      where d.areaid2 is null  And str2 Is not Null ;
 
  Update tb_htms_transprice_dty  d Set  d.areacode2 = (Select areacode From tb_htms_area a Where   a.areaname=d.str2 And areacode Like d.areacode1||'%')，
                                      d.areacname2 = (Select areaname From tb_htms_area a Where   a.areaname=d.str2 And areacode Like d.areacode1||'%')，
                                      d.areaid2 = (Select areaid From tb_htms_area a Where   a.areaname=d.str2 And areacode Like d.areacode1||'%')
                                      where d.areaid2 is null  And str2 Is not Null ;

--南通优化
 Update tb_htms_transprice_dty  d Set  d.areacode2 = (Select areacode From tb_htms_area a Where    '南通'||a.areaname=d.str2||'市' And areacode Like d.areacode1||'%')，
                                      d.areacname2 = (Select areaname From tb_htms_area a Where    '南通'||a.areaname=d.str2||'市' And areacode Like d.areacode1||'%')，
                                      d.areaid2 = (Select areaid From tb_htms_area a Where   '南通'|| a.areaname=d.str2||'市' And areacode Like d.areacode1||'%')
                                      where d.areaid2 is null  And str2 Is not Null ;
                                      
 Update tb_htms_transprice_dty  d Set  d.areacode2 = (Select areacode From tb_htms_area a Where    '南通'||a.areaname=d.str2||'县' And areacode Like d.areacode1||'%')，
                                      d.areacname2 = (Select areaname From tb_htms_area a Where    '南通'||a.areaname=d.str2||'县' And areacode Like d.areacode1||'%')，
                                      d.areaid2 = (Select areaid From tb_htms_area a Where   '南通'|| a.areaname=d.str2||'县' And areacode Like d.areacode1||'%')
                                      where d.areaid2 is null  And str2 Is not Null ;
 
  Update tb_htms_transprice_dty  d Set  d.areacode2 = (Select areacode From tb_htms_area a Where    '南通'||a.areaname=d.str2||'区' And areacode Like d.areacode1||'%')，
                                      d.areacname2 = (Select areaname From tb_htms_area a Where    '南通'||a.areaname=d.str2||'区' And areacode Like d.areacode1||'%')，
                                      d.areaid2 = (Select areaid From tb_htms_area a Where   '南通'|| a.areaname=d.str2||'区' And areacode Like d.areacode1||'%')
                                      where d.areaid2 is null  And str2 Is not Null ;
                                      
   Update tb_htms_transprice_dty  d Set  d.areacode2 = (Select areacode From tb_htms_area a Where    '南通'||a.areaname=d.str2||'街道' And areacode Like d.areacode1||'%')，
                                      d.areacname2 = (Select areaname From tb_htms_area a Where    '南通'||a.areaname=d.str2||'街道' And areacode Like d.areacode1||'%')，
                                      d.areaid2 = (Select areaid From tb_htms_area a Where   '南通'|| a.areaname=d.str2||'街道' And areacode Like d.areacode1||'%')
                                      where d.areaid2 is null  And str2 Is not Null ;
                                      
   Update tb_htms_transprice_dty  d Set  d.areacode2 = (Select areacode From tb_htms_area a Where    '南通'||a.areaname=d.str2 And areacode Like d.areacode1||'%')，
                                      d.areacname2 = (Select areaname From tb_htms_area a Where    '南通'||a.areaname=d.str2 And areacode Like d.areacode1||'%')，
                                      d.areaid2 = (Select areaid From tb_htms_area a Where   '南通'|| a.areaname=d.str2 And areacode Like d.areacode1||'%')
                                      where d.areaid2 is null  And str2 Is not Null ;

--淮安优化
 Update tb_htms_transprice_dty  d Set  d.areacode2 = (Select areacode From tb_htms_area a Where    '淮安'||a.areaname=d.str2||'县' And areacode Like d.areacode1||'%')，
                                      d.areacname2 = (Select areaname From tb_htms_area a Where    '淮安'||a.areaname=d.str2||'县' And areacode Like d.areacode1||'%')，
                                      d.areaid2 = (Select areaid From tb_htms_area a Where   '淮安'|| a.areaname=d.str2||'县' And areacode Like d.areacode1||'%')
                                      where d.areaid2 is null  And str2 Is not Null ;


-- 查询无数据再执行下一步 
select * from tb_htms_transprice_dty t  Where areaid2  Is   Null  And str2 Is Not Null ;



Update tb_htms_transprice_dty  Set areaid = areaid2 Where areaid2 Is Not Null ;


Update tb_htms_transprice_dty  Set areaid = areaid1 Where areaid Is   Null ;


-- 查询无数据再执行下一步 
select * from tb_htms_transprice_dty t  Where areaid   Is   Null    ;


update tb_htms_transprice_dty  set backstr1 = routeid ;




--去除重复路线
update tb_htms_transprice_dty  d set d. remark=1 ,d.routeid  = 
(select  routeid  from tb_htms_route r where  r.areaid=d.areaid 
and r.factoryid =d.factoryid  and r.productid =d.productid  and  routeid not in (5167)
 ) ;
 
--去除重复路线,标准做法
update tb_htms_transprice_dty  d set d. remark=1 ,d.routeid  = 
(select  routeid  from tb_htms_route r where  r.areaid=d.areaid 
and r.factoryid =d.factoryid  and r.productid =d.productid  ) ;
 
 select * from  (
 select areaid,count(areaid) as countnum  from tb_htms_route r  where factoryid=1 and productid =1  group by areaid 
  ) t where t.countnum>1 ;
  
select * from  (
 select areaid,count(areaid) as countnum  from tb_htms_route r  where factoryid=5 and productid =1  group by areaid 
  ) t where t.countnum>1 ;
  
  
select * from tb_htms_route  where areaid in (11853,11947,12674,12596) and  factoryid=1 and productid =1  order by areaid 
 
select * from tb_htms_route  where areaid in (10543) and  factoryid=1 and productid =1  order by areaid


update tb_htms_transprice_dty  set routeid  = backstr1  where routeid is null ; 



Insert Into tb_htms_route (routeid ,productid ,factoryid ,areaid ,isvalidate)
Select  Distinct routeid ,productid ,factoryid ,areaid ,isvalidate  From tb_htms_transprice_dty Where routeid > 5167 
And areaid Is Not Null  and routeid not in (
select routeid from tb_htms_route 
) Order By areaid  ; 


Insert Into   Tb_Htms_Transprice( Priceid, Routeid, Pricetype, Customerprice, Companyprice, Carrierprice, Pricestart, Priceend, Priceunit, Creator,
			 Createtime, Modifier, Modifytime, Isvalidate, Customeroneprice, Carrieroneprice, Freightmodel, Validatedate)
Select Priceid, Routeid, Pricetype, Customerprice, Companyprice, Carrierprice, Pricestart, Priceend, Priceunit, Creator,
			 Createtime, Modifier, Modifytime, Isvalidate, Customeroneprice, Carrieroneprice, Freightmodel, Validatedate
From Tb_Htms_Transprice_Dty d
Where d.Areaid Is Not Null And d.Routeid Is Not Null;



Insert Into caiid_routeid(caiid )
Select routeid As caiid From tb_htms_route Where routeid Not In (Select caiid From caiid_routeid )


Insert Into caiid_priceid(caiid )
Select priceid As caiid From Tb_Htms_Transprice Where priceid Not In (Select caiid From caiid_priceid )

-- 加载缓存
*/

--select * from tb_htms_transprice_dty t  ;--For Update  


