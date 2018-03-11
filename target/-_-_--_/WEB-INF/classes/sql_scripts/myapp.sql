create user myapp identified by myapp;

grant connect, resource to myapp;


conn myapp/myapp@xe

CREATE Table seq_mst(seq_id varchar2(30),SEQUENCE_NEXT_HI_VALUE  number);

create table uc_seq_mst(
seq_mst_id number,
seq_name varchar2(100),
seq_description varchar(4000),
system_id number,
system_name varchar2(50),
system_type varchar2(50),
uc_id number,
is_edited varchar2(1),
edited_by varchar2(100),
user_id varchar2(100),
version_name  varchar2(100),
edited_date date,
created_date date,
is_public varchar2(1),
LINK_SHARE_DATE_FACEBOOK date,
LINK_SHARE_DATE_TWITTER date,
LINK_SHARE_DATE_GPLUS date,
LINK_SHARE_DATE_LINKIN date,
LINK_SECURE_DATE date,
CONSTRAINT uc_seqMstId_pk PRIMARY KEY (seq_mst_id)
);

create table uc_seq_mst_version(
version_id number,
seq_mst_id number,
seq_name varchar2(100),
seq_description varchar(4000),
cust_name varchar2(100),
uc_id number,
is_edited varchar2(1),
edited_by varchar2(100),
user_id varchar2(100),
version_name  varchar2(100),
edited_date date,
created_date date,
is_public varchar2(1),
LINK_SHARE_DATE_FACEBOOK date,
LINK_SHARE_DATE_TWITTER date,
LINK_SHARE_DATE_GPLUS date,
LINK_SHARE_DATE_LINKIN date,
LINK_SECURE_DATE date,
CONSTRAINT uc_seqVersion_pk PRIMARY KEY (version_id)
);

-- this table holds all the versions for uc_seq_diagram 
create table uc_seq_diagram_version(
version_id number,
seq_item_id number,
seq_mst_id number,
user_id varchar2(100),
system_name varchar2(50),
system_type varchar2(50),
row_no number,
col_no number,
last_child_row_no number,
if_condition varchar2(2000),
section_name varchar2(100),
request varchar2(100),
response varchar2(100),
sample_request varchar2(4000),
sample_response varchar2(4000),
ASYNCH_SOURCE_DESTINATION varchar2(20),
ASYNCH_SEQ_ITEM_ID number,
ASYNCH_ROW_NO number,
ASYNCH_COL_NO number,
CONSTRAINT uc_seqVersionItemId_pk PRIMARY KEY (version_id)
---This is a trick primary key to generate the java bean code, remove later 
);
---------------------changed id's to names for system, if_condition, request,response 
create table uc_seq_diagram(
seq_item_id number,
seq_mst_id number,
user_id varchar2(100),
system_id number,
system_new varchar2(1),
request_id number,
request_new varchar2(1),
response_id number,
response_new varchar2(1),
system_name varchar2(50),
system_type varchar2(50),
row_no number,
col_no number,
last_child_row_no number,
if_condition varchar2(2000),
section_name varchar2(100),
request varchar2(100),
response varchar2(100),
sample_request varchar2(4000),
sample_response varchar2(4000),
ASYNCH_SOURCE_DESTINATION varchar2(20),
ASYNCH_SEQ_ITEM_ID number,
ASYNCH_ROW_NO number,
ASYNCH_COL_NO number,
CONSTRAINT uc_seqItemId_pk PRIMARY KEY (seq_item_id)
);


alter table uc_seq_diagram add UNIQUE (seq_mst_id, row_no, col_no);
alter table uc_seq_diagram alter system_id not null;
alter table uc_seq_diagram alter request_id not null;
alter table uc_seq_diagram alter response_id not null;
alter table uc_seq_diagram alter response not null;
alter table uc_seq_diagram alter request not null;
alter table uc_seq_diagram alter system_name not null;
alter table uc_seq_diagram alter system_type not null;
alter table uc_seq_diagram add constraint diagram_system_id_check check (system_id>0);
alter table uc_seq_diagram add constraint diagram_request_id_check check (request_id>0);
alter table uc_seq_diagram add constraint diagram_response_id_check check (response_id>0);

	create table CREDENTIAL(
	id number,
	user_id varchar2(100),
	user_name_email varchar2(100),
	first_name varchar2(100),
	last_name varchar2(100),
	password varchar2(200),
	temp_password varchar2(200),
	temp_password_expiry date,
	salt  varchar2(100),
	phone varchar2(35),
	mobile varchar2(15),
	company varchar2(100),
	terms_of_use_accepted varchar2(1),
	updated_date date,
	created_date date,
	CONSTRAINT credential_Id_pk PRIMARY KEY (id)
	);

