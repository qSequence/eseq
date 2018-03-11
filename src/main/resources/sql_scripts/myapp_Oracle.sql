
createTableSQL="CREATE Table seq_mst(seq_id varchar2(30),SEQUENCE_NEXT_HI_VALUE  number)";
createTableSQL="	";
createTableSQL="create table uc_seq_mst(seq_mst_id number,base_seq_mst_id number,cat_id number not null,access varchar2(4000),change_set_id number,change_title varchar2(100),change_note varchar2(2000),across_version_seq_id varchar2(100),across_dev_version_seq_id varchar2(100),seq_name varchar2(100),system_id number,system_name varchar2(50),seq_description varchar2(4000),system_type varchar2(50),uc_id number,is_edited varchar2(1),edited_by varchar2(100),user_id varchar2(100),edited_date date,created_date date,is_public varchar2(1),is_repo varchar2(1),one_way varchar2(1),default_menu varchar2(1),MENU_IMAGE_URL varchar2(200),LINK_SHARE_DATE_FACEBOOK date,LINK_SHARE_DATE_TWITTER date,LINK_SHARE_DATE_GPLUS date,LINK_SHARE_DATE_LINKIN date,LINK_SECURE_DATE date,CONSTRAINT uc_seqMstId_pk PRIMARY KEY (seq_mst_id))";

createTableSQL="alter table uc_seq_mst add constraint dev_is_edited_check check (is_edited=\"N\")";

createTableSQL="create table uc_seq_release(detect_change_id number, seq_mst_id number, request_id number, parent_requestId number, parent_seq_mst_id number, sequence_version varchar2(50), change_type varchar2(50), change_title varchar2(400), system_id number, item_signature_from varchar2(2000), item_signature_to varchar2(2000), change_desc_from varchar2(4000), change_desc_to varchar2(10000), comments varchar2(4000), system_note varchar2(4000), status varchar2(50), release_date date, user_id varchar2(100), CONSTRAINT uc_seq_release_dev_pk PRIMARY KEY (detect_change_id))";

createTableSQL="alter table uc_seq_release add UNIQUE (seq_mst_id, request_id,parent_requestId,parent_seq_mst_id, change_type, sequence_version)";



createTableSQL="create table uc_seq_mst_draft(seq_mst_id number, base_seq_mst_id number, cat_id number not null, access varchar2(4000), change_set_id number, change_title varchar2(100), change_note varchar2(2000), across_version_seq_id varchar2(100), across_dev_version_seq_id varchar2(100), seq_name varchar2(100), system_id number, system_name varchar2(50), seq_description varchar2(4000), system_type varchar2(50), uc_id number, is_edited varchar2(1), edited_by varchar2(100), user_id varchar2(100), edited_date date, created_date date, is_public varchar2(1), is_repo varchar2(1), one_way varchar2(1), default_menu varchar2(1), MENU_IMAGE_URL varchar2(200), LINK_SHARE_DATE_FACEBOOK date, LINK_SHARE_DATE_TWITTER date, LINK_SHARE_DATE_GPLUS date, LINK_SHARE_DATE_LINKIN date, LINK_SECURE_DATE date, CONSTRAINT uc_seqMstDraftId_draft_pk PRIMARY KEY (seq_mst_id))";
createTableSQL="alter table uc_seq_mst_draft alter seq_name not null";
createTableSQL="create table uc_seq_release_draft(detect_change_id number, seq_mst_id number, request_id number, parent_requestId number, parent_seq_mst_id number, sequence_version varchar2(50), change_type varchar2(50), change_title varchar2(400), system_id number, item_signature_from varchar2(2000), item_signature_to varchar2(2000), change_desc_from varchar2(4000), change_desc_to varchar2(10000), comments varchar2(4000), system_note varchar2(4000), status varchar2(50), release_date date, user_id varchar2(100), CONSTRAINT uc_seq_release_draft_dev_pk PRIMARY KEY (detect_change_id))";

createTableSQL="alter table uc_seq_release_draft add UNIQUE (seq_mst_id, request_id, parent_requestId,parent_seq_mst_id, change_type,  sequence_version)";


createTableSQL="create table uc_seq_mst_dev_version(seq_mst_id number,base_seq_mst_id number,cat_id number not null,access varchar2(4000),across_dev_version_seq_id varchar2(100),change_set_id number,change_title varchar2(100),change_note varchar2(2000),across_version_seq_id varchar2(100),seq_name varchar2(100),system_id number,system_name varchar2(50),seq_description varchar2(4000),system_type varchar2(50),uc_id number,is_edited varchar2(1),edited_by varchar2(100),user_id varchar2(100),edited_date date,created_date date,is_public varchar2(1),is_repo varchar2(1),one_way varchar2(1),default_menu varchar2(1),MENU_IMAGE_URL varchar2(200),LINK_SHARE_DATE_FACEBOOK date,LINK_SHARE_DATE_TWITTER date,LINK_SHARE_DATE_GPLUS date,LINK_SHARE_DATE_LINKIN date,LINK_SECURE_DATE date,CONSTRAINT uc_seqMstId_devVer_pk PRIMARY KEY (seq_mst_id))";

createTableSQL="alter table uc_seq_mst_dev_version add constraint dev_ver_is_edited_check check (is_edited=\"N\")";

createTableSQL="create table uc_seq_release_dev_version(detect_change_id number,seq_mst_id number,request_id number,parent_requestId number,parent_seq_mst_id number,sequence_version varchar2(50),change_type varchar2(50),change_title varchar2(400),system_id number,item_signature_from varchar2(2000),item_signature_to varchar2(2000),change_desc_from varchar2(4000),change_desc_to varchar2(10000),comments varchar2(4000),system_note varchar2(4000),status varchar2(50),release_date date,user_id varchar2(100),CONSTRAINT uc_seq_release_devVer_pk PRIMARY KEY (detect_change_id))";

createTableSQL="alter table uc_seq_release_dev_version add UNIQUE (seq_mst_id, request_id, parent_requestId, parent_seq_mst_id, change_type,  sequence_version)";


createTableSQL="create table uc_seq_mst_prod(seq_mst_id number,base_seq_mst_id number, cat_id number not null, access varchar2(4000), change_set_id number, change_title varchar2(100), change_note varchar2(2000), across_version_seq_id varchar2(100), across_dev_version_seq_id varchar2(100), seq_name varchar2(100), system_id number, system_name varchar2(50), seq_description varchar2(4000), system_type varchar2(50), uc_id number, is_edited varchar2(1), edited_by varchar2(100), user_id varchar2(100), edited_date date, created_date date, is_public varchar2(1), is_repo varchar2(1), one_way varchar2(1), default_menu varchar2(1), MENU_IMAGE_URL varchar2(200), LINK_SHARE_DATE_FACEBOOK date, LINK_SHARE_DATE_TWITTER date, LINK_SHARE_DATE_GPLUS date, LINK_SHARE_DATE_LINKIN date, LINK_SECURE_DATE date, CONSTRAINT uc_seqMstId_prod_pk PRIMARY KEY (seq_mst_id))";

createTableSQL="alter table uc_seq_mst_prod add constraint is_edited_check check (is_edited=\"N\")";


