connect 'jdbc:derby:qdb;create=true';

CREATE Table seq_mst(seq_id varchar(30),SEQUENCE_NEXT_HI_VALUE  bigint);
	
create table uc_seq_mst(seq_mst_id numeric,base_seq_mst_id bigint,cat_id bigint not null,access_priv varchar(4000),change_set_id bigint,change_title varchar(100),change_note varchar(2000),across_version_seq_id varchar(100),across_dev_version_seq_id varchar(100),seq_name varchar(100),system_id bigint,system_name varchar(50),seq_description varchar(4000),system_type varchar(50),uc_id bigint,is_edited varchar(1),edited_by varchar(100),user_id varchar(100),edited_date timestamp,created_date timestamp,is_public varchar(1),is_repo varchar(1),one_way varchar(1),default_menu varchar(1),MENU_IMAGE_URL varchar(200),LINK_SHARE_DATE_FACEBOOK timestamp,LINK_SHARE_DATE_TWITTER timestamp,LINK_SHARE_DATE_GPLUS timestamp,LINK_SHARE_DATE_LINKIN timestamp,LINK_SECURE_DATE timestamp,CONSTRAINT uc_seqMstId_pk PRIMARY KEY (seq_mst_id));

alter table uc_seq_mst add constraint dev_is_edited_check check (is_edited='N');

create table uc_seq_release
(
detect_change_id numeric,
seq_mst_id bigint,  
request_id bigint,
parent_requestId bigint,
parent_seq_mst_id bigint,
sequence_version varchar(50),
change_type varchar(50),
change_title varchar(400),
system_id bigint, 
item_signature_from varchar(2000), 
item_signature_to varchar(2000), 
change_desc_from varchar(4000), 
change_desc_to varchar(10000),
comments varchar(4000), 
system_note varchar(4000),
status varchar(50),
release_date timestamp,
user_id varchar(100),
CONSTRAINT uc_seq_release_dev_pk PRIMARY KEY (detect_change_id)
);

alter table uc_seq_release add UNIQUE (seq_mst_id, request_id,parent_requestId,parent_seq_mst_id, change_type, sequence_version);



create table uc_seq_mst_draft(
seq_mst_id numeric,
base_seq_mst_id bigint,
cat_id bigint not null, 
access_priv varchar(4000),
change_set_id bigint, 
change_title varchar(100),
change_note varchar(2000), 
across_version_seq_id varchar(100),
across_dev_version_seq_id varchar(100),
seq_name varchar(100),
system_id bigint,
system_name varchar(50),
seq_description varchar(4000),
system_type varchar(50),
uc_id bigint,
is_edited varchar(1),
edited_by varchar(100),
user_id varchar(100),
edited_date timestamp,
created_date timestamp,
is_public varchar(1),
is_repo varchar(1),
one_way varchar(1),
default_menu varchar(1),
MENU_IMAGE_URL varchar(200),
LINK_SHARE_DATE_FACEBOOK timestamp,
LINK_SHARE_DATE_TWITTER timestamp,
LINK_SHARE_DATE_GPLUS timestamp,
LINK_SHARE_DATE_LINKIN timestamp,
LINK_SECURE_DATE timestamp,
CONSTRAINT uc_seqMstDraftId_draft_pk PRIMARY KEY (seq_mst_id)
);
alter table uc_seq_mst_draft alter seq_name not null;
create table uc_seq_release_draft
(
detect_change_id numeric,
seq_mst_id bigint,  
request_id bigint,
parent_requestId bigint,
parent_seq_mst_id bigint,
sequence_version varchar(50),
change_type varchar(50),
change_title varchar(400),
system_id bigint, 
item_signature_from varchar(2000), 
item_signature_to varchar(2000), 
change_desc_from varchar(4000), 
change_desc_to varchar(10000),
comments varchar(4000), 
system_note varchar(4000),
status varchar(50),
release_date timestamp,
user_id varchar(100),
CONSTRAINT uc_seq_release_draft_dev_pk PRIMARY KEY (detect_change_id)
);

alter table uc_seq_release_draft add UNIQUE (seq_mst_id, request_id, parent_requestId,parent_seq_mst_id, change_type,  sequence_version);


create table uc_seq_mst_dev_version(
seq_mst_id numeric,
base_seq_mst_id bigint,
cat_id bigint not null, 
access_priv varchar(4000),
across_dev_version_seq_id varchar(100),
change_set_id bigint,
change_title varchar(100), 
change_note varchar(2000), 
across_version_seq_id varchar(100),
seq_name varchar(100),
system_id bigint,
system_name varchar(50),
seq_description varchar(4000),
system_type varchar(50),
uc_id bigint,
is_edited varchar(1),
edited_by varchar(100),
user_id varchar(100),
edited_date timestamp,
created_date timestamp,
is_public varchar(1),
is_repo varchar(1),
one_way varchar(1),
default_menu varchar(1),
MENU_IMAGE_URL varchar(200),
LINK_SHARE_DATE_FACEBOOK timestamp,
LINK_SHARE_DATE_TWITTER timestamp,
LINK_SHARE_DATE_GPLUS timestamp,
LINK_SHARE_DATE_LINKIN timestamp,
LINK_SECURE_DATE timestamp,
CONSTRAINT uc_seqMstId_devVer_pk PRIMARY KEY (seq_mst_id)
);
alter table uc_seq_mst_dev_version add constraint dev_ver_is_edited_check check (is_edited='N');

create table uc_seq_release_dev_version
(
detect_change_id numeric,
seq_mst_id bigint,  
request_id bigint,
parent_requestId bigint,
parent_seq_mst_id bigint,
sequence_version varchar(50),
change_type varchar(50),
change_title varchar(400),
system_id bigint, 
item_signature_from varchar(2000), 
item_signature_to varchar(2000), 
change_desc_from varchar(4000), 
change_desc_to varchar(10000),
comments varchar(4000), 
system_note varchar(4000),
status varchar(50),
release_date timestamp,
user_id varchar(100),
CONSTRAINT uc_seq_release_devVer_pk PRIMARY KEY (detect_change_id)
);

alter table uc_seq_release_dev_version add UNIQUE (seq_mst_id, request_id, parent_requestId, parent_seq_mst_id, change_type,  sequence_version);


create table uc_seq_mst_prod(
seq_mst_id numeric,
base_seq_mst_id bigint,
cat_id bigint not null, 
change_set_id bigint,
change_title varchar(100),
change_note varchar(2000),
across_version_seq_id varchar(100),
across_dev_version_seq_id varchar(100),
seq_name varchar(100),
system_id bigint,
system_name varchar(50),
seq_description varchar(4000),
system_type varchar(50),
uc_id bigint,
is_edited varchar(1),
edited_by varchar(100),
user_id varchar(100),
edited_date timestamp,
created_date timestamp,
is_public varchar(1),
is_repo varchar(1),
one_way varchar(1),
default_menu varchar(1),
MENU_IMAGE_URL varchar(200),
LINK_SHARE_DATE_FACEBOOK timestamp,
LINK_SHARE_DATE_TWITTER timestamp,
LINK_SHARE_DATE_GPLUS timestamp,
LINK_SHARE_DATE_LINKIN timestamp,
LINK_SECURE_DATE timestamp,
CONSTRAINT uc_seqMstId_prod_pk PRIMARY KEY (seq_mst_id)
);

alter table uc_seq_mst_prod add constraint is_edited_check check (is_edited='N');


create table uc_seq_release_prod
(
detect_change_id numeric,
seq_mst_id bigint,  
request_id bigint,
parent_requestId bigint,
parent_seq_mst_id bigint,
sequence_version varchar(50),
change_type varchar(50),
change_title varchar(400),
system_id bigint, 
item_signature_from varchar(2000), 
item_signature_to varchar(2000), 
change_desc_from varchar(4000), 
change_desc_to varchar(10000),
comments varchar(4000), 
system_note varchar(4000),
status varchar(50),
release_date timestamp,
user_id varchar(100),
CONSTRAINT uc_seq_release_prod_pk PRIMARY KEY (detect_change_id)
);