create table session_records(
session_id number,
user_id varchar2(100),
jsession_id varchar2(40),
remote_login_host varchar2(40),
remote_login_ipaddress varchar2(40),
remote_login_proxy_ipaddress varchar2(100),
created_date date,
logoff_date date,
sessionExpired_or_LoggedOff varchar2(40),
CONSTRAINT session_sessionId_pk PRIMARY KEY (session_id)
);


create table product_category_mst(
product_category_id number,
product_category_name varchar2(50),
CONSTRAINT product_category_id_pk PRIMARY KEY (product_category_id)
);


create table product_mst(
product_id number,
product_category_id number,
product_name varchar2(50),
product_price number (10,2),
status varchar2(15),
CONSTRAINT product_id_pk PRIMARY KEY (product_id)
);

create table feature_mst(
feature_id number,
feature_name varchar2(50),
CONSTRAINT feature_id_pk PRIMARY KEY (feature_id)
);

create table product_feature(
product_feature_id number,
feature_id number,
product_id number,
value number,
CONSTRAINT product_feature_id_pk PRIMARY KEY (product_feature_id)
);


create table customer_subscription(
subscription_id number,
product_id number,
user_id varchar2(100),
start_date date,
end_date date,
next_bill_date date,
recurring_period_months number,
status varchar2(20),
CONSTRAINT subscription_id_pk PRIMARY KEY (subscription_id)
);

create table customer_transactions(
transaction_id number,
subscription_id number,
product_id number,
session_id number,
user_id varchar2(100),
payment_date date,
created_date date,
modified_date date,
CORRELATIONID varchar2(100),
request varchar2(4000),
response varchar2(4000),
status varchar2(500),
final_status varchar2(50),
failure_reason varchar2(100),
CONSTRAINT transaction_id_pk PRIMARY KEY (transaction_id)
);

--=========================PRODUCT CONFIGURATION=================

--inserting into PRODUCT_CATEGORY
insert into product_category_mst(product_category_id, product_category_name) values(1, 'eSequence');

--inserting into PRODUCT_MST
insert into product_mst (product_id, product_category_id, product_name, product_price, status)
values(1, 1, 'eSequence Free', 0, 'ACTIVE');

insert into product_mst (product_id, product_category_id, product_name, product_price, status)
values(2, 1, 'eSequence Basic', 5, 'ACTIVE');

insert into product_mst (product_id, product_category_id, product_name, product_price, status)
values(3, 1, 'eSequence Premium', 10, 'ACTIVE');

--inserting into feature_mst

insert into feature_mst (feature_id, feature_name)
values(1, 'NUMBER_OF_SEQUENCE_DIAGRAMS');

insert into feature_mst (feature_id, feature_name)
values(2, 'NUMBER_OF_SEQUENCE_DIAGRAMS_VERSIONS');

insert into feature_mst (feature_id, feature_name)
values(3, 'NUMBER_OF_WORD_DOCUMENT_DOWNLOADS');

--inserting into product_feature for "eSequence Free" 
----NUMBER_OF_SEQUENCE_DIAGRAMS=5
insert into product_feature(product_feature_id, feature_id, product_id, value)
values(1, 1, 1, 5);

--NUMBER_OF_SEQUENCE_DIAGRAMS_VERSIONS

--inserting into product_feature for "eSequence Basic" 
----NUMBER_OF_SEQUENCE_DIAGRAMS=30
insert into product_feature(product_feature_id, feature_id, product_id, value)
values(2, 1, 2, 30);

--NUMBER_OF_SEQUENCE_DIAGRAMS_VERSIONS

--inserting into product_feature for "eSequence Premium" 
----NUMBER_OF_SEQUENCE_DIAGRAMS=60
insert into product_feature(product_feature_id, feature_id, product_id, value)
values(3, 1, 3, 60);

--NUMBER_OF_SEQUENCE_DIAGRAMS_VERSIONS
insert into product_feature(product_feature_id, feature_id, product_id, value)
values(4, 2, 3, 5);

--inserting into product_feature for "eSequence Free" 
----NUMBER_OF_WORD_DOCUMENT_DOWNLOADS=50
insert into product_feature(product_feature_id, feature_id, product_id, value)
values(5, 3, 1, 50);

--inserting into product_feature for "eSequence Basic" 
----NUMBER_OF_WORD_DOCUMENT_DOWNLOADS=100
insert into product_feature(product_feature_id, feature_id, product_id, value)
values(6, 3, 2, 100);

--inserting into product_feature for "eSequence Premium" 
----NUMBER_OF_WORD_DOCUMENT_DOWNLOADS=150
insert into product_feature(product_feature_id, feature_id, product_id, value)
values(7, 3, 3, 150);