createTableSQL="create table uc_seq_release_prod ( detect_change_id number, seq_mst_id number,  request_id number, parent_requestId number, parent_seq_mst_id number, sequence_version varchar2(50), change_type varchar2(50), change_title varchar2(400), system_id number, item_signature_from varchar2(2000), item_signature_to varchar2(2000), change_desc_from varchar2(4000), change_desc_to varchar2(10000), comments varchar2(4000), system_note varchar2(4000), status varchar2(50), release_date date, user_id varchar2(100), CONSTRAINT uc_seq_release_prod_pk PRIMARY KEY (detect_change_id))";

createTableSQL="alter table uc_seq_release_prod add UNIQUE (seq_mst_id, request_id,parent_requestId, parent_seq_mst_id, change_type, sequence_version)";


createTableSQL="create table uc_seq_mst_prod_version( seq_mst_id number, base_seq_mst_id number, cat_id number not null,  access varchar2(4000), change_set_id number, change_title varchar2(100), change_note varchar2(2000), across_version_seq_id varchar2(100), across_dev_version_seq_id varchar2(100), seq_name varchar2(100), system_id number, system_name varchar2(50), seq_description varchar2(4000), system_type varchar2(50), uc_id number, is_edited varchar2(1), edited_by varchar2(100), user_id varchar2(100), edited_date date, created_date date, is_public varchar2(1), is_repo varchar2(1), one_way varchar2(1), default_menu varchar2(1), MENU_IMAGE_URL varchar2(200), LINK_SHARE_DATE_FACEBOOK date, LINK_SHARE_DATE_TWITTER date, LINK_SHARE_DATE_GPLUS date, LINK_SHARE_DATE_LINKIN date, LINK_SECURE_DATE date, CONSTRAINT uc_seqMstId_prodVer_pk PRIMARY KEY (seq_mst_id))";

createTableSQL="alter table uc_seq_mst_prod_version add constraint is_edited_check check (is_edited=\"N\")";

createTableSQL="create table uc_seq_release_prod_version ( detect_change_id number, seq_mst_id number,  request_id number, parent_requestId number, parent_seq_mst_id number, sequence_version varchar2(50), change_type varchar2(50), change_title varchar2(400), system_id number, item_signature_from varchar2(2000), item_signature_to varchar2(2000), change_desc_from varchar2(4000), change_desc_to varchar2(10000), comments varchar2(4000), system_note varchar2(4000), status varchar2(50), release_date date, user_id varchar2(100), CONSTRAINT uc_seq_release_prodVer_pk PRIMARY KEY (detect_change_id)) ";
createTableSQL="alter table uc_seq_release_prod_version add UNIQUE (seq_mst_id, request_id,parent_requestId, parent_seq_mst_id, change_type, sequence_version)";

createTableSQL=" ";
createTableSQL="create table uc_seq_diagram( seq_item_id number, seq_mst_id number, user_id varchar2(100), system_id number, system_new varchar2(1), request_id number, request_new varchar2(1), request_protocol varchar2(50), draft_request_protocol varchar2(50), item_signature varchar2(2000), response_id number, response_new varchar2(1), system_name varchar2(50), system_type varchar2(50), row_no number, col_no number, last_child_row_no number, if_condition varchar2(2000), section_name varchar2(100), request varchar2(100), response varchar2(100), sample_request varchar2(4000), draft_sample_request varchar2(4000),  sample_success_response varchar2(4000), draft_sample_success_response varchar2(4000), sample_failure_response varchar2(4000), draft_sample_failure_response varchar2(4000), ASYNCH_SOURCE_DESTINATION varchar2(20), ASYNCH_SEQ_ITEM_ID number, ASYNCH_ROW_NO number, ASYNCH_COL_NO number, description  varchar2(4000),  MENU_IMAGE_URL varchar2(200), CONSTRAINT uc_seqItemId_pk PRIMARY KEY (seq_item_id))";


createTableSQL="alter table uc_seq_diagram alter system_id not null";
createTableSQL="alter table uc_seq_diagram alter system_type not null";

createTableSQL="create table uc_seq_diagram_draft( seq_item_id number, seq_mst_id number, user_id varchar2(100), system_id number, system_new varchar2(1), request_id number, request_new varchar2(1), request_protocol varchar2(50), draft_request_protocol varchar2(50), item_signature varchar2(2000), response_id number, response_new varchar2(1), system_name varchar2(50), system_type varchar2(50), row_no number, col_no number, last_child_row_no number, if_condition varchar2(2000), section_name varchar2(100), request varchar2(100), response varchar2(100), sample_request varchar2(4000), draft_sample_request varchar2(4000), sample_success_response varchar2(4000), draft_sample_success_response varchar2(4000), sample_failure_response varchar2(4000), draft_sample_failure_response varchar2(4000), ASYNCH_SOURCE_DESTINATION varchar2(20), ASYNCH_SEQ_ITEM_ID number, ASYNCH_ROW_NO number, ASYNCH_COL_NO number, description  varchar2(4000), MENU_IMAGE_URL varchar2(200), CONSTRAINT uc_seqItemId_draft_pk PRIMARY KEY (seq_item_id))";

createTableSQL="alter table uc_seq_diagram add UNIQUE (seq_mst_id, row_no, col_no)";
createTableSQL="alter table uc_seq_diagram_draft alter system_id not null";
createTableSQL="alter table uc_seq_diagram_draft alter system_type not null";


createTableSQL="create table uc_seq_diagram_dev_version( seq_item_id number, seq_mst_id number, user_id varchar2(100), system_id number, system_new varchar2(1), request_id number, request_new varchar2(1), request_protocol varchar2(50), draft_request_protocol varchar2(50), item_signature varchar2(2000), response_id number, response_new varchar2(1), system_name varchar2(50), system_type varchar2(50), row_no number, col_no number, last_child_row_no number, if_condition varchar2(2000), section_name varchar2(100), request varchar2(100), response varchar2(100), sample_request varchar2(4000), draft_sample_request varchar2(4000), sample_success_response varchar2(4000), draft_sample_success_response varchar2(4000), sample_failure_response varchar2(4000), draft_sample_failure_response varchar2(4000), ASYNCH_SOURCE_DESTINATION varchar2(20), ASYNCH_SEQ_ITEM_ID number, ASYNCH_ROW_NO number, ASYNCH_COL_NO number, description  varchar2(4000), MENU_IMAGE_URL varchar2(200), CONSTRAINT uc_seqItemId_devVer_pk PRIMARY KEY (seq_item_id))";

createTableSQL="alter table uc_seq_diagram_draft alter system_id not null";

createTableSQL="alter table uc_seq_diagram_draft alter system_type not null";


