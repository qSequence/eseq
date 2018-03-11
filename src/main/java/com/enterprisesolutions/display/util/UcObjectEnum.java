package com.enterprisesolutions.display.util;

public enum UcObjectEnum {
	//this line of enums is used by Level 1 uc
	customer, uc, output, oddConnector, evenConnector, rightArrow, bottomCornerConnector, topCornerConnector, rightTConnector, emptyColumn, asynchConnector
	, asynchSource, asynchDestination
		//this line is of enums along with some from the above line is used by Sequence
	,customerSystemTwoWayConnector, customerSystemOneWayConnector, systemToSystemTwoWayConnector, addSystem, system, system11, system13, ucSeqDiagram, ifCondition, sequenceSection, vertivalLineConnector, systemSystemTwoWayConnector, systemSystemLastConnector, SEQ_IF, SEQ_SECTION, ifConditionBoundary, request, response,
	server,  database_server, application_server, email_server, firewall, internet_cloud,proxy_server, router, network_switch, device, web_service, portal, process, queue, phone_app, store_kit, app_store,
	web_service_gray,web_service_external, web_pages, store_kit_gray, store_kit_external, server_gray, server_external, router_gray, router_external, proxy_server_gray, proxy_server_external, process_gray, 
	process_external, portal_gray, portal_external, phone_app_gray, phone_app_external, network_switch_gray, network_switch_external, internet_cloud_gray,
	internet_cloud_external, firewall_gray, firewall_external, email_server_gray, email_server_external, database_server_gray, database_server_external,
	application_server_gray, application_server_external, app_store_gray, app_store_external, Customer_gray, Customer_external, sys_seq,
	copy, cut, paste
	,synch_asynch, synch_asynch_destination, copy_destination, custom
}
