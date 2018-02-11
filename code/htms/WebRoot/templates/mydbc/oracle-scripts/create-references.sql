  
--##++[[Product]]
alter table TB_HTMS_PRODUCT add constraint FK_PRODUCT_PRODUCTTYPE  foreign key (typeId) references TB_HTMS_PRODUCTTYPE(typeId);
--##--[[Product]]

  
--##++[[Route]]
alter table TB_HTMS_ROUTE add constraint FK_ROUTE_FACTORY  foreign key (factoryId) references TB_HTMS_FACTORY(factoryId);
alter table TB_HTMS_ROUTE add constraint FK_TB_HTMS_ROUTE_TB_HTMS_AREA  foreign key (areaId) references TB_HTMS_AREA(areaId);
alter table TB_HTMS_ROUTE add constraint FK_ROUTE_PRODUCT  foreign key (productId) references TB_HTMS_PRODUCT(productId);
--##--[[Route]]

  
--##++[[CustomerAddr]]
alter table TB_HTMS_CUSTOMERADDR add constraint FK_CUSTOMERADDR_CUSTOMER  foreign key (customerId) references TB_HTMS_CUSTOMER(customerId);
--##--[[CustomerAddr]]

  
--##++[[TransPrice]]
alter table TB_HTMS_TRANSPRICE add constraint FK_TRANSPRICE_ROUTE  foreign key (routeId) references TB_HTMS_ROUTE(routeId);
--##--[[TransPrice]]

  
--##++[[SendDetail]]
alter table TB_HTMS_SENDDETAIL add constraint FK_SENDDETAIL_SEND  foreign key (sendId) references TB_HTMS_SEND(sendId);
alter table TB_HTMS_SENDDETAIL add constraint FK_SENDDETAIL_TRANSFERDETAIL  foreign key (transDetailId) references TB_HTMS_TRANSFERDETAIL(transDetailId);
alter table TB_HTMS_SENDDETAIL add constraint FK_SENDDETAIL_TRANSPORT  foreign key (transportId) references TB_HTMS_TRANSPORT(transportId);
alter table TB_HTMS_SENDDETAIL add constraint FK_SENDDETAIL_TRANSFER  foreign key (transferId) references TB_HTMS_TRANSFER(transId);
alter table TB_HTMS_SENDDETAIL add constraint FK_SENDDETAIL_SHIPDETAIL  foreign key (shipDetailId) references TB_HTMS_SHIPDETAIL(shipDetailId);
alter table TB_HTMS_SENDDETAIL add constraint FK_SENDDETAIL_CUSTORDERDETAIL  foreign key (codetailId) references TB_HTMS_CUSTORDERDETAIL(codetailId);
alter table TB_HTMS_SENDDETAIL add constraint FK_SENDDETAIL_SHIP  foreign key (shipId) references TB_HTMS_SHIP(shipId);
alter table TB_HTMS_SENDDETAIL add constraint FK_SENDDETAIL_CUSTOMER  foreign key (caddrId) references TB_HTMS_CUSTOMER(customerId);
alter table TB_HTMS_SENDDETAIL add constraint FK_SENDDETAIL_PRODUCT  foreign key (productId) references TB_HTMS_PRODUCT(productId);
--##--[[SendDetail]]

  
--##++[[CustOrder]]
alter table TB_HTMS_CUSTORDER add constraint FK_CUSTORDER_CUSTOMER  foreign key (customerId) references TB_HTMS_CUSTOMER(customerId);
--##--[[CustOrder]]

  
--##++[[TransportDetail]]
alter table TB_HTMS_TRANSPORTDETAIL add constraint FK_TRANSPORTDETAIL_TRANSFERDET  foreign key (transDetailId) references TB_HTMS_TRANSFERDETAIL(transDetailId);
alter table TB_HTMS_TRANSPORTDETAIL add constraint FK_TRANSPORTDETAIL_TRANSPORT  foreign key (transportId) references TB_HTMS_TRANSPORT(transportId);
alter table TB_HTMS_TRANSPORTDETAIL add constraint FK_TRANSPORTDETAIL_TRANSFER  foreign key (transferId) references TB_HTMS_TRANSFER(transId);
alter table TB_HTMS_TRANSPORTDETAIL add constraint FK_TRANSPORTDETAIL_SHIPDETAIL  foreign key (shipDetailId) references TB_HTMS_SHIPDETAIL(shipDetailId);
alter table TB_HTMS_TRANSPORTDETAIL add constraint FK_TRANSPORTDETAIL_CUSTORDERDE  foreign key (codetailId) references TB_HTMS_CUSTORDERDETAIL(codetailId);
alter table TB_HTMS_TRANSPORTDETAIL add constraint FK_TRANSPORTDETAIL_SHIP  foreign key (shipId) references TB_HTMS_SHIP(shipId);
alter table TB_HTMS_TRANSPORTDETAIL add constraint FK_TRANSPORTDETAIL_CUSTOMER  foreign key (caddrId) references TB_HTMS_CUSTOMER(customerId);
alter table TB_HTMS_TRANSPORTDETAIL add constraint FK_TRANSPORTDETAIL_PRODUCT  foreign key (productId) references TB_HTMS_PRODUCT(productId);
--##--[[TransportDetail]]

  
--##++[[Ship]]
alter table TB_HTMS_SHIP add constraint FK_SHIP_CUSTORDER  foreign key (corderId) references TB_HTMS_CUSTORDER(corderId);
alter table TB_HTMS_SHIP add constraint FK_SHIP_CUSTOMER  foreign key (customerId) references TB_HTMS_CUSTOMER(customerId);
--##--[[Ship]]

  
--##++[[Send]]
alter table TB_HTMS_SEND add constraint FK_SEND_TRANSPORT  foreign key (transportId) references TB_HTMS_TRANSPORT(transportId);
alter table TB_HTMS_SEND add constraint FK_SEND_VEHICLE  foreign key (vehicleId) references TB_HTMS_VEHICLE(vehicleId);
alter table TB_HTMS_SEND add constraint FK_TB_HTMS_SEND_TB_HTMS_DRIVER  foreign key (driverId) references TB_HTMS_DRIVER(driverId);
alter table TB_HTMS_SEND add constraint FK_SEND_CARRIER  foreign key (carrierId) references TB_HTMS_CARRIER(carrierId);
alter table TB_HTMS_SEND add constraint FK_SEND_TRANSFER  foreign key (transId) references TB_HTMS_TRANSFER(transId);
--##--[[Send]]

  
--##++[[CustOrderDetail]]
alter table TB_HTMS_CUSTORDERDETAIL add constraint FK_CUSTORDERDETAIL_CUSTORDER  foreign key (corderId) references TB_HTMS_CUSTORDER(corderId);
--##--[[CustOrderDetail]]

  
--##++[[Transport]]
alter table TB_HTMS_TRANSPORT add constraint FK_TRANSPORT_CARRIER  foreign key (carrierId) references TB_HTMS_CARRIER(carrierId);
alter table TB_HTMS_TRANSPORT add constraint FK_TRANSPORT_TRANSFER  foreign key (transId) references TB_HTMS_TRANSFER(transId);
--##--[[Transport]]

  
--##++[[Vehicle]]
alter table TB_HTMS_VEHICLE add constraint FK_VEHICLE_CARRIER  foreign key (carrierId) references TB_HTMS_CARRIER(carrierId);
--##--[[Vehicle]]

  
--##++[[ShipDetail]]
alter table TB_HTMS_SHIPDETAIL add constraint FK_SHIPDETAIL_SHIP  foreign key (shipId) references TB_HTMS_SHIP(shipId);
alter table TB_HTMS_SHIPDETAIL add constraint FK_SHIPDETAIL_CUSTOMERADDR  foreign key (caddrId) references TB_HTMS_CUSTOMERADDR(caddrId);
alter table TB_HTMS_SHIPDETAIL add constraint FK_SHIPDETAIL_CUSTORDERDETAIL  foreign key (codetailId) references TB_HTMS_CUSTORDERDETAIL(codetailId);
alter table TB_HTMS_SHIPDETAIL add constraint FK_SHIPDETAIL_PRODUCT  foreign key (productId) references TB_HTMS_PRODUCT(productId);
--##--[[ShipDetail]]

  
--##++[[TransferDetail]]
alter table TB_HTMS_TRANSFERDETAIL add constraint FK_TRANSFERDETAIL_SHIPDETAIL  foreign key (shipDetailId) references TB_HTMS_SHIPDETAIL(shipDetailId);
alter table TB_HTMS_TRANSFERDETAIL add constraint FK_TRANSFERDETAIL_TRANSFER  foreign key (transId) references TB_HTMS_TRANSFER(transId);
alter table TB_HTMS_TRANSFERDETAIL add constraint FK_TRANSFERDETAIL_SHIP  foreign key (shipId) references TB_HTMS_SHIP(shipId);
alter table TB_HTMS_TRANSFERDETAIL add constraint FK_TRANSFERDETAIL_CUSTOMER  foreign key (caddrId) references TB_HTMS_CUSTOMER(customerId);
alter table TB_HTMS_TRANSFERDETAIL add constraint FK_TRANSFERDETAIL_PRODUCT  foreign key (productId) references TB_HTMS_PRODUCT(productId);
--##--[[TransferDetail]]

  
--##++[[Transfer]]
alter table TB_HTMS_TRANSFER add constraint FK_TRANSFER_SHIP  foreign key (shipId) references TB_HTMS_SHIP(shipId);
alter table TB_HTMS_TRANSFER add constraint FK_TRANSFER_LOGISTICS  foreign key (logisticsId) references TB_HTMS_LOGISTICS(logisticsId);
alter table TB_HTMS_TRANSFER add constraint FK_TRANSFER_CUSTORDER  foreign key (corderId) references TB_HTMS_CUSTORDER(corderId);
alter table TB_HTMS_TRANSFER add constraint FK_TRANSFER_CUSTOMER  foreign key (customerId) references TB_HTMS_CUSTOMER(customerId);
--##--[[Transfer]]