createTableSQL="create table uc_seq_diagram_prod( seq_item_id number, seq_mst_id number, user_id varchar2(100), system_id number, system_new varchar2(1), request_id number, request_new varchar2(1), request_protocol varchar2(50), draft_request_protocol varchar2(50), item_signature varchar2(2000), response_id number, response_new varchar2(1), system_name varchar2(50), system_type varchar2(50), row_no number, col_no number, last_child_row_no number, if_condition varchar2(2000), section_name varchar2(100), request varchar2(100), response varchar2(100), sample_request varchar2(4000), draft_sample_request varchar2(4000), sample_success_response varchar2(4000), draft_sample_success_response varchar2(4000), sample_failure_response varchar2(4000), draft_sample_failure_response varchar2(4000), ASYNCH_SOURCE_DESTINATION varchar2(20), ASYNCH_SEQ_ITEM_ID number, ASYNCH_ROW_NO number, ASYNCH_COL_NO number, description  varchar2(4000), MENU_IMAGE_URL varchar2(200), CONSTRAINT uc_seqItemId_prod_pk PRIMARY KEY (seq_item_id))";
createTableSQL="alter table uc_seq_diagram_prod alter system_id not null";

createTableSQL="alter table uc_seq_diagram_prod alter system_type not null";

createTableSQL="create table uc_seq_diagram_prod_version( seq_item_id number, seq_mst_id number, user_id varchar2(100), system_id number, system_new varchar2(1), request_id number, request_new varchar2(1), request_protocol varchar2(50), draft_request_protocol varchar2(50), item_signature varchar2(2000), response_id number, response_new varchar2(1), system_name varchar2(50), system_type varchar2(50), row_no number, col_no number, last_child_row_no number, if_condition varchar2(2000), section_name varchar2(100), request varchar2(100), response varchar2(100), sample_request varchar2(4000), draft_sample_request varchar2(4000), sample_success_response varchar2(4000), draft_sample_success_response varchar2(4000), sample_failure_response varchar2(4000), draft_sample_failure_response varchar2(4000), ASYNCH_SOURCE_DESTINATION varchar2(20), ASYNCH_SEQ_ITEM_ID number, ASYNCH_ROW_NO number, ASYNCH_COL_NO number, description  varchar2(4000),  MENU_IMAGE_URL varchar2(200), CONSTRAINT uc_seqItemId_prodVer_pk PRIMARY KEY (seq_item_id))";

createTableSQL="alter table uc_seq_diagram_prod_version alter system_id not null";

createTableSQL="alter table uc_seq_diagram_prod_version alter system_type not null";

createTableSQL="	create table CREDENTIAL( id number, user_id varchar2(100), user_type varchar2(100), team_id varchar2(100), user_name_email varchar2(100), first_name varchar2(100), last_name varchar2(100), password varchar2(200), temp_password varchar2(200), temp_password_expiry date, salt  varchar2(100), phone varchar2(35), mobile varchar2(15), company varchar2(100), terms_of_use_accepted varchar2(1), updated_date date, created_date date, created_by varchar2(100), updated_by varchar2(100), default_menu varchar2(1), user_name	varchar2(100), question1 varchar2(200), answer1 varchar2(200), question2 varchar2(200), answer2 varchar2(200), question3 varchar2(200), answer3 varchar2(200), CONSTRAINT credential_Id_pk PRIMARY KEY (id))";
createTableSQL="	";
createTableSQL="	insert into CREDENTIAL( id, user_id, user_type, team_id, user_name_email, first_name, last_name, password, temp_password, temp_password_expiry, salt, phone, mobile, company, terms_of_use_accepted, updated_date, created_date, created_by, updated_by, default_menu, user_name)values(0,	\"95ce9a8a-a9cb-4a5a-9971-055018431b2a160608062116\",\"ENTERPRISE_ARCHITECT\",\"97e96294-e162-4334-9a16-6b12cec8b19c160608061723\",null,null,null, \"YQbmBRJBI4FS/P2I7zFs4BZV/Gw/0MsjW0UyZ4Kt4q6OGgDs1rEiCFYCIrUgpDnI8dNLP7bl54iRx+maw9Vx/Q==\",null,null,\"AOJDS/r10u8=\",null,null,null,\"0\",null,null,null,null,\"Y\",\"admin\")";

createTableSQL="	create table CREDENTIAL_ACCESS_CHANGE_LOG( changed_by varchar2(100), changed_for varchar2(100), access_change_from varchar2(100), access_change_to varchar2(100), record_created_date date)";

createTableSQL="create table session_records( session_id number, user_id varchar2(100), jsession_id varchar2(40), remote_login_host varchar2(40), remote_login_ipaddress varchar2(40), remote_login_proxy_ipaddress varchar2(100), created_date date, logoff_date date, sessionExpired_or_LoggedOff varchar2(40), CONSTRAINT session_sessionId_pk PRIMARY KEY (session_id))";


createTableSQL="create table product_mst( product_id number, product_name varchar2(50), CONSTRAINT product_id_pk PRIMARY KEY (product_id))";


createTableSQL="create table product_feature( product_feature_id number, product_id number, feature_name varchar2(50), feature_value varchar2(50), CONSTRAINT product_feature_id_pk PRIMARY KEY (product_feature_id))";


createTableSQL="create table customer_subscription( subscription_id number, product_feature_id number, customer_id varchar2(100), product_key varchar2(500), previous_product_key varchar2(500), downgrade_key  varchar2(500), start_date date, end_date date, license_type varchar2(100), status varchar2(20), CONSTRAINT subscription_id_pk PRIMARY KEY (subscription_id))";

createTableSQL="create table customer_transactions( transaction_id number, subscription_id number, product_feature_id number, customer_id varchar2(100), product_key varchar2(500), transaction_date date, status varchar2(50), CONSTRAINT transaction_id_pk PRIMARY KEY (transaction_id))";


createTableSQL="insert into product_mst (product_id,  product_name) values(1, \"qSequence\")";