create table pay_pal_details(
username varchar2(150),
password varchar2(50),
apisignature varchar2(150),
environment varchar2(50),
encripted varchar2(10),
status varchar2(10),
CONSTRAINT pay_pal_details_username_pk PRIMARY KEY (username)
);


create table buy_details(
buy_enquiry_id number,
user_id varchar2(100),
user_name_email varchar2(100),
first_name varchar2(100),
last_name varchar2(100),
phone varchar2(35),
mobile varchar2(15),
company varchar2(100),
updated_date date,
message varchar2(200),
created_date date,
status varchar2(20),
CONSTRAINT buy_details_enquiry_id_pk PRIMARY KEY (buy_enquiry_id)
);
/*
create table property_name_mst(
property_id number,
property_name varchar2(100),
user_id number, --still should be able to share the property names with other users
CONSTRAINT property_id_pk PRIMARY KEY (property_id)
);

create table property_value(
value_id number,
property_id number,
system_name varchar2(100),
system_type varchar2(100),
user_id number, --should NOT be able to share the property value with other users
property_value varchar2(4000),
CONSTRAINT value_id_pk PRIMARY KEY (value_id)
);
*/
create table uc_seq_diagram_property(
property_id number,
user_id varchar2(100),
SEQ_MST_ID number,
SEQ_ITEM_ID number,
system_id number,
request_id number,
response_id number,
property_for varchar2(100), -- this will be either SYSTEM, REQUEST, RESPONSE
property_name varchar2(100),
property_value varchar2(4000),
CONSTRAINT property_id_pk PRIMARY KEY (property_id)
);
alter table UC_SEQ_DIAGRAM_PROPERTY add constraint seq_item_id_check check (seq_item_id>0);

create table uc_tip(
tip_id number,
user_id varchar2(100),
tip_name varchar2(50),
last_displayed_date date,
CONSTRAINT tip_pk PRIMARY KEY (tip_id)
);

create table uc_system_mst(
system_id number,
seq_mst_id number,
user_id varchar2(100),
system_type varchar2(50),
system_name varchar2(50),
description varchar2(4000),
created_date date,
CONSTRAINT system_id_pk PRIMARY KEY (system_id)
);
alter table uc_system_mst alter system_type not null;
alter table uc_system_mst alter system_name not null;
alter table uc_system_mst add constraint system_name_check check (system_name<>'');

create table uc_request_mst(
request_id number,
seq_mst_id number,
user_id varchar2(100),
system_id number,
request_protocol varchar2(50),
request_name varchar2(50),
description varchar2(4000),
created_date date,
CONSTRAINT request_id_pk PRIMARY KEY (request_id)
);
alter table uc_request_mst alter request_name not null;
alter table uc_request_mst add constraint request_name_check check (request_name <>'');
alter table uc_request_mst add constraint system_id_check check (system_id>0);

create table uc_response_mst(
response_id number,
seq_mst_id number,
user_id varchar2(100),
system_id number,
response_protocol varchar2(50),
response_name varchar2(50),
description varchar2(4000),
created_date date,
CONSTRAINT response_id_pk PRIMARY KEY (response_id)
);
alter table uc_response_mst alter response_name not null;
alter table uc_response_mst add constraint response_name_check check (response_name <>'');
alter table uc_response_mst add constraint response_system_id_check check (system_id>0);

delete from credential where user_id='951471d7-4c39-489f-ba04-c6f488900de2140331234454';
delete from UC_REQUEST_MST where user_id='951471d7-4c39-489f-ba04-c6f488900de2140331234454';
delete from UC_RESPONSE_MST where user_id='951471d7-4c39-489f-ba04-c6f488900de2140331234454';
delete from SESSION_RECORDS where user_id='951471d7-4c39-489f-ba04-c6f488900de2140331234454';
delete from UC_SEQ_DIAGRAM where user_id='951471d7-4c39-489f-ba04-c6f488900de2140331234454';
delete from UC_SEQ_DIAGRAM_PROPERTY where user_id='951471d7-4c39-489f-ba04-c6f488900de2140331234454';
delete from UC_SEQ_MST where user_id='951471d7-4c39-489f-ba04-c6f488900de2140331234454';
delete from UC_SYSTEM_MST where user_id='951471d7-4c39-489f-ba04-c6f488900de2140331234454';
delete from UC_TIP where user_id='951471d7-4c39-489f-ba04-c6f488900de2140331234454';
delete from CUSTOMER_SUBSCRIPTION where user_id='951471d7-4c39-489f-ba04-c6f488900de2140331234454';