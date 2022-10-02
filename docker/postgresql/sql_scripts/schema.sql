-- Criação de Database e Tabelas
-- Banco de Dados Transacional Olist

CREATE DATABASE olist_db ENCODING = 'UTF8';

ALTER DATABASE olist_db OWNER TO postgres;

\connect olist_db

CREATE TABLE customers (
    customer_id char(32) not null,
    customer_unique_id char(32) not null,
    customer_zip_code_prefix char(5) not null,
    customer_city varchar(32) not null,
    customer_state char(2) not null,
    primary key (customer_id)
);

create table products (
	product_id char(32) not null,
	product_category_name varchar(100),
	product_name_length integer,
	product_description_length integer,
	product_photos_qty integer,
	product_weight_g integer,
	product_length_cm integer,
	product_height_cm integer,
	product_width_cm integer,
	primary key (product_id)
);

CREATE TABLE sellers (
    seller_id char(32) not null,
    seller_zip_code_prefix char(5) not null,
    seller_city varchar(80) not null,
    seller_state char(2) not null,
    primary key (seller_id)
);

CREATE TABLE geolocations (
    geolocation_zip_code_prefix char(5) not null,
    geolocation_lat float8 not null, 
    geolocation_lng float8 not null, 
    geolocation_city varchar(80) not null,
    geolocation_state char(2) not null
);

CREATE TABLE orders (
    order_id char(32) not null,
    customer_id char(32) not null,
    order_status varchar(20) not null,
    order_purchase_timestamp timestamp not null,
    order_approved_at timestamp,
    order_delivered_carrier_date timestamp,
    order_delivered_customer_date timestamp,
    order_estimated_delivery_date timestamp,
    primary key(order_id)
);

CREATE TABLE order_items (
    order_id char(32) not null,
    order_item_id smallint not null,
    product_id char(32) not null,
    seller_id char(32) not null,
    shipping_limit_date timestamp not null,
    price decimal(10,2) not null,
    freight_value decimal(10,2) not null,
    primary key (order_id, order_item_id)
);

CREATE TABLE order_payments (
    order_id char(32) not null,
    payment_sequential smallint not null,
    payment_type varchar(15) not null,
    payment_installments smallint not null,
    payment_value decimal(10,2) not null,
    primary key (order_id, payment_sequential)
);

CREATE TABLE order_reviews (
    review_id char(32) not null,
    order_id char(32) not null,
    review_score smallint not null,
    review_comment_title varchar(50),
    review_comment_message text,
    review_creation_date timestamp not null,
    review_answer_timestamp timestamp not null
);

\copy customers from '/files/olist_customers_dataset.csv' csv header
\copy products from '/files/olist_products_dataset.csv' csv header
\copy sellers from '/files/olist_sellers_dataset.csv' csv header
\copy geolocations from '/files/olist_geolocation_dataset.csv' csv header
\copy orders from '/files/olist_orders_dataset.csv' csv header
\copy order_items from '/files/olist_order_items_dataset.csv' csv header
\copy order_payments from '/files/olist_order_payments_dataset.csv' csv header
\copy order_reviews from '/files/olist_order_reviews_dataset.csv' csv header