createTableSQL="insert into product_feature (product_feature_id, product_id, feature_name, feature_value) values(1, 1, \"NUMBER_OF_USERS\", \"10\")";
createTableSQL="insert into product_feature (product_feature_id, product_id, feature_name, feature_value) values(2, 1, \"NUMBER_OF_USERS\", \"15\")";
createTableSQL="insert into product_feature (product_feature_id, product_id, feature_name, feature_value) values(3, 1, \"NUMBER_OF_USERS\", \"25\")";
createTableSQL="insert into product_feature (product_feature_id, product_id, feature_name, feature_value) values(4, 1, \"NUMBER_OF_USERS\", \"50\")";
createTableSQL="insert into product_feature (product_feature_id, product_id, feature_name, feature_value) values(5, 1, \"NUMBER_OF_USERS\", \"100\")";
createTableSQL="insert into product_feature (product_feature_id, product_id, feature_name, feature_value) values(6, 1, \"NUMBER_OF_USERS\", \"500\")";
createTableSQL="insert into product_feature (product_feature_id, product_id, feature_name, feature_value) values(7, 1, \"NUMBER_OF_USERS\", \"1000\")";
createTableSQL="insert into product_feature (product_feature_id, product_id, feature_name, feature_value) values(8, 1, \"NUMBER_OF_USERS\", \"2000\")";
createTableSQL="insert into product_feature (product_feature_id, product_id, feature_name, feature_value) values(9, 1, \"NUMBER_OF_USERS\", \"3000\")";
createTableSQL="insert into product_feature (product_feature_id, product_id, feature_name, feature_value) values(10, 1, \"NUMBER_OF_USERS\", \"4000\")";
createTableSQL="insert into product_feature (product_feature_id, product_id, feature_name, feature_value) values(11, 1, \"NUMBER_OF_USERS\", \"5000\")";
createTableSQL="insert into product_feature (product_feature_id, product_id, feature_name, feature_value) values(12, 1, \"NUMBER_OF_USERS\", \"6000\")";
createTableSQL="insert into product_feature (product_feature_id, product_id, feature_name, feature_value) values(13, 1, \"NUMBER_OF_USERS\", \"7000\")";
createTableSQL="insert into product_feature (product_feature_id, product_id, feature_name, feature_value) values(14, 1, \"NUMBER_OF_USERS\", \"8000\")";
createTableSQL="insert into product_feature (product_feature_id, product_id, feature_name, feature_value) values(15, 1, \"NUMBER_OF_USERS\", \"9000\")";
createTableSQL="insert into product_feature (product_feature_id, product_id, feature_name, feature_value) values(16, 1, \"NUMBER_OF_USERS\", \"10000\")";
createTableSQL="insert into product_feature (product_feature_id, product_id, feature_name, feature_value) values(17, 1, \"NUMBER_OF_USERS\", \"15000\")";
createTableSQL="insert into product_feature (product_feature_id, product_id, feature_name, feature_value) values(18, 1, \"NUMBER_OF_USERS\", \"20000\")";
createTableSQL="insert into product_feature (product_feature_id, product_id, feature_name, feature_value) values(19, 1, \"NUMBER_OF_USERS\", \"25000\")";
createTableSQL="insert into product_feature (product_feature_id, product_id, feature_name, feature_value) values(20, 1, \"NUMBER_OF_USERS\", \"30000\")";
createTableSQL="insert into product_feature (product_feature_id, product_id, feature_name, feature_value) values(21, 1, \"NUMBER_OF_USERS\", \"35000\")";
createTableSQL="insert into product_feature (product_feature_id, product_id, feature_name, feature_value) values(22, 1, \"NUMBER_OF_USERS\", \"40000\")";
createTableSQL="insert into product_feature (product_feature_id, product_id, feature_name, feature_value) values(23, 1, \"NUMBER_OF_USERS\", \"45000\")";
createTableSQL="insert into product_feature (product_feature_id, product_id, feature_name, feature_value) values(24, 1, \"NUMBER_OF_USERS\", \"50000\")";
createTableSQL="insert into product_feature (product_feature_id, product_id, feature_name, feature_value) values(25, 1, \"NUMBER_OF_USERS\", \"50000+\")";


createTableSQL="insert into customer_subscription(SUBSCRIPTION_ID,PRODUCT_FEATURE_ID,CUSTOMER_ID,PRODUCT_KEY, DOWNGRADE_KEY,START_DATE,END_DATE,LICENSE_TYPE,STATUS,PREVIOUS_PRODUCT_KEY) values(1, #PRODUCT_FEATURE_ID#, \"#CUSTOMER_ID#\", \"#PRODUCT_KEY#\", null, date(\"#START_DATE#\"), null, \"#LICENSE_TYPE#\", \"SUCCESSFUL\", null)";

createTableSQL="insert into customer_transactions(transaction_id, subscription_id, product_feature_id, customer_id, product_key, transaction_date, status) values(99999, 1, #PRODUCT_FEATURE_ID#, \"#CUSTOMER_ID#\", \"#PRODUCT_KEY#\",date(\"#START_DATE#\"), \"#LICENSE_TYPE#\")";
createTableSQL="		";
createTableSQL="		";
createTableSQL="create table pay_pal_details( username varchar2(150), password varchar2(50), apisignature varchar2(150), environment varchar2(50), encripted varchar2(10), status varchar2(10), CONSTRAINT pay_pal_details_username_pk PRIMARY KEY (username))";


createTableSQL="create table buy_details( buy_enquiry_id number, user_id varchar2(100), user_name_email varchar2(100), first_name varchar2(100), last_name varchar2(100), phone varchar2(35), mobile varchar2(15), company varchar2(100), updated_date date, message varchar2(200), created_date date, status varchar2(20), CONSTRAINT buy_details_enquiry_id_pk PRIMARY KEY (buy_enquiry_id))";

createTableSQL="create table uc_seq_diagram_property( property_id number, user_id varchar2(100), SEQ_MST_ID number, SEQ_ITEM_ID number, system_id number, request_id number, response_id number, property_for varchar2(100), property_name varchar2(100), property_value varchar2(4000), CONSTRAINT property_id_pk PRIMARY KEY (property_id))";


createTableSQL="create table uc_tip( tip_id number, user_id varchar2(100), tip_name varchar2(50), last_displayed_date date, CONSTRAINT tip_pk PRIMARY KEY (tip_id))";

createTableSQL="create table uc_host_cluster_mst( HOST_ID number, HOST_CLUSTER_NAME  varchar2(100), PRIMARY_HOST_NAME  varchar2(100), OTHER_HOST_NAMES  varchar2(2000), SEQ_MST_ID number, USER_ID  varchar2(100), HOST_TYPE  varchar2(100), DESCRIPTION  varchar2(4000), CREATED_DATE  date, IN_CONNECTION_IP_ADDRESSES varchar2(2000), OUT_CONNECTION_IP_ADDRESSES varchar2(2000), IN_CONNECTION_OPEN_PORTS varchar2(1000), OUT_CONNECTION_OPEN_PORTS varchar2(1000), IN_CONNECTION_PROTOCOLS  varchar2(1000), OUT_CONNECTION_PROTOCOLS  varchar2(1000))";

createTableSQL="create table uc_host_properties( property_id number, user_id varchar2(100), HOST_ID number, property_name varchar2(100), property_value varchar2(4000), CONSTRAINT host_properties_pk PRIMARY KEY (property_id))";

createTableSQL="create table uc_system_mst( system_id number, seq_mst_id number, sys_seq_id number, user_id varchar2(100), system_name varchar2(2000), image_url varchar2(2000), system_type varchar2(50), description varchar2(4000), host_id number, created_date date, CONSTRAINT system_id_pk PRIMARY KEY (system_id))";
createTableSQL="alter table uc_system_mst alter system_type not null";
createTableSQL="alter table uc_system_mst alter system_name not null";
createTableSQL="alter table uc_system_mst add constraint system_name_check check (system_name<>\"\")";
createTableSQL="alter table uc_system_mst add constraint system_useIdSysName_unique unique (user_id, system_name, system_type)";


createTableSQL="create table uc_request_mst( request_id number, seq_mst_id number, sys_seq_id number, user_id varchar2(100), system_id number, request_protocol varchar2(50), image_url varchar2(2000), request_name varchar2(50), description varchar2(4000), created_date date, CONSTRAINT request_id_pk PRIMARY KEY (request_id))";
createTableSQL="alter table uc_request_mst alter request_name not null";
createTableSQL="alter table uc_request_mst add constraint request_name_check check (request_name <>\"\")";
createTableSQL="alter table uc_request_mst add constraint system_id_check check (system_id<>0)";
createTableSQL="alter table uc_request_mst add constraint request_sysIdResName_unique unique (system_id, request_name)";