alter table uc_seq_release_prod add UNIQUE (seq_mst_id, request_id,parent_requestId, parent_seq_mst_id, change_type, sequence_version);


create table uc_seq_mst_prod_version(
seq_mst_id numeric,
base_seq_mst_id bigint,
cat_id bigint not null,  
change_set_id bigint,
change_title varchar(100),
change_note varchar(2000),
across_version_seq_id varchar(100),
across_dev_version_seq_id varchar(100),
seq_name varchar(100),
system_id bigint,
system_name varchar(50),
seq_description varchar(4000),
system_type varchar(50),
uc_id bigint,
is_edited varchar(1),
edited_by varchar(100),
user_id varchar(100),
edited_date timestamp,
created_date timestamp,
is_public varchar(1),
is_repo varchar(1),
one_way varchar(1),
default_menu varchar(1),
MENU_IMAGE_URL varchar(200),
LINK_SHARE_DATE_FACEBOOK timestamp,
LINK_SHARE_DATE_TWITTER timestamp,
LINK_SHARE_DATE_GPLUS timestamp,
LINK_SHARE_DATE_LINKIN timestamp,
LINK_SECURE_DATE timestamp,
CONSTRAINT uc_seqMstId_prodVer_pk PRIMARY KEY (seq_mst_id)
);

alter table uc_seq_mst_prod_version add constraint is_edited_check check (is_edited='N');

create table uc_seq_release_prod_version
(
detect_change_id numeric,
seq_mst_id bigint,  
request_id bigint,
parent_requestId bigint,
parent_seq_mst_id bigint,
sequence_version varchar(50),
change_type varchar(50),
change_title varchar(400),
system_id bigint, 
item_signature_from varchar(2000), 
item_signature_to varchar(2000), 
change_desc_from varchar(4000), 
change_desc_to varchar(10000),
comments varchar(4000), 
system_note varchar(4000),
status varchar(50),
release_date timestamp,
user_id varchar(100),
CONSTRAINT uc_seq_release_prodVer_pk PRIMARY KEY (detect_change_id)
);

alter table uc_seq_release_prod_version add UNIQUE (seq_mst_id, request_id,parent_requestId, parent_seq_mst_id, change_type, sequence_version);

 
create table uc_seq_diagram(
seq_item_id numeric,
seq_mst_id bigint,
user_id varchar(100),
system_id bigint,
system_new varchar(1),
request_id bigint,
request_new varchar(1),
request_protocol varchar(50),
draft_request_protocol varchar(50),
item_signature varchar(2000),
response_id bigint,
response_new varchar(1),
system_name varchar(50),
system_type varchar(50),
row_no bigint,
col_no bigint,
last_child_row_no bigint,
if_condition varchar(2000),
section_name varchar(100),
request varchar(100),
response varchar(100),
sample_request varchar(4000),
draft_sample_request varchar(4000),  
sample_success_response varchar(4000),
draft_sample_success_response varchar(4000), 
sample_failure_response varchar(4000),
draft_sample_failure_response varchar(4000), 
ASYNCH_SOURCE_DESTINATION varchar(20),
ASYNCH_SEQ_ITEM_ID bigint,
ASYNCH_ROW_NO bigint,
ASYNCH_COL_NO bigint,
description  varchar(4000),  
MENU_IMAGE_URL varchar(200),
CONSTRAINT uc_seqItemId_pk PRIMARY KEY (seq_item_id)
);


alter table uc_seq_diagram alter system_id not null;
alter table uc_seq_diagram alter system_type not null;

create table uc_seq_diagram_draft(
seq_item_id numeric,
seq_mst_id bigint,
user_id varchar(100),
system_id bigint,
system_new varchar(1),
request_id bigint,
request_new varchar(1),
request_protocol varchar(50), 
draft_request_protocol varchar(50), 
item_signature varchar(2000),
response_id bigint,
response_new varchar(1),
system_name varchar(50),
system_type varchar(50),
row_no bigint,
col_no bigint,
last_child_row_no bigint,
if_condition varchar(2000),
section_name varchar(100),
request varchar(100),
response varchar(100),
sample_request varchar(4000),
draft_sample_request varchar(4000), 
sample_success_response varchar(4000),
draft_sample_success_response varchar(4000), 
sample_failure_response varchar(4000),
draft_sample_failure_response varchar(4000), 
ASYNCH_SOURCE_DESTINATION varchar(20),
ASYNCH_SEQ_ITEM_ID bigint,
ASYNCH_ROW_NO bigint,
ASYNCH_COL_NO bigint,
description  varchar(4000), 
MENU_IMAGE_URL varchar(200),
CONSTRAINT uc_seqItemId_draft_pk PRIMARY KEY (seq_item_id)
);

alter table uc_seq_diagram add UNIQUE (seq_mst_id, row_no, col_no);
alter table uc_seq_diagram_draft alter system_id not null;
alter table uc_seq_diagram_draft alter system_type not null;


create table uc_seq_diagram_dev_version(
seq_item_id numeric,
seq_mst_id bigint,
user_id varchar(100),
system_id bigint,
system_new varchar(1),
request_id bigint,
request_new varchar(1),
request_protocol varchar(50), 
draft_request_protocol varchar(50), 
item_signature varchar(2000),
response_id bigint,
response_new varchar(1),
system_name varchar(50),
system_type varchar(50),
row_no bigint,
col_no bigint,
last_child_row_no bigint,
if_condition varchar(2000),
section_name varchar(100),
request varchar(100),
response varchar(100),
sample_request varchar(4000),
draft_sample_request varchar(4000), 
sample_success_response varchar(4000),
draft_sample_success_response varchar(4000), 
sample_failure_response varchar(4000),
draft_sample_failure_response varchar(4000), 
ASYNCH_SOURCE_DESTINATION varchar(20),
ASYNCH_SEQ_ITEM_ID bigint,
ASYNCH_ROW_NO bigint,
ASYNCH_COL_NO bigint,
description  varchar(4000), 
MENU_IMAGE_URL varchar(200),
CONSTRAINT uc_seqItemId_devVer_pk PRIMARY KEY (seq_item_id)
);

alter table uc_seq_diagram_draft alter system_id not null;

alter table uc_seq_diagram_draft alter system_type not null;


create table uc_seq_diagram_prod(
seq_item_id numeric,
seq_mst_id bigint,
user_id varchar(100),
system_id bigint,
system_new varchar(1),
request_id bigint,
request_new varchar(1),
request_protocol varchar(50), 
draft_request_protocol varchar(50), 
item_signature varchar(2000),
response_id bigint,
response_new varchar(1),
system_name varchar(50),
system_type varchar(50),
row_no bigint,
col_no bigint,
last_child_row_no bigint,
if_condition varchar(2000),
section_name varchar(100),
request varchar(100),
response varchar(100),
sample_request varchar(4000),
draft_sample_request varchar(4000), 
sample_success_response varchar(4000),
draft_sample_success_response varchar(4000), 
sample_failure_response varchar(4000),
draft_sample_failure_response varchar(4000), 
ASYNCH_SOURCE_DESTINATION varchar(20),
ASYNCH_SEQ_ITEM_ID bigint,
ASYNCH_ROW_NO bigint,
ASYNCH_COL_NO bigint,
description  varchar(4000), 
MENU_IMAGE_URL varchar(200),
CONSTRAINT uc_seqItemId_prod_pk PRIMARY KEY (seq_item_id)
);
alter table uc_seq_diagram_prod alter system_id not null;

alter table uc_seq_diagram_prod alter system_type not null;