createTableSQL="create table uc_response_mst( response_id number, seq_mst_id number, sys_seq_id number, user_id varchar2(100), system_id number, response_protocol varchar2(50), success_image_url varchar2(2000), failure_image_url varchar2(2000), response_name varchar2(50), description varchar2(4000), created_date date, related_request_id number, CONSTRAINT response_id_pk PRIMARY KEY (response_id))";

createTableSQL="alter table uc_response_mst alter response_name not null";
createTableSQL="alter table uc_response_mst add constraint response_name_check check (response_name <>\"\")";
createTableSQL="alter table uc_response_mst add constraint response_system_id_check check (system_id<>0)";
createTableSQL="alter table uc_response_mst add constraint response_sysIdResName_unique unique (system_id, response_name)";
createTableSQL="alter table uc_response_mst add constraint rel_request_unique unique (related_request_id)";
createTableSQL="alter table UC_RESPONSE_MST alter related_request_id not null";

createTableSQL="create table public_seq_access_log( user_id varchar2(100), seq_mst_id number, jsession_id varchar2(40), remote_login_host varchar2(40), remote_login_ipaddress varchar2(40), remote_login_proxy_ipaddress varchar2(100), created_date date, CONSTRAINT seq_access_pk PRIMARY KEY (jsession_id))";

createTableSQL="create table uc_seq_menu_images( menu_item_id number, user_id varchar2(100), menu_item_name varchar2(40), system_type varchar2(50), menu_image_file_name varchar2(40), selected varchar2(1), created_date date, CONSTRAINT menu_item_pk PRIMARY KEY (menu_item_id))";

createTableSQL="create table uc_default_menu_images( menu_item_id number, menu_item_name varchar2(40), system_type varchar2(50), menu_image_file_name varchar2(40), CONSTRAINT default_menu_item_pk PRIMARY KEY (menu_item_id))";
createTableSQL="insert into uc_default_menu_images values(1,\"web_service_gray\",\"web_service_gray\",\"web_service_gray.png\")";
createTableSQL="insert into uc_default_menu_images values(2,\"web_service_external\",\"web_service_external\",\"web_service_external.png\")";
createTableSQL="insert into uc_default_menu_images values(3,\"web_service\",\"web_service\",\"web_service.png\")";
createTableSQL="insert into uc_default_menu_images values(4,\"web_pages\",\"web_pages\",\"web_pages.png\")";
createTableSQL="insert into uc_default_menu_images values(5,\"store_kit_gray\",\"store_kit_gray\",\"store_kit_gray.png\")";
createTableSQL="insert into uc_default_menu_images values(6,\"store_kit_external\",\"store_kit_external\",\"store_kit_external.png\")";
createTableSQL="insert into uc_default_menu_images values(7,\"store_kit\",\"store_kit\",\"store_kit.png\")";
createTableSQL="insert into uc_default_menu_images values(8,\"server_gray\",\"server_gray\",\"server_gray.png\")";
createTableSQL="insert into uc_default_menu_images values(9,\"server_external\",\"server_external\",\"server_external.png\")";
createTableSQL="insert into uc_default_menu_images values(10,\"server\",\"server\",\"server.png\")";
createTableSQL="insert into uc_default_menu_images values(11,\"router_gray\",\"router_gray\",\"router_gray.png\")";
createTableSQL="insert into uc_default_menu_images values(12,\"router_external\",\"router_external\",\"router_external.png\")";
createTableSQL="insert into uc_default_menu_images values(13,\"router\",\"router\",\"router.png\")";
createTableSQL="insert into uc_default_menu_images values(14,\"proxy_server_gray\",\"proxy_server_gray\",\"proxy_server_gray.png\")";
createTableSQL="insert into uc_default_menu_images values(15,\"proxy_server_external\",\"proxy_server_external\",\"proxy_server_external.png\")";
createTableSQL="insert into uc_default_menu_images values(16,\"proxy_server\",\"proxy_server\",\"proxy_server.png\")";
createTableSQL="insert into uc_default_menu_images values(17,\"process_gray\",\"process_gray\",\"process_gray.png\")";
createTableSQL="insert into uc_default_menu_images values(18,\"process_external\",\"process_external\",\"process_external.png\")";
createTableSQL="insert into uc_default_menu_images values(19,\"process\",\"process\",\"process.png\")";
createTableSQL="insert into uc_default_menu_images values(20,\"portal_gray\",\"portal_gray\",\"portal_gray.png\")";
createTableSQL="insert into uc_default_menu_images values(21,\"portal_external\",\"portal_external\",\"portal_external.png\")";
createTableSQL="insert into uc_default_menu_images values(22,\"portal\",\"portal\",\"portal.png\")";
createTableSQL="insert into uc_default_menu_images values(23,\"phone_app_gray\",\"phone_app_gray\",\"phone_app_gray.png\")";
createTableSQL="insert into uc_default_menu_images values(24,\"phone_app_external\",\"phone_app_external\",\"phone_app_external.png\")";
createTableSQL="insert into uc_default_menu_images values(25,\"phone_app\",\"phone_app\",\"phone_app.png\")";
createTableSQL="insert into uc_default_menu_images values(26,\"network_switch_gray\",\"network_switch_gray\",\"network_switch_gray.png\")";
createTableSQL="insert into uc_default_menu_images values(27,\"network_switch_external\",\"network_switch_external\",\"network_switch_external.png\")";
createTableSQL="insert into uc_default_menu_images values(28,\"network_switch\",\"network_switch\",\"network_switch.png\")";
createTableSQL="insert into uc_default_menu_images values(29,\"internet_cloud_gray\",\"internet_cloud_gray\",\"internet_cloud_gray.png\")";
createTableSQL="insert into uc_default_menu_images values(30,\"internet_cloud_external\",\"internet_cloud_external\",\"internet_cloud_external.png\")";
createTableSQL="insert into uc_default_menu_images values(31,\"internet_cloud\",\"internet_cloud\",\"internet_cloud.png\")";
createTableSQL="insert into uc_default_menu_images values(32,\"firewall_gray\",\"firewall_gray\",\"firewall_gray.png\")";
createTableSQL="insert into uc_default_menu_images values(33,\"firewall_external\",\"firewall_external\",\"firewall_external.png\")";
createTableSQL="insert into uc_default_menu_images values(34,\"firewall\",\"firewall\",\"firewall.png\")";
createTableSQL="insert into uc_default_menu_images values(35,\"email_server_gray\",\"email_server_gray\",\"email_server_gray.png\")";
createTableSQL="insert into uc_default_menu_images values(36,\"email_server_external\",\"email_server_external\",\"email_server_external.png\")";
createTableSQL="insert into uc_default_menu_images values(37,\"email_server\",\"email_server\",\"email_server.png\")";
createTableSQL="insert into uc_default_menu_images values(38,\"device\",\"device\",\"device.png\")";
createTableSQL="insert into uc_default_menu_images values(39,\"database_server_gray\",\"database_server_gray\",\"database_server_gray.png\")";
createTableSQL="insert into uc_default_menu_images values(40,\"database_server_external\",\"database_server_external\",\"database_server_external.png\")";
createTableSQL="insert into uc_default_menu_images values(41,\"database_server\",\"database_server\",\"database_server.png\")";

createTableSQL="insert into uc_default_menu_images values(43,\"application_server_gray\",\"application_server_gray\",\"application_server_gray.png\")";
createTableSQL="insert into uc_default_menu_images values(44,\"application_server_external\",\"application_server_external\",\"application_server_external.png\")";
createTableSQL="insert into uc_default_menu_images values(45,\"application_server\",\"application_server\",\"application_server.png\")";
createTableSQL="insert into uc_default_menu_images values(46,\"app_store_gray\",\"app_store_gray\",\"app_store_gray.png\")";
createTableSQL="insert into uc_default_menu_images values(47,\"app_store_external\",\"app_store_external\",\"app_store_external.png\")";
createTableSQL="insert into uc_default_menu_images values(48,\"app_store\",\"app_store\",\"app_store.png\")";
createTableSQL="insert into uc_default_menu_images values(49,\"customer\",\"customer\",\"customer.png\")";
createTableSQL="insert into uc_default_menu_images values(50,\"Customer_gray\",\"Customer_gray\",\"Customer_gray.png\")";
createTableSQL="insert into uc_default_menu_images values(51,\"Customer_external\",\"Customer_external\",\"Customer_external.png\")";



createTableSQL="create table uc_default_menu_user_mst( menu_item_id number, user_id varchar2(100), CONSTRAINT default_menu_user_mst_pk PRIMARY KEY (menu_item_id, user_id))";

createTableSQL="create table uc_user_directory_create_log( user_id  varchar2(100), directory varchar2(400))";

createTableSQL="delete from credential where user_id=\"951471d7-4c39-489f-ba04-c6f488900de2140331234454\;
createTableSQL="delete from UC_REQUEST_MST where user_id=\"951471d7-4c39-489f-ba04-c6f488900de2140331234454\;
createTableSQL="delete from UC_RESPONSE_MST where user_id=\"951471d7-4c39-489f-ba04-c6f488900de2140331234454\;
createTableSQL="delete from SESSION_RECORDS where user_id=\"951471d7-4c39-489f-ba04-c6f488900de2140331234454\;
createTableSQL="delete from UC_SEQ_DIAGRAM where user_id=\"951471d7-4c39-489f-ba04-c6f488900de2140331234454\;
createTableSQL="delete from UC_SEQ_DIAGRAM_PROPERTY where user_id=\"951471d7-4c39-489f-ba04-c6f488900de2140331234454\;
createTableSQL="delete from UC_SEQ_MST where user_id=\"951471d7-4c39-489f-ba04-c6f488900de2140331234454\;
createTableSQL="delete from UC_SYSTEM_MST where user_id=\"951471d7-4c39-489f-ba04-c6f488900de2140331234454\;
createTableSQL="delete from UC_TIP where user_id=\"951471d7-4c39-489f-ba04-c6f488900de2140331234454\;


createTableSQL="create table uc_smtp ( from_email_address varchar2(100) not null, reply_to_email_address varchar2(100) not null, smtp_server varchar2(100) not null, test_status varchar2(100), test_number number)";


createTableSQL="create table uc_seq_mst_release_properties ( property_id number, seq_mst_id number, detect_change_id number, system_id number, property_name varchar2(100), property_value varchar2(4000), CONSTRAINT uc_seq_mst_release_prop_pk PRIMARY KEY (property_id))";




createTableSQL="create table uc_sys_seq_diagram( seq_item_id number, sys_seq_id number, seq_mst_id number, user_id varchar2(100), system_id number, system_new varchar2(1), request_id number, request_new varchar2(1), request_protocol varchar2(50), draft_request_protocol varchar2(50), item_signature varchar2(2000), response_id number, response_new varchar2(1), system_name varchar2(50), system_type varchar2(50), row_no number, col_no number, last_child_row_no number, if_condition varchar2(2000), section_name varchar2(100), request varchar2(100), response varchar2(100), sample_request varchar2(4000), draft_sample_request varchar2(4000),  sample_success_response varchar2(4000), draft_sample_success_response varchar2(4000), sample_failure_response varchar2(4000), draft_sample_failure_response varchar2(4000), ASYNCH_SOURCE_DESTINATION varchar2(20), ASYNCH_SEQ_ITEM_ID number, ASYNCH_ROW_NO number, ASYNCH_COL_NO number, description  varchar2(4000), MENU_IMAGE_URL varchar2(200), CONSTRAINT uc_seqSysItemId_pk PRIMARY KEY (seq_item_id))";

createTableSQL="alter table uc_sys_seq_diagram add UNIQUE (sys_seq_id, row_no, col_no)";
createTableSQL="alter table uc_sys_seq_diagram alter system_id not null";

createTableSQL="alter table uc_sys_seq_diagram alter system_type not null";

createTableSQL="create table uc_sys_seq_diagram_draft( seq_item_id number, sys_seq_id number,  seq_mst_id number, user_id varchar2(100), system_id number, system_new varchar2(1), request_id number, request_new varchar2(1), request_protocol varchar2(50), draft_request_protocol varchar2(50), item_signature varchar2(2000), response_id number, response_new varchar2(1), system_name varchar2(50), system_type varchar2(50), row_no number, col_no number, last_child_row_no number, if_condition varchar2(2000), section_name varchar2(100), request varchar2(100), response varchar2(100), sample_request varchar2(4000), draft_sample_request varchar2(4000),  sample_success_response varchar2(4000), draft_sample_success_response varchar2(4000), sample_failure_response varchar2(4000), draft_sample_failure_response varchar2(4000),  ASYNCH_SOURCE_DESTINATION varchar2(20), ASYNCH_SEQ_ITEM_ID number, ASYNCH_ROW_NO number, ASYNCH_COL_NO number, description  varchar2(4000),  MENU_IMAGE_URL varchar2(200), CONSTRAINT uc_seqSysItemIdDraft_pk PRIMARY KEY (seq_item_id))";

createTableSQL="alter table uc_sys_seq_diagram_draft add UNIQUE (sys_seq_id, row_no, col_no)";
createTableSQL="alter table uc_sys_seq_diagram_draft alter system_id not null";
createTableSQL="alter table uc_sys_seq_diagram_draft alter system_type not null";


createTableSQL="create table uc_sys_seq_diagram_dev_ver( seq_item_id number, sys_seq_id number, seq_mst_id number, user_id varchar2(100), system_id number, system_new varchar2(1), request_id number, request_new varchar2(1), request_protocol varchar2(50), draft_request_protocol varchar2(50), item_signature varchar2(2000), response_id number, response_new varchar2(1), system_name varchar2(50), system_type varchar2(50), row_no number, col_no number, last_child_row_no number, if_condition varchar2(2000), section_name varchar2(100), request varchar2(100), response varchar2(100), sample_request varchar2(4000), draft_sample_request varchar2(4000),  sample_success_response varchar2(4000), draft_sample_success_response varchar2(4000), sample_failure_response varchar2(4000), draft_sample_failure_response varchar2(4000), ASYNCH_SOURCE_DESTINATION varchar2(20), ASYNCH_SEQ_ITEM_ID number, ASYNCH_ROW_NO number, ASYNCH_COL_NO number, description  varchar2(4000), MENU_IMAGE_URL varchar2(200), CONSTRAINT uc_seqSysItemId_devVer_pk PRIMARY KEY (seq_item_id))";