create table uc_seq_diagram_prod_version(
seq_item_id numeric,
seq_mst_id bigint,
user_id varchar(100),
system_id bigint,
system_new varchar(1),
request_id bigint,
request_new varchar(1),
request_protocol varchar(50), 
draft_request_protocol varchar(50), 
item_signature varchar(2000),
response_id bigint,
response_new varchar(1),
system_name varchar(50),
system_type varchar(50),
row_no bigint,
col_no bigint,
last_child_row_no bigint,
if_condition varchar(2000),
section_name varchar(100),
request varchar(100),
response varchar(100),
sample_request varchar(4000),
draft_sample_request varchar(4000), 
sample_success_response varchar(4000),
draft_sample_success_response varchar(4000), 
sample_failure_response varchar(4000),
draft_sample_failure_response varchar(4000), 
ASYNCH_SOURCE_DESTINATION varchar(20),
ASYNCH_SEQ_ITEM_ID bigint,
ASYNCH_ROW_NO bigint,
ASYNCH_COL_NO bigint,
description  varchar(4000),  
MENU_IMAGE_URL varchar(200),
CONSTRAINT uc_seqItemId_prodVer_pk PRIMARY KEY (seq_item_id)
);
alter table uc_seq_diagram_prod_version alter system_id not null;
alter table uc_seq_diagram_prod_version alter system_type not null;

	create table CREDENTIAL(
	id numeric,
	user_id varchar(100),
	user_type varchar(100),
	team_id varchar(4000),
	user_name_email varchar(100),
	first_name varchar(100),
	last_name varchar(100),
	password varchar(200),
	temp_password varchar(200),
	temp_password_expiry timestamp,
	salt  varchar(100),
	phone varchar(35),
	mobile varchar(15),
	company varchar(100),
	terms_of_use_accepted varchar(1),
	updated_date timestamp,
	created_date timestamp,
	created_by varchar(100),
	updated_by varchar(100),
	default_menu varchar(1),
	user_name	varchar(100),
	question1 varchar(200),
	answer1 varchar(200),
	question2 varchar(200),
	answer2 varchar(200),
	question3 varchar(200),
	answer3 varchar(200),
	source varchar(200),
	CONSTRAINT credential_Id_pk PRIMARY KEY (id)
	);
	
	insert into CREDENTIAL(
	id,
	user_id,
	user_type,
	team_id,
	user_name_email,
	first_name,
	last_name,
	password,
	temp_password,
	temp_password_expiry,
	salt,
	phone,
	mobile,
	company,
	terms_of_use_accepted,
	updated_date,
	created_date,
	created_by,--
	updated_by,--
	default_menu,
	user_name
	)values(0,	'95ce9a8a-a9cb-4a5a-9971-055018431b2a160608062116','ENTERPRISE_ARCHITECT','team_97e96294-e162-4334-9a16-6b12cec8b19c160608061723_PT',null,null,null,
	'YQbmBRJBI4FS/P2I7zFs4BZV/Gw/0MsjW0UyZ4Kt4q6OGgDs1rEiCFYCIrUgpDnI8dNLP7bl54iR
x+maw9Vx/Q==',null,null,'AOJDS/r10u8=',null,null,null,'0',null,null,null,null,'Y','admin');

	create table CREDENTIAL_ACCESS_CHANGE_LOG(
	changed_by varchar(100),
	changed_for varchar(100),
	access_change_from varchar(100),
	access_change_to varchar(100),
	record_created_date timestamp
	);

create table session_records(
session_id numeric,
user_id varchar(100),
jsession_id varchar(40),
remote_login_host varchar(40),
remote_login_ipaddress varchar(40),
remote_login_proxy_ipaddress varchar(100),
created_date timestamp,
logoff_date timestamp,
sessionExpired_or_LoggedOff varchar(40),
CONSTRAINT session_sessionId_pk PRIMARY KEY (session_id)
);


create table product_mst(
product_id numeric,
product_name varchar(50),
CONSTRAINT product_id_pk PRIMARY KEY (product_id)
);


create table product_feature(
product_feature_id numeric,
product_id bigint,
feature_name varchar(50),
feature_value varchar(50),
CONSTRAINT product_feature_id_pk PRIMARY KEY (product_feature_id)
);


create table customer_subscription(
subscription_id numeric,
product_feature_id bigint,
customer_id varchar(100),
product_key varchar(500),
previous_product_key varchar(500),
downgrade_key  varchar(500),
start_date timestamp,
end_date timestamp,
license_type varchar(100),
status varchar(20),
CONSTRAINT subscription_id_pk PRIMARY KEY (subscription_id)
);

create table customer_transactions(
transaction_id numeric,
subscription_id bigint,
product_feature_id bigint,
customer_id varchar(100),
product_key varchar(500),
transaction_date timestamp,
status varchar(50),
CONSTRAINT transaction_id_pk PRIMARY KEY (transaction_id)
);

--=========================PRODUCT CONFIGURATION=================
--inserting into PRODUCT_MST
insert into product_mst (product_id,  product_name)
values(1, 'qSequence');

--'#TRIAL_START_DATE#', '#CUSTOMER_ID#', '#PRODUCT_KEY#', '#STATUS#'

--inserting into feature_mst

insert into product_feature (product_feature_id, product_id, feature_name, feature_value)
values(1, 1, 'NUMBER_OF_USERS', '10');
insert into product_feature (product_feature_id, product_id, feature_name, feature_value)
values(2, 1, 'NUMBER_OF_USERS', '15');
insert into product_feature (product_feature_id, product_id, feature_name, feature_value)
values(3, 1, 'NUMBER_OF_USERS', '25');
insert into product_feature (product_feature_id, product_id, feature_name, feature_value)
values(4, 1, 'NUMBER_OF_USERS', '50');
insert into product_feature (product_feature_id, product_id, feature_name, feature_value)
values(5, 1, 'NUMBER_OF_USERS', '100');
insert into product_feature (product_feature_id, product_id, feature_name, feature_value)
values(6, 1, 'NUMBER_OF_USERS', '500');
insert into product_feature (product_feature_id, product_id, feature_name, feature_value)
values(7, 1, 'NUMBER_OF_USERS', '1000');
insert into product_feature (product_feature_id, product_id, feature_name, feature_value)
values(8, 1, 'NUMBER_OF_USERS', '2000');
insert into product_feature (product_feature_id, product_id, feature_name, feature_value)
values(9, 1, 'NUMBER_OF_USERS', '3000');
insert into product_feature (product_feature_id, product_id, feature_name, feature_value)
values(10, 1, 'NUMBER_OF_USERS', '4000');
insert into product_feature (product_feature_id, product_id, feature_name, feature_value)
values(11, 1, 'NUMBER_OF_USERS', '5000');
insert into product_feature (product_feature_id, product_id, feature_name, feature_value)
values(12, 1, 'NUMBER_OF_USERS', '6000');
insert into product_feature (product_feature_id, product_id, feature_name, feature_value)
values(13, 1, 'NUMBER_OF_USERS', '7000');
insert into product_feature (product_feature_id, product_id, feature_name, feature_value)
values(14, 1, 'NUMBER_OF_USERS', '8000');
insert into product_feature (product_feature_id, product_id, feature_name, feature_value)
values(15, 1, 'NUMBER_OF_USERS', '9000');
insert into product_feature (product_feature_id, product_id, feature_name, feature_value)
values(16, 1, 'NUMBER_OF_USERS', '10000');
insert into product_feature (product_feature_id, product_id, feature_name, feature_value)
values(17, 1, 'NUMBER_OF_USERS', '15000');
insert into product_feature (product_feature_id, product_id, feature_name, feature_value)
values(18, 1, 'NUMBER_OF_USERS', '20000');
insert into product_feature (product_feature_id, product_id, feature_name, feature_value)
values(19, 1, 'NUMBER_OF_USERS', '25000');
insert into product_feature (product_feature_id, product_id, feature_name, feature_value)
values(20, 1, 'NUMBER_OF_USERS', '30000');
insert into product_feature (product_feature_id, product_id, feature_name, feature_value)
values(21, 1, 'NUMBER_OF_USERS', '35000');
insert into product_feature (product_feature_id, product_id, feature_name, feature_value)
values(22, 1, 'NUMBER_OF_USERS', '40000');
insert into product_feature (product_feature_id, product_id, feature_name, feature_value)
values(23, 1, 'NUMBER_OF_USERS', '45000');
insert into product_feature (product_feature_id, product_id, feature_name, feature_value)
values(24, 1, 'NUMBER_OF_USERS', '50000');
insert into product_feature (product_feature_id, product_id, feature_name, feature_value)
values(25, 1, 'NUMBER_OF_USERS', '50000+');


insert into customer_subscription(SUBSCRIPTION_ID,PRODUCT_FEATURE_ID,CUSTOMER_ID,PRODUCT_KEY,
						DOWNGRADE_KEY,START_DATE,END_DATE,LICENSE_TYPE,STATUS,PREVIOUS_PRODUCT_KEY)
values(1, #PRODUCT_FEATURE_ID#, '#CUSTOMER_ID#', '#PRODUCT_KEY#', null, TIMESTAMP('#START_DATE#'), null,
		'#LICENSE_TYPE#', 'SUCCESSFUL', null);

insert into customer_transactions(transaction_id, subscription_id, product_feature_id, customer_id, product_key, transaction_date, status)
values(99999, 1, #PRODUCT_FEATURE_ID#, '#CUSTOMER_ID#', '#PRODUCT_KEY#',TIMESTAMP('#START_DATE#'), '#LICENSE_TYPE#');
		
		
create table pay_pal_details(
username varchar(150),
password varchar(50),
apisignature varchar(150),
environment varchar(50),
encripted varchar(10),
status varchar(10),
CONSTRAINT pay_pal_details_username_pk PRIMARY KEY (username)
);


create table buy_details(
buy_enquiry_id numeric,
user_id varchar(100),
user_name_email varchar(100),
first_name varchar(100),
last_name varchar(100),
phone varchar(35),
mobile varchar(15),
company varchar(100),
updated_date timestamp,
message varchar(200),
created_date timestamp,
status varchar(20),
CONSTRAINT buy_details_enquiry_id_pk PRIMARY KEY (buy_enquiry_id)
);
/*
create table property_name_mst(
property_id bigint,
property_name varchar(100),
user_id bigint, --still should be able to share the property names with other users
CONSTRAINT property_id_pk PRIMARY KEY (property_id)
);

create table property_value(
value_id bigint,
property_id bigint,
system_name varchar(100),
system_type varchar(100),
user_id bigint, --should NOT be able to share the property value with other users
property_value varchar(4000),
CONSTRAINT value_id_pk PRIMARY KEY (value_id)
);
*/
create table uc_seq_diagram_property(
property_id numeric,
user_id varchar(100),
SEQ_MST_ID bigint,
SEQ_ITEM_ID bigint,
system_id bigint,
request_id bigint,
response_id bigint,
property_for varchar(100), -- this will be either SYSTEM, REQUEST, RESPONSE
property_name varchar(100),
property_value varchar(4000),
CONSTRAINT property_id_pk PRIMARY KEY (property_id)
);
--alter table UC_SEQ_DIAGRAM_PROPERTY add constraint seq_item_id_check check (seq_item_id>0);

create table uc_tip(
tip_id numeric,
user_id varchar(100),
tip_name varchar(50),
last_displayed_date timestamp,
CONSTRAINT tip_pk PRIMARY KEY (tip_id)
);

create table uc_host_cluster_mst(
HOST_ID bigint,
HOST_CLUSTER_NAME  varchar(100),
PRIMARY_HOST_NAME  varchar(100),
OTHER_HOST_NAMES  varchar(2000),
SEQ_MST_ID numeric,
USER_ID  varchar(100),
HOST_TYPE  varchar(100),
DESCRIPTION  varchar(4000),
CREATED_DATE  timestamp,
IN_CONNECTION_IP_ADDRESSES varchar(2000),
OUT_CONNECTION_IP_ADDRESSES varchar(2000),
IN_CONNECTION_OPEN_PORTS varchar(1000),
OUT_CONNECTION_OPEN_PORTS varchar(1000),
IN_CONNECTION_PROTOCOLS  varchar(1000),
OUT_CONNECTION_PROTOCOLS  varchar(1000)
);

create table uc_host_properties(
property_id bigint,
user_id varchar(100),
HOST_ID numeric,
property_name varchar(100),
property_value varchar(4000),
CONSTRAINT host_properties_pk PRIMARY KEY (property_id)
);

create table uc_system_mst(
system_id numeric,
seq_mst_id bigint,
sys_seq_id bigint,
user_id varchar(100),
system_name varchar(2000),
image_url varchar(2000),
system_type varchar(50),
description varchar(4000),
host_id bigint,
created_date timestamp,
CONSTRAINT system_id_pk PRIMARY KEY (system_id)
);
alter table uc_system_mst alter system_type not null;
alter table uc_system_mst alter system_name not null;
alter table uc_system_mst add constraint system_name_check check (system_name<>'');
alter table uc_system_mst add constraint system_useIdSysName_unique unique (system_name, system_type);


create table uc_request_mst(
request_id numeric,
seq_mst_id bigint,
sys_seq_id bigint,
user_id varchar(100),
system_id bigint,
request_protocol varchar(50),
image_url varchar(2000),
request_name varchar(50),
description varchar(4000),
created_date timestamp,
CONSTRAINT request_id_pk PRIMARY KEY (request_id)
);
alter table uc_request_mst alter request_name not null;
alter table uc_request_mst add constraint request_name_check check (request_name <>'');
alter table uc_request_mst add constraint system_id_check check (system_id<>0);
alter table uc_request_mst add constraint request_sysIdResName_unique unique (system_id, request_name);


create table uc_response_mst(
response_id numeric,
seq_mst_id bigint,
sys_seq_id bigint,
user_id varchar(100),
system_id bigint,
response_protocol varchar(50),
success_image_url varchar(2000),
failure_image_url varchar(2000),
response_name varchar(50),
description varchar(4000),
created_date timestamp,
related_request_id bigint,
CONSTRAINT response_id_pk PRIMARY KEY (response_id)
);

alter table uc_response_mst alter response_name not null;
alter table uc_response_mst add constraint response_name_check check (response_name <>'');
alter table uc_response_mst add constraint response_system_id_check check (system_id<>0);
alter table uc_response_mst add constraint response_sysIdResName_unique unique (system_id, response_name);
alter table uc_response_mst add constraint rel_request_unique unique (related_request_id);
alter table UC_RESPONSE_MST alter related_request_id not null;

create table public_seq_access_log(
user_id varchar(100),
seq_mst_id bigint,
jsession_id varchar(40),
remote_login_host varchar(40),
remote_login_ipaddress varchar(40),
remote_login_proxy_ipaddress varchar(100),
created_date timestamp,
CONSTRAINT seq_access_pk PRIMARY KEY (jsession_id)
);

create table uc_seq_menu_images(
menu_item_id numeric,
user_id varchar(100),
menu_item_name varchar(40),
system_type varchar(50),
menu_image_file_name varchar(40),
selected varchar(1),
created_date timestamp,
CONSTRAINT menu_item_pk PRIMARY KEY (menu_item_id)
);

create table uc_default_menu_images(
menu_item_id numeric,
menu_item_name varchar(40),
system_type varchar(50),
menu_image_file_name varchar(40),
CONSTRAINT default_menu_item_pk PRIMARY KEY (menu_item_id)
);
insert into uc_default_menu_images values(1,'web_service_gray','web_service_gray','web_service_gray.png');
insert into uc_default_menu_images values(2,'web_service_external','web_service_external','web_service_external.png');
insert into uc_default_menu_images values(3,'web_service','web_service','web_service.png');
insert into uc_default_menu_images values(4,'web_pages','web_pages','web_pages.png');
insert into uc_default_menu_images values(5,'store_kit_gray','store_kit_gray','store_kit_gray.png');
insert into uc_default_menu_images values(6,'store_kit_external','store_kit_external','store_kit_external.png');
insert into uc_default_menu_images values(7,'store_kit','store_kit','store_kit.png');
insert into uc_default_menu_images values(8,'server_gray','server_gray','server_gray.png');
insert into uc_default_menu_images values(9,'server_external','server_external','server_external.png');
insert into uc_default_menu_images values(10,'server','server','server.png');
insert into uc_default_menu_images values(11,'router_gray','router_gray','router_gray.png');
insert into uc_default_menu_images values(12,'router_external','router_external','router_external.png');
insert into uc_default_menu_images values(13,'router','router','router.png');
insert into uc_default_menu_images values(14,'proxy_server_gray','proxy_server_gray','proxy_server_gray.png');
insert into uc_default_menu_images values(15,'proxy_server_external','proxy_server_external','proxy_server_external.png');
insert into uc_default_menu_images values(16,'proxy_server','proxy_server','proxy_server.png');
insert into uc_default_menu_images values(17,'process_gray','process_gray','process_gray.png');
insert into uc_default_menu_images values(18,'process_external','process_external','process_external.png');
insert into uc_default_menu_images values(19,'process','process','process.png');
insert into uc_default_menu_images values(20,'portal_gray','portal_gray','portal_gray.png');
insert into uc_default_menu_images values(21,'portal_external','portal_external','portal_external.png');
insert into uc_default_menu_images values(22,'portal','portal','portal.png');
insert into uc_default_menu_images values(23,'phone_app_gray','phone_app_gray','phone_app_gray.png');
insert into uc_default_menu_images values(24,'phone_app_external','phone_app_external','phone_app_external.png');
insert into uc_default_menu_images values(25,'phone_app','phone_app','phone_app.png');
insert into uc_default_menu_images values(26,'network_switch_gray','network_switch_gray','network_switch_gray.png');
insert into uc_default_menu_images values(27,'network_switch_external','network_switch_external','network_switch_external.png');
insert into uc_default_menu_images values(28,'network_switch','network_switch','network_switch.png');
insert into uc_default_menu_images values(29,'internet_cloud_gray','internet_cloud_gray','internet_cloud_gray.png');
insert into uc_default_menu_images values(30,'internet_cloud_external','internet_cloud_external','internet_cloud_external.png');
insert into uc_default_menu_images values(31,'internet_cloud','internet_cloud','internet_cloud.png');
insert into uc_default_menu_images values(32,'firewall_gray','firewall_gray','firewall_gray.png');
insert into uc_default_menu_images values(33,'firewall_external','firewall_external','firewall_external.png');
insert into uc_default_menu_images values(34,'firewall','firewall','firewall.png');
insert into uc_default_menu_images values(35,'email_server_gray','email_server_gray','email_server_gray.png');
insert into uc_default_menu_images values(36,'email_server_external','email_server_external','email_server_external.png');
insert into uc_default_menu_images values(37,'email_server','email_server','email_server.png');
insert into uc_default_menu_images values(38,'device','device','device.png');
insert into uc_default_menu_images values(39,'database_server_gray','database_server_gray','database_server_gray.png');
insert into uc_default_menu_images values(40,'database_server_external','database_server_external','database_server_external.png');
insert into uc_default_menu_images values(41,'database_server','database_server','database_server.png');

insert into uc_default_menu_images values(43,'application_server_gray','application_server_gray','application_server_gray.png');
insert into uc_default_menu_images values(44,'application_server_external','application_server_external','application_server_external.png');
insert into uc_default_menu_images values(45,'application_server','application_server','application_server.png');
insert into uc_default_menu_images values(46,'app_store_gray','app_store_gray','app_store_gray.png');
insert into uc_default_menu_images values(47,'app_store_external','app_store_external','app_store_external.png');
insert into uc_default_menu_images values(48,'app_store','app_store','app_store.png');
insert into uc_default_menu_images values(49,'customer','customer','customer.png');
insert into uc_default_menu_images values(50,'Customer_gray','Customer_gray','Customer_gray.png');
insert into uc_default_menu_images values(51,'Customer_external','Customer_external','Customer_external.png');



create table uc_default_menu_user_mst(
menu_item_id bigint,
user_id varchar(100),
CONSTRAINT default_menu_user_mst_pk PRIMARY KEY (menu_item_id, user_id)
);

create table uc_user_directory_create_log(
user_id  varchar(100),
directory varchar(400)
);

delete from credential where user_id='951471d7-4c39-489f-ba04-c6f488900de2140331234454';
delete from UC_REQUEST_MST where user_id='951471d7-4c39-489f-ba04-c6f488900de2140331234454';
delete from UC_RESPONSE_MST where user_id='951471d7-4c39-489f-ba04-c6f488900de2140331234454';
delete from SESSION_RECORDS where user_id='951471d7-4c39-489f-ba04-c6f488900de2140331234454';
delete from UC_SEQ_DIAGRAM where user_id='951471d7-4c39-489f-ba04-c6f488900de2140331234454';
delete from UC_SEQ_DIAGRAM_PROPERTY where user_id='951471d7-4c39-489f-ba04-c6f488900de2140331234454';
delete from UC_SEQ_MST where user_id='951471d7-4c39-489f-ba04-c6f488900de2140331234454';
delete from UC_SYSTEM_MST where user_id='951471d7-4c39-489f-ba04-c6f488900de2140331234454';
delete from UC_TIP where user_id='951471d7-4c39-489f-ba04-c6f488900de2140331234454';


create table uc_smtp
(
from_email_address varchar(100) not null,
reply_to_email_address varchar(100) not null,
smtp_server varchar(100) not null,
test_status varchar(100),
test_number bigint
);


create table uc_seq_mst_release_properties
(
property_id numeric,
seq_mst_id bigint, 
detect_change_id bigint, 
system_id bigint, 
property_name varchar(100), 
property_value varchar(4000),
CONSTRAINT uc_seq_mst_release_prop_pk PRIMARY KEY (property_id)
);

------------------System Sequence DB ----------------------------


create table uc_sys_seq_diagram(
seq_item_id numeric,
sys_seq_id bigint,
seq_mst_id bigint,
user_id varchar(100),
system_id bigint,
system_new varchar(1),
request_id bigint,
request_new varchar(1),
request_protocol varchar(50), 
draft_request_protocol varchar(50), 
item_signature varchar(2000),
response_id bigint,
response_new varchar(1),
system_name varchar(50),
system_type varchar(50),
row_no bigint,
col_no bigint,
last_child_row_no bigint,
if_condition varchar(2000),
section_name varchar(100),
request varchar(100),
response varchar(100),
sample_request varchar(4000),
draft_sample_request varchar(4000),  
sample_success_response varchar(4000),
draft_sample_success_response varchar(4000),
sample_failure_response varchar(4000),
draft_sample_failure_response varchar(4000),
ASYNCH_SOURCE_DESTINATION varchar(20),
ASYNCH_SEQ_ITEM_ID bigint,
ASYNCH_ROW_NO bigint,
ASYNCH_COL_NO bigint,
description  varchar(4000), --this will be used for SEQ_IF and SEQ_SECTION 
MENU_IMAGE_URL varchar(200),
CONSTRAINT uc_seqSysItemId_pk PRIMARY KEY (seq_item_id)
);

alter table uc_sys_seq_diagram add UNIQUE (sys_seq_id, row_no, col_no);
alter table uc_sys_seq_diagram alter system_id not null;
--alter table uc_sys_seq_diagram alter request_id not null;
--alter table uc_sys_seq_diagram alter response_id not null;
--alter table uc_sys_seq_diagram alter response not null;
--alter table uc_sys_seq_diagram alter request not null;

--alter table uc_sys_seq_diagram alter system_name not null;//BUG1 :If condition fix
alter table uc_sys_seq_diagram alter system_type not null;
--alter table uc_sys_seq_diagram add constraint sys_diagram_system_id_check check (system_id<>0);//BUG FIX if condition
--alter table uc_sys_seq_diagram add constraint sys_diagram_request_id_check check (request_id>0);
--alter table uc_sys_seq_diagram add constraint sys_diagram_response_id_check check (response_id>0);

create table uc_sys_seq_diagram_draft(
seq_item_id numeric,
sys_seq_id bigint, -- added new to link to master
seq_mst_id bigint,
user_id varchar(100),
system_id bigint,
system_new varchar(1),
request_id bigint,
request_new varchar(1),
request_protocol varchar(50), 
draft_request_protocol varchar(50), 
item_signature varchar(2000),
response_id bigint,
response_new varchar(1),
system_name varchar(50),
system_type varchar(50),
row_no bigint,
col_no bigint,
last_child_row_no bigint,
if_condition varchar(2000),
section_name varchar(100),
request varchar(100),
response varchar(100),
sample_request varchar(4000),
draft_sample_request varchar(4000),  
sample_success_response varchar(4000),
draft_sample_success_response varchar(4000), 
sample_failure_response varchar(4000),
draft_sample_failure_response varchar(4000),  
ASYNCH_SOURCE_DESTINATION varchar(20),
ASYNCH_SEQ_ITEM_ID bigint,
ASYNCH_ROW_NO bigint,
ASYNCH_COL_NO bigint,
description  varchar(4000), --this will be used for SEQ_IF and SEQ_SECTION 
MENU_IMAGE_URL varchar(200),
CONSTRAINT uc_seqSysItemIdDraft_pk PRIMARY KEY (seq_item_id)
);

alter table uc_sys_seq_diagram_draft add UNIQUE (sys_seq_id, row_no, col_no);
alter table uc_sys_seq_diagram_draft alter system_id not null;
----alter table uc_sys_seq_diagram_draft alter request_id not null;
--alter table uc_sys_seq_diagram_draft alter response_id not null;
--alter table uc_sys_seq_diagram_draft alter response not null;
--alter table uc_sys_seq_diagram_draft alter request not null;

--alter table uc_sys_seq_diagram_draft alter system_name not null;//BUG1 :If condition fix
alter table uc_sys_seq_diagram_draft alter system_type not null;
--alter table uc_sys_seq_diagram_draft add constraint sys_diagram_system_id_check_draft check (system_id<>0);//BUG FIX if condition
--alter table uc_sys_seq_diagram_draft add constraint sys_diagram_request_id_check_draft check (request_id>0);
--alter table uc_sys_seq_diagram_draft add constraint sys_diagram_response_id_check_draft check (response_id>0);



create table uc_sys_seq_diagram_dev_ver(
seq_item_id numeric,
sys_seq_id bigint, -- added new to link to master
seq_mst_id bigint,
user_id varchar(100),
system_id bigint,
system_new varchar(1),
request_id bigint,
request_new varchar(1),
request_protocol varchar(50), 
draft_request_protocol varchar(50), 
item_signature varchar(2000),
response_id bigint,
response_new varchar(1),
system_name varchar(50),
system_type varchar(50),
row_no bigint,
col_no bigint,
last_child_row_no bigint,
if_condition varchar(2000),
section_name varchar(100),
request varchar(100),
response varchar(100),
sample_request varchar(4000),
draft_sample_request varchar(4000),  
sample_success_response varchar(4000),
draft_sample_success_response varchar(4000),
sample_failure_response varchar(4000),
draft_sample_failure_response varchar(4000),
ASYNCH_SOURCE_DESTINATION varchar(20),
ASYNCH_SEQ_ITEM_ID bigint,
ASYNCH_ROW_NO bigint,
ASYNCH_COL_NO bigint,
description  varchar(4000), --this will be used for SEQ_IF and SEQ_SECTION 
MENU_IMAGE_URL varchar(200),
CONSTRAINT uc_seqSysItemId_devVer_pk PRIMARY KEY (seq_item_id)
);

--alter table uc_sys_seq_diagram_dev_ver add UNIQUE (sys_seq_id, row_no, col_no);
alter table uc_sys_seq_diagram_dev_ver alter system_id not null;
--alter table uc_sys_seq_diagram_dev_ver alter request_id not null;
--alter table uc_sys_seq_diagram_dev_ver alter response_id not null;
--alter table uc_sys_seq_diagram_dev_ver alter response not null;
--alter table uc_sys_seq_diagram_dev_ver alter request not null;

--alter table uc_sys_seq_diagram_dev_ver alter system_name not null;//BUG1 :If condition fix
alter table uc_sys_seq_diagram_dev_ver alter system_type not null;
--alter table uc_sys_seq_diagram_dev_ver add constraint sys_diaDevVer_system_id_check check (system_id<>0);//BUG FIX if condition
--alter table uc_sys_seq_diagram_dev_ver add constraint sys_diaDevVer_request_id_check check (request_id>0);
--alter table uc_sys_seq_diagram_dev_ver add constraint sys_diaDevVer_response_id_check check (response_id>0);



create table uc_sys_seq_diagram_prod(
seq_item_id numeric,
sys_seq_id bigint, -- added new to link to master
seq_mst_id bigint,
user_id varchar(100),
system_id bigint,
system_new varchar(1),
request_id bigint,
request_new varchar(1),
request_protocol varchar(50), 
draft_request_protocol varchar(50), 
item_signature varchar(2000),
response_id bigint,
response_new varchar(1),
system_name varchar(50),
system_type varchar(50),
row_no bigint,
col_no bigint,
last_child_row_no bigint,
if_condition varchar(2000),
section_name varchar(100),
request varchar(100),
response varchar(100),
sample_request varchar(4000),
draft_sample_request varchar(4000),  
sample_success_response varchar(4000),
draft_sample_success_response varchar(4000),
sample_failure_response varchar(4000),
draft_sample_failure_response varchar(4000),
ASYNCH_SOURCE_DESTINATION varchar(20),
ASYNCH_SEQ_ITEM_ID bigint,
ASYNCH_ROW_NO bigint,
ASYNCH_COL_NO bigint,
description  varchar(4000), --this will be used for SEQ_IF and SEQ_SECTION 
MENU_IMAGE_URL varchar(200),
CONSTRAINT uc_seqSysItemId_prod_pk PRIMARY KEY (seq_item_id)
);

--alter table uc_sys_seq_diagram_prod add UNIQUE (sys_seq_id, row_no, col_no);
alter table uc_sys_seq_diagram_prod alter system_id not null;
--alter table uc_sys_seq_diagram_prod alter request_id not null;
--alter table uc_sys_seq_diagram_prod alter response_id not null;
--alter table uc_sys_seq_diagram_prod alter response not null;
--alter table uc_sys_seq_diagram_prod alter request not null;

--alter table uc_sys_seq_diagram_prod alter system_name not null;//BUG1 :If condition fix
alter table uc_sys_seq_diagram_prod alter system_type not null;
--alter table uc_sys_seq_diagram_prod add constraint sys_diaProd_system_id_check check (system_id<>0);//BUG FIX if condition
--alter table uc_sys_seq_diagram_prod add constraint sys_diaProd_request_id_check check (request_id>0);
--alter table uc_sys_seq_diagram_prod add constraint sys_diaProd_response_id_check check (response_id>0);


create table uc_sys_seq_diagram_prod_ver(
seq_item_id numeric,
sys_seq_id bigint, -- links to sys_seq_mst : sys_seq_id
seq_mst_id bigint,
user_id varchar(100),
system_id bigint,
system_new varchar(1),
request_id bigint,
request_new varchar(1),
request_protocol varchar(50), 
draft_request_protocol varchar(50), 
item_signature varchar(2000),
response_id bigint,
response_new varchar(1),
system_name varchar(50),
system_type varchar(50),
row_no bigint,
col_no bigint,
last_child_row_no bigint,
if_condition varchar(2000),
section_name varchar(100),
request varchar(100),
response varchar(100),
sample_request varchar(4000),
draft_sample_request varchar(4000),  
sample_success_response varchar(4000),
draft_sample_success_response varchar(4000),
sample_failure_response varchar(4000),
draft_sample_failure_response varchar(4000),
ASYNCH_SOURCE_DESTINATION varchar(20),
ASYNCH_SEQ_ITEM_ID bigint,
ASYNCH_ROW_NO bigint,
ASYNCH_COL_NO bigint,
description  varchar(4000), --this will be used for SEQ_IF and SEQ_SECTION 
MENU_IMAGE_URL varchar(200),
CONSTRAINT uc_seqSysItemId_prodVer_pk PRIMARY KEY (seq_item_id)
);

--alter table uc_sys_seq_diagram_prod add UNIQUE (sys_seq_id, row_no, col_no);
alter table uc_sys_seq_diagram_prod_ver alter system_id not null;
--alter table uc_sys_seq_diagram_prod_ver alter request_id not null;
--alter table uc_sys_seq_diagram_prod_ver alter response_id not null;
--alter table uc_sys_seq_diagram_prod_ver alter response not null;
--alter table uc_sys_seq_diagram_prod_ver alter request not null;

--alter table uc_sys_seq_diagram_prod_ver alter system_name not null;//BUG1 :If condition fix
alter table uc_sys_seq_diagram_prod_ver alter system_type not null;
--alter table uc_sys_seq_diagram_prod_ver add constraint sys_diaProdVer_system_id_check check (system_id<>0);//BUG FIX if condition
--alter table uc_sys_seq_diagram_prod_ver add constraint sys_diaProdVer_request_id_check check (request_id>0);
--alter table uc_sys_seq_diagram_prod_ver add constraint sys_diaProdVer_response_id_check check (response_id>0);


create table uc_sys_seq_mst_draft(
sys_seq_id numeric,
base_sys_seq_id bigint,
across_version_sys_seq_id varchar(100) not null,
across_dev_version_sys_seq_id varchar(100) not null,
for_request_id bigint,
change_set_id bigint,
change_title varchar(100), -- will be automatically updated when seq edited and can be updated by user in DEV not in PROD
change_note varchar(2000),--  can be updated by user in DEV not in PROD
is_edited varchar(1),
edited_by varchar(100),
user_id varchar(100),
edited_date timestamp,
created_date timestamp,
is_public varchar(1),
is_repo varchar(1),
one_way varchar(1),
default_menu varchar(1),
MENU_IMAGE_URL varchar(200),
cat_id bigint not null, --- this will decide who will have access to the sequence if access is not defined 
access_priv varchar(4000),
LINK_SHARE_DATE_FACEBOOK timestamp,
LINK_SHARE_DATE_TWITTER timestamp,
LINK_SHARE_DATE_GPLUS timestamp,
LINK_SHARE_DATE_LINKIN timestamp,
LINK_SECURE_DATE timestamp,
CONSTRAINT uc_sys_seq_id_draft_pk PRIMARY KEY (sys_seq_id)
);


alter table UC_SYS_SEQ_MST_DRAFT add UNIQUE (for_request_id);



create table uc_sys_seq_release_draft
(
detect_change_id numeric,
sys_seq_id bigint, -- connects to sys_seq_id from uc_sys_seq_mst
request_id bigint,
parent_requestId bigint,
parent_sys_seq_id bigint,
sequence_version varchar(50),
change_type varchar(50),
change_title varchar(400),
system_id bigint, 
item_signature_from varchar(2000), 
item_signature_to varchar(2000), 
change_desc_from varchar(4000), 
change_desc_to varchar(10000),--as this is going to be used for storing the big description, containing call seq, req+res sample, for new development
comments varchar(4000), 
system_note varchar(4000),
status varchar(50),
release_date timestamp,
user_id varchar(100),
CONSTRAINT uc_sys_seq_rel_draft_curr_pk PRIMARY KEY (detect_change_id)
);

alter table uc_sys_seq_release_draft add UNIQUE (sys_seq_id, request_id, change_type, parent_requestId,parent_sys_seq_id, sequence_version);

create table uc_sys_seq_mst(
sys_seq_id numeric,
base_sys_seq_id numeric,
across_version_sys_seq_id varchar(100) not null,
across_dev_version_sys_seq_id varchar(100) not null,
for_request_id bigint,
change_set_id bigint,
change_title varchar(100), -- will be automatically updated when seq edited and can be updated by user in DEV not in PROD
change_note varchar(2000),--  can be updated by user in DEV not in PROD
is_edited varchar(1),
edited_by varchar(100),
user_id varchar(100),
edited_date timestamp,
created_date timestamp,
is_public varchar(1),
is_repo varchar(1),
one_way varchar(1),
default_menu varchar(1),
MENU_IMAGE_URL varchar(200),
cat_id bigint not null, --- this will decide who will have access to the sequence if access is not defined 
access_priv varchar(4000),
LINK_SHARE_DATE_FACEBOOK timestamp,
LINK_SHARE_DATE_TWITTER timestamp,
LINK_SHARE_DATE_GPLUS timestamp,
LINK_SHARE_DATE_LINKIN timestamp,
LINK_SECURE_DATE timestamp,
CONSTRAINT uc_sys_seq_id_curr_pk PRIMARY KEY (sys_seq_id)
);

alter table UC_SYS_SEQ_MST alter for_request_id not null;
alter table UC_SYS_SEQ_MST add UNIQUE (for_request_id);
create table uc_sys_seq_release
(
detect_change_id numeric,
sys_seq_id bigint, -- connects to sys_seq_id from uc_sys_seq_mst
request_id bigint,
parent_requestId bigint,
parent_sys_seq_id bigint,
sequence_version varchar(50),
change_type varchar(50),
change_title varchar(400),
system_id bigint, 
item_signature_from varchar(2000), 
item_signature_to varchar(2000), 
change_desc_from varchar(4000), 
change_desc_to varchar(10000),--as this is going to be used for storing the big description, containing call seq, req+res sample, for new development
comments varchar(4000), 
system_note varchar(4000),
status varchar(50),
release_date timestamp,
user_id varchar(100),
CONSTRAINT uc_sys_seq_release_curr_pk PRIMARY KEY (detect_change_id)
);
alter table uc_sys_seq_release add UNIQUE (sys_seq_id, request_id, change_type, parent_requestId, parent_sys_seq_id, sequence_version);

create table uc_sys_seq_mst_dev_version(
sys_seq_id numeric,
base_sys_seq_id numeric,
current_dev_sys_seq_id numeric,
across_version_sys_seq_id varchar(100)  not null,
across_dev_version_sys_seq_id varchar(100) not null,
for_request_id bigint,
change_set_id bigint,
change_title varchar(100), -- will be automatically updated when seq edited and can be updated by user in DEV not in PROD
change_note varchar(2000),--  can be updated by user in DEV not in PROD
is_edited varchar(1),
edited_by varchar(100),
user_id varchar(100),
edited_date timestamp,
created_date timestamp,
is_public varchar(1),
is_repo varchar(1),
one_way varchar(1),
default_menu varchar(1),
MENU_IMAGE_URL varchar(200),
cat_id bigint not null,
access_priv varchar(4000),
LINK_SHARE_DATE_FACEBOOK timestamp,
LINK_SHARE_DATE_TWITTER timestamp,
LINK_SHARE_DATE_GPLUS timestamp,
LINK_SHARE_DATE_LINKIN timestamp,
LINK_SECURE_DATE timestamp,
CONSTRAINT uc_sys_seq_id_curr_ver_pk PRIMARY KEY (sys_seq_id)
);
alter table UC_SYS_SEQ_MST_DEV_VERSION alter for_request_id not null;

create table uc_sys_seq_release_dev_ver
(
detect_change_id numeric,
sys_seq_id bigint, -- connects to sys_seq_id from uc_sys_seq_mst_dev_ver
request_id bigint,
parent_requestId bigint,
parent_sys_seq_id bigint,
sequence_version varchar(50),
change_type varchar(50),
change_title varchar(400),
system_id bigint, 
item_signature_from varchar(2000), 
item_signature_to varchar(2000), 
change_desc_from varchar(4000), 
change_desc_to varchar(10000),--as this is going to be used for storing the big description, containing call seq, req+res sample, for new development
comments varchar(4000), 
system_note varchar(4000),
status varchar(50),
release_date timestamp,
user_id varchar(100),
CONSTRAINT uc_sys_seq_release_devVer_pk PRIMARY KEY (detect_change_id)
);
alter table uc_sys_seq_release_dev_ver add UNIQUE (sys_seq_id, request_id, change_type, parent_requestId,parent_sys_seq_id, sequence_version);

create table uc_sys_seq_mst_prod(
sys_seq_id numeric,
across_version_sys_seq_id varchar(100),
across_dev_version_sys_seq_id varchar(100),
for_request_id bigint,
change_set_id bigint,
change_title varchar(100), -- will be automatically updated when seq edited and can be updated by user in DEV not in PROD
change_note varchar(2000),--  can be updated by user in DEV not in PROD
is_edited varchar(1),
edited_by varchar(100),
user_id varchar(100),
edited_date timestamp,
created_date timestamp,
is_public varchar(1),
is_repo varchar(1),
one_way varchar(1),
default_menu varchar(1),
MENU_IMAGE_URL varchar(200),
cat_id bigint not null, --- this will decide who will have access to the sequence if access is not defined 
LINK_SHARE_DATE_FACEBOOK timestamp,
LINK_SHARE_DATE_TWITTER timestamp,
LINK_SHARE_DATE_GPLUS timestamp,
LINK_SHARE_DATE_LINKIN timestamp,
LINK_SECURE_DATE timestamp,
CONSTRAINT uc_sys_seq_id_prod_pk PRIMARY KEY (sys_seq_id)
);

alter table UC_SYS_SEQ_MST_PROD alter for_request_id not null;

create table uc_sys_seq_release_prod
(
detect_change_id numeric,
sys_seq_id bigint, -- connects to sys_seq_id from uc_sys_seq_mst_prod
request_id bigint,
parent_requestId bigint,
parent_sys_seq_id bigint,
sequence_version varchar(50),
change_type varchar(50),
change_title varchar(400),
system_id bigint, 
item_signature_from varchar(2000), 
item_signature_to varchar(2000), 
change_desc_from varchar(4000), 
change_desc_to varchar(10000),--as this is going to be used for storing the big description, containing call seq, req+res sample, for new development
comments varchar(4000), 
system_note varchar(4000),
status varchar(50),
release_date timestamp,
user_id varchar(100),
CONSTRAINT uc_sys_seq_release_prod_pk PRIMARY KEY (detect_change_id)
);
alter table uc_sys_seq_release_prod add UNIQUE (sys_seq_id, request_id, change_type, parent_requestId, parent_sys_seq_id, sequence_version);

create table uc_sys_seq_mst_prod_version(
sys_seq_id numeric,
across_version_sys_seq_id varchar(100),
across_dev_version_sys_seq_id varchar(100),
for_request_id bigint,
change_set_id bigint,
change_title varchar(100), -- will be automatically updated when seq edited and can be updated by user in DEV not in PROD
change_note varchar(2000),--  can be updated by user in DEV not in PROD
is_edited varchar(1),
edited_by varchar(100),
user_id varchar(100),
edited_date timestamp,
created_date timestamp,
is_public varchar(1),
is_repo varchar(1),
one_way varchar(1),
default_menu varchar(1),
MENU_IMAGE_URL varchar(200),
cat_id bigint not null,
LINK_SHARE_DATE_FACEBOOK timestamp,
LINK_SHARE_DATE_TWITTER timestamp,
LINK_SHARE_DATE_GPLUS timestamp,
LINK_SHARE_DATE_LINKIN timestamp,
LINK_SECURE_DATE timestamp,
CONSTRAINT uc_sys_seq_id_prod_ver_pk PRIMARY KEY (sys_seq_id)
);

alter table UC_SYS_SEQ_MST_PROD_VERSION alter for_request_id not null;

create table uc_sys_seq_release_prod_ver
(
detect_change_id numeric,
sys_seq_id bigint, -- connects to sys_seq_id from uc_sys_seq_mst_prod_ver
request_id bigint,
parent_requestId bigint,
parent_sys_seq_id bigint,
sequence_version varchar(50),
change_type varchar(50),
change_title varchar(400),
system_id bigint, 
item_signature_from varchar(2000), 
item_signature_to varchar(2000), 
change_desc_from varchar(4000), 
change_desc_to varchar(10000),--as this is going to be used for storing the big description, containing call seq, req+res sample, for new development
comments varchar(4000), 
system_note varchar(4000),
status varchar(50),
release_date timestamp,
user_id varchar(100),
CONSTRAINT uc_sys_seq_release_prodVer_pk PRIMARY KEY (detect_change_id)
);
alter table uc_sys_seq_release_prod_ver add UNIQUE (sys_seq_id, request_id, change_type, parent_requestId, parent_sys_seq_id, sequence_version);
-------------------End System Sequence DB -----------------------
------------enterprise user DB------------
create table category
(
id numeric,
cat_name varchar(200), 
cat_access varchar(4000),
cat_description varchar(1000),
CONSTRAINT id_category_pk PRIMARY KEY(id)
);
insert into category values(0,'Sandbox', 'team_97e96294-e162-4334-9a16-6b12cec8b19c160608061723_OW', 'Try some sequences');


create table team
(
id varchar(100), --uuid
team_name varchar(200), 
team_description varchar(1000),
CONSTRAINT id_team_pk PRIMARY KEY(id)
);
--creating team for the first admin user
insert into team values('97e96294-e162-4334-9a16-6b12cec8b19c160608061723','Enterprise Architect', 'Enterprise Architect team');

------------End enterprise user DB------------

create table uc_seq_diagram_draft_audit(
id numeric,
operation varchar(100),
seq_item_id bigint,
seq_mst_id bigint,
user_id varchar(100),
system_id bigint,
system_new varchar(1),
request_id bigint,
request_new varchar(1),
request_protocol varchar(50), 
draft_request_protocol varchar(50), 
item_signature varchar(2000),
response_id bigint,
response_new varchar(1),
system_name varchar(50),
system_type varchar(50),
row_no bigint,
col_no bigint,
last_child_row_no bigint,
if_condition varchar(2000),
section_name varchar(100),
request varchar(100),
response varchar(100),
sample_request varchar(4000),
draft_sample_request varchar(4000), 
sample_success_response varchar(4000),
draft_sample_success_response varchar(4000), 
sample_failure_response varchar(4000),
draft_sample_failure_response varchar(4000), 
ASYNCH_SOURCE_DESTINATION varchar(20),
ASYNCH_SEQ_ITEM_ID bigint,
ASYNCH_ROW_NO bigint,
ASYNCH_COL_NO bigint,
description  varchar(4000), --this will be used for SEQ_IF and SEQ_SECTION 
MENU_IMAGE_URL varchar(200),
created_date timestamp,
error  varchar(4000),
CONSTRAINT uc_audit_Id_draft_pk PRIMARY KEY (id)
);

create table UC_CAPABILITY_UPDATE_AUDIT(
id numeric,
operation varchar(100),
user_id varchar(100),
system_id bigint,
request_id bigint,
response_id bigint,
new_system_name varchar(50),
old_system_name varchar(50),
new_request varchar(100),
old_request varchar(100),
new_response varchar(100),
old_response varchar(100),
draft_seq_used varchar(1000),
draft_sys_seq_used varchar(1000),
dev_seq_used varchar(1000),
dev_sys_seq_used varchar(1000),
prod_seq_used varchar(1000),
prod_sys_seq_used varchar(1000),
log_date timestamp,
CONSTRAINT uc_cap_audit_Id_draft_pk PRIMARY KEY (id)
);
exit;