createTableSQL="alter table uc_sys_seq_diagram_dev_ver alter system_id not null";
createTableSQL="alter table uc_sys_seq_diagram_dev_ver alter system_type not null";

createTableSQL="create table uc_sys_seq_diagram_prod( seq_item_id number, sys_seq_id number, seq_mst_id number, user_id varchar2(100), system_id number, system_new varchar2(1), request_id number, request_new varchar2(1), request_protocol varchar2(50), draft_request_protocol varchar2(50), item_signature varchar2(2000), response_id number, response_new varchar2(1), system_name varchar2(50), system_type varchar2(50), row_no number, col_no number, last_child_row_no number, if_condition varchar2(2000), section_name varchar2(100), request varchar2(100), response varchar2(100), sample_request varchar2(4000), draft_sample_request varchar2(4000),  sample_success_response varchar2(4000), draft_sample_success_response varchar2(4000), sample_failure_response varchar2(4000), draft_sample_failure_response varchar2(4000), ASYNCH_SOURCE_DESTINATION varchar2(20), ASYNCH_SEQ_ITEM_ID number, ASYNCH_ROW_NO number, ASYNCH_COL_NO number, description  varchar2(4000), MENU_IMAGE_URL varchar2(200), CONSTRAINT uc_seqSysItemId_prod_pk PRIMARY KEY (seq_item_id))";

createTableSQL="alter table uc_sys_seq_diagram_prod alter system_id not null";

createTableSQL="alter table uc_sys_seq_diagram_prod alter system_type not null";

createTableSQL="create table uc_sys_seq_diagram_prod_ver( seq_item_id number, sys_seq_id number, seq_mst_id number, user_id varchar2(100), system_id number, system_new varchar2(1), request_id number, request_new varchar2(1), request_protocol varchar2(50), draft_request_protocol varchar2(50), item_signature varchar2(2000), response_id number, response_new varchar2(1), system_name varchar2(50), system_type varchar2(50), row_no number, col_no number, last_child_row_no number, if_condition varchar2(2000), section_name varchar2(100), request varchar2(100), response varchar2(100), sample_request varchar2(4000), draft_sample_request varchar2(4000),  sample_success_response varchar2(4000), draft_sample_success_response varchar2(4000), sample_failure_response varchar2(4000), draft_sample_failure_response varchar2(4000), ASYNCH_SOURCE_DESTINATION varchar2(20), ASYNCH_SEQ_ITEM_ID number, ASYNCH_ROW_NO number, ASYNCH_COL_NO number, description  varchar2(4000), MENU_IMAGE_URL varchar2(200), CONSTRAINT uc_seqSysItemId_prodVer_pk PRIMARY KEY (seq_item_id))";

createTableSQL="alter table uc_sys_seq_diagram_prod_ver alter system_id not null";
createTableSQL="alter table uc_sys_seq_diagram_prod_ver alter system_type not null";

createTableSQL="create table uc_sys_seq_mst_draft( sys_seq_id number, base_sys_seq_id number, across_version_sys_seq_id varchar2(100) not null, across_dev_version_sys_seq_id varchar2(100) not null, for_request_id number, change_set_id number, change_title varchar2(100), change_note varchar2(2000), is_edited varchar2(1), edited_by varchar2(100), user_id varchar2(100), edited_date date, created_date date, is_public varchar2(1), is_repo varchar2(1), one_way varchar2(1), default_menu varchar2(1), MENU_IMAGE_URL varchar2(200), cat_id number not null, access varchar2(4000), LINK_SHARE_DATE_FACEBOOK date, LINK_SHARE_DATE_TWITTER date, LINK_SHARE_DATE_GPLUS date, LINK_SHARE_DATE_LINKIN date, LINK_SECURE_DATE date, CONSTRAINT uc_sys_seq_id_draft_pk PRIMARY KEY (sys_seq_id))";


createTableSQL="alter table UC_SYS_SEQ_MST_DRAFT add UNIQUE (for_request_id)";



createTableSQL="create table uc_sys_seq_release_draft ( detect_change_id number, sys_seq_id number, request_id number, parent_requestId number, parent_sys_seq_id number, sequence_version varchar2(50), change_type varchar2(50), change_title varchar2(400), system_id number, item_signature_from varchar2(2000), item_signature_to varchar2(2000), change_desc_from varchar2(4000), change_desc_to varchar2(10000), comments varchar2(4000), system_note varchar2(4000), status varchar2(50), release_date date, user_id varchar2(100), CONSTRAINT uc_sys_seq_rel_draft_curr_pk PRIMARY KEY (detect_change_id))";

createTableSQL="alter table uc_sys_seq_release_draft add UNIQUE (sys_seq_id, request_id, change_type, parent_requestId,parent_sys_seq_id, sequence_version)";

createTableSQL="create table uc_sys_seq_mst( sys_seq_id number, base_sys_seq_id number, across_version_sys_seq_id varchar2(100) not null, across_dev_version_sys_seq_id varchar2(100) not null, for_request_id number, change_set_id number, change_title varchar2(100), change_note varchar2(2000), is_edited varchar2(1), edited_by varchar2(100), user_id varchar2(100), edited_date date, created_date date, is_public varchar2(1), is_repo varchar2(1), one_way varchar2(1), default_menu varchar2(1), MENU_IMAGE_URL varchar2(200), cat_id number not null, access varchar2(4000), LINK_SHARE_DATE_FACEBOOK date, LINK_SHARE_DATE_TWITTER date, LINK_SHARE_DATE_GPLUS date, LINK_SHARE_DATE_LINKIN date, LINK_SECURE_DATE date, CONSTRAINT uc_sys_seq_id_curr_pk PRIMARY KEY (sys_seq_id))";

createTableSQL="alter table UC_SYS_SEQ_MST alter for_request_id not null";
createTableSQL="alter table UC_SYS_SEQ_MST add UNIQUE (for_request_id)";
createTableSQL="create table uc_sys_seq_release ( detect_change_id number, sys_seq_id number, request_id number, parent_requestId number, parent_sys_seq_id number, sequence_version varchar2(50), change_type varchar2(50), change_title varchar2(400), system_id number, item_signature_from varchar2(2000), item_signature_to varchar2(2000), change_desc_from varchar2(4000), change_desc_to varchar2(10000), comments varchar2(4000), system_note varchar2(4000), status varchar2(50), release_date date, user_id varchar2(100), CONSTRAINT uc_sys_seq_release_curr_pk PRIMARY KEY (detect_change_id))";
createTableSQL="alter table uc_sys_seq_release add UNIQUE (sys_seq_id, request_id, change_type, parent_requestId, parent_sys_seq_id, sequence_version)";

createTableSQL="create table uc_sys_seq_mst_dev_version( sys_seq_id number, base_sys_seq_id number, current_dev_sys_seq_id number, across_version_sys_seq_id varchar2(100)  not null, across_dev_version_sys_seq_id varchar2(100) not null, for_request_id number, change_set_id number, change_title varchar2(100), change_note varchar2(2000), is_edited varchar2(1), edited_by varchar2(100), user_id varchar2(100), edited_date date, created_date date, is_public varchar2(1), is_repo varchar2(1), one_way varchar2(1), default_menu varchar2(1), MENU_IMAGE_URL varchar2(200), cat_id number not null, access varchar2(4000), LINK_SHARE_DATE_FACEBOOK date, LINK_SHARE_DATE_TWITTER date, LINK_SHARE_DATE_GPLUS date, LINK_SHARE_DATE_LINKIN date, LINK_SECURE_DATE date, CONSTRAINT uc_sys_seq_id_curr_ver_pk PRIMARY KEY (sys_seq_id))";
createTableSQL="alter table UC_SYS_SEQ_MST_DEV_VERSION alter for_request_id not null";

createTableSQL="create table uc_sys_seq_release_dev_ver ( detect_change_id number, sys_seq_id number, request_id number, parent_requestId number, parent_sys_seq_id number, sequence_version varchar2(50), change_type varchar2(50), change_title varchar2(400), system_id number, item_signature_from varchar2(2000), item_signature_to varchar2(2000), change_desc_from varchar2(4000), change_desc_to varchar2(10000), comments varchar2(4000), system_note varchar2(4000), status varchar2(50), release_date date, user_id varchar2(100), CONSTRAINT uc_sys_seq_release_devVer_pk PRIMARY KEY (detect_change_id))";
createTableSQL="alter table uc_sys_seq_release_dev_ver add UNIQUE (sys_seq_id, request_id, change_type, parent_requestId,parent_sys_seq_id, sequence_version)";

createTableSQL="create table uc_sys_seq_mst_prod( sys_seq_id number, across_version_sys_seq_id varchar2(100), across_dev_version_sys_seq_id varchar2(100), for_request_id number, change_set_id number, change_title varchar2(100), change_note varchar2(2000), is_edited varchar2(1), edited_by varchar2(100), user_id varchar2(100), edited_date date, created_date date, is_public varchar2(1), is_repo varchar2(1), one_way varchar2(1), default_menu varchar2(1), MENU_IMAGE_URL varchar2(200), cat_id number not null, LINK_SHARE_DATE_FACEBOOK date, LINK_SHARE_DATE_TWITTER date, LINK_SHARE_DATE_GPLUS date, LINK_SHARE_DATE_LINKIN date, LINK_SECURE_DATE date, CONSTRAINT uc_sys_seq_id_prod_pk PRIMARY KEY (sys_seq_id))";

createTableSQL="alter table UC_SYS_SEQ_MST_PROD alter for_request_id not null";

createTableSQL="create table uc_sys_seq_release_prod ( detect_change_id number, sys_seq_id number, request_id number, parent_requestId number, parent_sys_seq_id number, sequence_version varchar2(50), change_type varchar2(50), change_title varchar2(400), system_id number, item_signature_from varchar2(2000), item_signature_to varchar2(2000), change_desc_from varchar2(4000), change_desc_to varchar2(10000), comments varchar2(4000), system_note varchar2(4000), status varchar2(50), release_date date, user_id varchar2(100), CONSTRAINT uc_sys_seq_release_prod_pk PRIMARY KEY (detect_change_id))";
createTableSQL="alter table uc_sys_seq_release_prod add UNIQUE (sys_seq_id, request_id, change_type, parent_requestId, parent_sys_seq_id, sequence_version)";

createTableSQL="create table uc_sys_seq_mst_prod_version( sys_seq_id number, across_version_sys_seq_id varchar2(100), across_dev_version_sys_seq_id varchar2(100), for_request_id number, change_set_id number, change_title varchar2(100), change_note varchar2(2000), is_edited varchar2(1), edited_by varchar2(100), user_id varchar2(100), edited_date date, created_date date, is_public varchar2(1), is_repo varchar2(1), one_way varchar2(1), default_menu varchar2(1), MENU_IMAGE_URL varchar2(200), cat_id number not null, LINK_SHARE_DATE_FACEBOOK date, LINK_SHARE_DATE_TWITTER date, LINK_SHARE_DATE_GPLUS date, LINK_SHARE_DATE_LINKIN date, LINK_SECURE_DATE date, CONSTRAINT uc_sys_seq_id_prod_ver_pk PRIMARY KEY (sys_seq_id))";

createTableSQL="alter table UC_SYS_SEQ_MST_PROD_VERSION alter for_request_id not null";

createTableSQL="create table uc_sys_seq_release_prod_ver ( detect_change_id number, sys_seq_id number, request_id number, parent_requestId number, parent_sys_seq_id number, sequence_version varchar2(50), change_type varchar2(50), change_title varchar2(400), system_id number, item_signature_from varchar2(2000), item_signature_to varchar2(2000), change_desc_from varchar2(4000), change_desc_to varchar2(10000), comments varchar2(4000), system_note varchar2(4000), status varchar2(50), release_date date, user_id varchar2(100), CONSTRAINT uc_sys_seq_release_prodVer_pk PRIMARY KEY (detect_change_id))";
createTableSQL="alter table uc_sys_seq_release_prod_ver add UNIQUE (sys_seq_id, request_id, change_type, parent_requestId, parent_sys_seq_id, sequence_version)";
createTableSQL="create table category ( id number, cat_name varchar2(200), cat_access varchar2(4000), cat_description varchar2(1000), CONSTRAINT id_category_pk PRIMARY KEY(id))";
createTableSQL="insert into category values(0,\"Sandbox\", \"team_97e96294-e162-4334-9a16-6b12cec8b19c160608061723_OW\", \"Try some sequences\")";


createTableSQL="create table team ( id varchar2(100), team_name varchar2(200), team_description varchar2(1000), CONSTRAINT id_team_pk PRIMARY KEY(id))";
createTableSQL="insert into team values(\"97e96294-e162-4334-9a16-6b12cec8b19c160608061723\",\"Enterprise Architect\", \"Enterprise Architect team\")";

createTableSQL="create table uc_seq_diagram_draft_audit( id number, operation varchar2(100), seq_item_id number, seq_mst_id number, user_id varchar2(100), system_id number, system_new varchar2(1), request_id number, request_new varchar2(1), request_protocol varchar2(50), draft_request_protocol varchar2(50), item_signature varchar2(2000), response_id number, response_new varchar2(1), system_name varchar2(50), system_type varchar2(50), row_no number, col_no number, last_child_row_no number, if_condition varchar2(2000), section_name varchar2(100), request varchar2(100), response varchar2(100), sample_request varchar2(4000), draft_sample_request varchar2(4000), sample_success_response varchar2(4000), draft_sample_success_response varchar2(4000), sample_failure_response varchar2(4000), draft_sample_failure_response varchar2(4000), ASYNCH_SOURCE_DESTINATION varchar2(20), ASYNCH_SEQ_ITEM_ID number, ASYNCH_ROW_NO number, ASYNCH_COL_NO number, description  varchar2(4000), MENU_IMAGE_URL varchar2(200), created_date date, error  varchar2(4000), CONSTRAINT uc_audit_Id_draft_pk PRIMARY KEY (id))";


