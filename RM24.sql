PGDMP      *                |            RM24    16.3    16.3 r    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    17383    RM24    DATABASE     h   CREATE DATABASE "RM24" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'C';
    DROP DATABASE "RM24";
                postgres    false            �            1255    17726 g   insert_into_bills(character, character, character varying, character varying, character, text, numeric)    FUNCTION     2  CREATE FUNCTION public.insert_into_bills(in_bill_no character, in_order_id character, in_customer_first_name character varying, in_customer_last_name character varying, in_customer_id character, in_order_details text, in_total_amount numeric) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
    INSERT INTO Bills(bill_no, order_id, customer_first_name, customer_last_name, customer_id, order_details, total_amount)
    VALUES (in_bill_no, in_order_id, in_customer_first_name, in_customer_last_name, in_customer_id, in_order_details, in_total_amount);
END;
$$;
 �   DROP FUNCTION public.insert_into_bills(in_bill_no character, in_order_id character, in_customer_first_name character varying, in_customer_last_name character varying, in_customer_id character, in_order_details text, in_total_amount numeric);
       public          postgres    false            �            1255    17724 u   insert_into_clients(character, character, character varying, character varying, character varying, character varying)    FUNCTION     �  CREATE FUNCTION public.insert_into_clients(in_customer_id character, in_restaurant_id character, in_first_name character varying, in_last_name character varying, in_phone character varying, in_email character varying) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
    INSERT INTO Clients(customer_id, restaurant_id, first_name, last_name, phone, email)
    VALUES (in_customer_id, in_restaurant_id, in_first_name, in_last_name, in_phone, in_email);
END;
$$;
 �   DROP FUNCTION public.insert_into_clients(in_customer_id character, in_restaurant_id character, in_first_name character varying, in_last_name character varying, in_phone character varying, in_email character varying);
       public          postgres    false            �            1255    17728 :   insert_into_cooks(character, character varying, character)    FUNCTION       CREATE FUNCTION public.insert_into_cooks(in_cook_id character, in_cook_name character varying, in_order_id character) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
    INSERT INTO Cooks(cook_id, cook_name, order_id)
    VALUES (in_cook_id, in_cook_name, in_order_id);
END;
$$;
 u   DROP FUNCTION public.insert_into_cooks(in_cook_id character, in_cook_name character varying, in_order_id character);
       public          postgres    false            �            1255    17725 z   insert_into_orders(character, character, character varying, integer, text, timestamp without time zone, character varying)    FUNCTION     7  CREATE FUNCTION public.insert_into_orders(in_order_id character, in_customer_id character, in_customer_first_name character varying, in_no_of_items integer, in_descriptions text, in_created_at timestamp without time zone, in_order_status character varying) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
    INSERT INTO Orders(order_id, customer_id, customer_first_name, no_of_items, descriptions, created_at, order_status)
    VALUES (in_order_id, in_customer_id, in_customer_first_name, in_no_of_items, in_descriptions, in_created_at, in_order_status);
END;
$$;
    DROP FUNCTION public.insert_into_orders(in_order_id character, in_customer_id character, in_customer_first_name character varying, in_no_of_items integer, in_descriptions text, in_created_at timestamp without time zone, in_order_status character varying);
       public          postgres    false            �            1255    17729 R   insert_into_suppliers(character, character varying, text, character varying, text)    FUNCTION     �  CREATE FUNCTION public.insert_into_suppliers(in_supplier_id character, in_supplier_name character varying, in_address text, in_contact character varying, in_details text) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
    INSERT INTO Suppliers(supplier_id, supplier_name, address, contact, details)
    VALUES (in_supplier_id, in_supplier_name, in_address, in_contact, in_details);
END;
$$;
 �   DROP FUNCTION public.insert_into_suppliers(in_supplier_id character, in_supplier_name character varying, in_address text, in_contact character varying, in_details text);
       public          postgres    false            �            1255    17730 9   insert_into_tables(character, integer, character varying)    FUNCTION       CREATE FUNCTION public.insert_into_tables(in_table_number character, in_capacity integer, in_status character varying) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
    INSERT INTO Tables(table_number, capacity, status)
    VALUES (in_table_number, in_capacity, in_status);
END;
$$;
 v   DROP FUNCTION public.insert_into_tables(in_table_number character, in_capacity integer, in_status character varying);
       public          postgres    false            �            1255    17727 G   insert_into_waiters(character, character varying, character, character)    FUNCTION     ]  CREATE FUNCTION public.insert_into_waiters(in_waiter_id character, in_first_name character varying, in_customer_id character, in_order_id character) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
    INSERT INTO Waiters(waiter_id, first_name, customer_id, order_id)
    VALUES (in_waiter_id, in_first_name, in_customer_id, in_order_id);
END;
$$;
 �   DROP FUNCTION public.insert_into_waiters(in_waiter_id character, in_first_name character varying, in_customer_id character, in_order_id character);
       public          postgres    false            �            1255    18119    validate_bill_amount()    FUNCTION     �   CREATE FUNCTION public.validate_bill_amount() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    IF NEW.total_amount < 0 THEN
        RAISE EXCEPTION 'Total amount must be non-negative: %', NEW.total_amount;
    END IF;
    RETURN NEW;
END;
$$;
 -   DROP FUNCTION public.validate_bill_amount();
       public          postgres    false            �            1255    18115    validate_order_status()    FUNCTION     /  CREATE FUNCTION public.validate_order_status() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    IF NEW.order_status NOT IN ('Pending', 'Preparing', 'Served', 'Completed', 'Cancelled') THEN
        RAISE EXCEPTION 'Invalid order status: %', NEW.order_status;
    END IF;
    RETURN NEW;
END;
$$;
 .   DROP FUNCTION public.validate_order_status();
       public          postgres    false            �            1255    18117    validate_table_status()    FUNCTION       CREATE FUNCTION public.validate_table_status() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    IF NEW.status NOT IN ('Available', 'Occupied', 'Reserved', 'Out of Service') THEN
        RAISE EXCEPTION 'Invalid table status: %', NEW.status;
    END IF;
    RETURN NEW;
END;
$$;
 .   DROP FUNCTION public.validate_table_status();
       public          postgres    false            �            1259    17559    admin    TABLE     �   CREATE TABLE public.admin (
    username character varying(20),
    pass character varying(20),
    restaurant_id character varying(8)
);
    DROP TABLE public.admin;
       public         heap    postgres    false            �            1259    17587    bill    TABLE     ;  CREATE TABLE public.bill (
    bill_no character varying(8) NOT NULL,
    order_id character varying(8),
    customer_fname character varying(20),
    customer_lname character varying(20) NOT NULL,
    customer_id character varying(8),
    order_dtl character varying(30),
    total_amount character varying(10)
);
    DROP TABLE public.bill;
       public         heap    postgres    false            �            1259    17714 	   bill_info    TABLE     n   CREATE TABLE public.bill_info (
    bill_no character varying(8),
    price character varying(15) NOT NULL
);
    DROP TABLE public.bill_info;
       public         heap    postgres    false            �            1259    17756    bills    TABLE     	  CREATE TABLE public.bills (
    bill_no character(4) NOT NULL,
    order_id character(4),
    customer_first_name character varying(50),
    customer_last_name character varying(50),
    customer_id character(4),
    order_details text,
    total_amount numeric
);
    DROP TABLE public.bills;
       public         heap    postgres    false            �            1259    17751    clients    TABLE     �   CREATE TABLE public.clients (
    customer_id character(4) NOT NULL,
    restaurant_id character(4),
    first_name character varying(50),
    last_name character varying(50),
    phone character varying(15),
    email character varying(100)
);
    DROP TABLE public.clients;
       public         heap    postgres    false            �            1259    17840    bills_by_clients    VIEW       CREATE VIEW public.bills_by_clients AS
 SELECT b.bill_no,
    b.order_id,
    b.customer_first_name,
    b.customer_last_name,
    b.customer_id,
    b.order_details,
    b.total_amount
   FROM (public.bills b
     JOIN public.clients c ON ((b.customer_id = c.customer_id)));
 #   DROP VIEW public.bills_by_clients;
       public          postgres    false    235    235    234    235    235    235    235    235            �            1259    17685    cook    TABLE     �   CREATE TABLE public.cook (
    cook_id character varying(8),
    cook_name character varying(20),
    order_id character varying(8)
);
    DROP TABLE public.cook;
       public         heap    postgres    false            �            1259    17675 	   cook_info    TABLE       CREATE TABLE public.cook_info (
    cook_id character varying(8) NOT NULL,
    fname character varying(15) NOT NULL,
    lname character varying(15) NOT NULL,
    contact character varying(20) NOT NULL,
    address character varying(30),
    salary character varying(30),
    sex character(1),
    bdate date,
    join_date date NOT NULL,
    specialization character varying(50)
);
    DROP TABLE public.cook_info;
       public         heap    postgres    false            �            1259    17788    cooks    TABLE     �   CREATE TABLE public.cooks (
    cook_id character(4) NOT NULL,
    cook_name character varying(50),
    order_id character(4)
);
    DROP TABLE public.cooks;
       public         heap    postgres    false            �            1259    17577    orders    TABLE     +  CREATE TABLE public.orders (
    order_id character varying(8) NOT NULL,
    customer_id character varying(8),
    customer_fname character varying(20),
    no_of_items integer,
    descriptions character varying(100),
    created_at time without time zone,
    order_status character varying(7)
);
    DROP TABLE public.orders;
       public         heap    postgres    false            �            1259    17849    cooks_preparing_orders    VIEW     �   CREATE VIEW public.cooks_preparing_orders AS
 SELECT k.cook_id,
    k.cook_name,
    o.order_id
   FROM (public.cooks k
     JOIN public.orders o ON ((k.order_id = (o.order_id)::bpchar)));
 )   DROP VIEW public.cooks_preparing_orders;
       public          postgres    false    237    237    218    237            �            1259    17567 	   customers    TABLE       CREATE TABLE public.customers (
    customer_id character varying(8) NOT NULL,
    restaurant_id character varying(8),
    customer_fname character varying(20),
    customer_lname character varying(20),
    customer_phone character varying(20),
    email_id character varying(30)
);
    DROP TABLE public.customers;
       public         heap    postgres    false            �            1259    17665    food    TABLE     �   CREATE TABLE public.food (
    food_id character varying(8) NOT NULL,
    order_id character varying(8),
    quantity integer,
    descriptions character varying(100),
    price integer
);
    DROP TABLE public.food;
       public         heap    postgres    false            �            1259    17706 	   food_info    TABLE     z   CREATE TABLE public.food_info (
    food_id character varying(8),
    quantity integer,
    price character varying(8)
);
    DROP TABLE public.food_info;
       public         heap    postgres    false            �            1259    17655    ingredients    TABLE       CREATE TABLE public.ingredients (
    ingredient_id character varying(8) NOT NULL,
    ingname character varying(30) NOT NULL,
    quantity character varying(15) NOT NULL,
    descp character varying(100),
    supp_id character varying(8),
    supp_name character varying(8)
);
    DROP TABLE public.ingredients;
       public         heap    postgres    false            �            1259    17680    manager_info    TABLE     8  CREATE TABLE public.manager_info (
    manager_id character varying(6) NOT NULL,
    fname character varying(15),
    lname character varying(15),
    contact character varying(20),
    address character varying(30),
    salary character varying(30),
    sex character(1),
    b_date date,
    join_date date
);
     DROP TABLE public.manager_info;
       public         heap    postgres    false            �            1259    17698 
   order_info    TABLE     �   CREATE TABLE public.order_info (
    order_id character varying(8),
    no_of_items integer,
    order_time time without time zone
);
    DROP TABLE public.order_info;
       public         heap    postgres    false            �            1259    17836    orders_by_clients    VIEW     #  CREATE VIEW public.orders_by_clients AS
 SELECT c.customer_id,
    c.first_name,
    c.last_name,
    o.order_id,
    o.no_of_items,
    o.descriptions,
    o.created_at,
    o.order_status
   FROM (public.clients c
     JOIN public.orders o ON ((c.customer_id = (o.customer_id)::bpchar)));
 $   DROP VIEW public.orders_by_clients;
       public          postgres    false    218    218    218    218    218    234    234    234    218            �            1259    17635    payment    TABLE     M  CREATE TABLE public.payment (
    pay_id character varying(6) NOT NULL,
    pay_code character varying(20) NOT NULL,
    order_code character varying(20) NOT NULL,
    order_id character varying(8),
    customer_id character varying(8),
    pay_amount character varying(20) NOT NULL,
    pay_method character varying(30) NOT NULL
);
    DROP TABLE public.payment;
       public         heap    postgres    false            �            1259    17625    products    TABLE       CREATE TABLE public.products (
    prod_id character varying(6) NOT NULL,
    prod_code character varying(20),
    prod_name character varying(20) NOT NULL,
    prod_image character varying(20) NOT NULL,
    prod_desc character varying(100),
    prod_price bigint NOT NULL
);
    DROP TABLE public.products;
       public         heap    postgres    false            �            1259    17554    restaurant_info    TABLE       CREATE TABLE public.restaurant_info (
    restaurant_id character varying(8) NOT NULL,
    restaurant_name character varying(20),
    restaurant_phone character varying(20),
    reslocation character varying(30),
    opening_closing_time character varying(30)
);
 #   DROP TABLE public.restaurant_info;
       public         heap    postgres    false            �            1259    17630    staff    TABLE       CREATE TABLE public.staff (
    staff_id character varying(6) NOT NULL,
    staff_name character varying(20) NOT NULL,
    staff_number character varying(20) NOT NULL,
    staff_email character varying(20) NOT NULL,
    staff_password character varying(20) NOT NULL
);
    DROP TABLE public.staff;
       public         heap    postgres    false            �            1259    17650    supplier    TABLE     �   CREATE TABLE public.supplier (
    supp_id character varying(8) NOT NULL,
    supp_name character varying(8) NOT NULL,
    address character varying(30) NOT NULL,
    contact character varying(20) NOT NULL,
    details character varying(200)
);
    DROP TABLE public.supplier;
       public         heap    postgres    false            �            1259    17798 	   suppliers    TABLE     �   CREATE TABLE public.suppliers (
    supplier_id character(4) NOT NULL,
    supplier_name character varying(100),
    address text,
    contact character varying(15),
    details text
);
    DROP TABLE public.suppliers;
       public         heap    postgres    false            �            1259    17853    supplier_details    VIEW     �   CREATE VIEW public.supplier_details AS
 SELECT supplier_id,
    supplier_name,
    address,
    contact,
    details
   FROM public.suppliers s;
 #   DROP VIEW public.supplier_details;
       public          postgres    false    238    238    238    238    238            �            1259    17805    tables    TABLE        CREATE TABLE public.tables (
    table_number character(4) NOT NULL,
    capacity integer,
    status character varying(50)
);
    DROP TABLE public.tables;
       public         heap    postgres    false            �            1259    17607    waiter    TABLE     �   CREATE TABLE public.waiter (
    waiter_id character varying(6),
    fname character varying(20),
    customer_id character varying(8),
    order_id character varying(8)
);
    DROP TABLE public.waiter;
       public         heap    postgres    false            �            1259    17602    waiter_info    TABLE     P  CREATE TABLE public.waiter_info (
    waiter_id character varying(6) NOT NULL,
    fname character varying(15),
    lname character varying(15) NOT NULL,
    contact character varying(20) NOT NULL,
    address character varying(30),
    salary character varying(30),
    sex character(1),
    bdate date,
    join_date date NOT NULL
);
    DROP TABLE public.waiter_info;
       public         heap    postgres    false            �            1259    17773    waiters    TABLE     �   CREATE TABLE public.waiters (
    waiter_id character(4) NOT NULL,
    first_name character varying(50),
    customer_id character(4),
    order_id character(4)
);
    DROP TABLE public.waiters;
       public         heap    postgres    false            �            1259    17844    waiters_serving_clients    VIEW     w  CREATE VIEW public.waiters_serving_clients AS
 SELECT w.waiter_id,
    w.first_name AS waiter_name,
    c.customer_id,
    c.first_name AS customer_first_name,
    c.last_name AS customer_last_name,
    o.order_id
   FROM ((public.waiters w
     JOIN public.clients c ON ((w.customer_id = c.customer_id)))
     JOIN public.orders o ON ((w.order_id = (o.order_id)::bpchar)));
 *   DROP VIEW public.waiters_serving_clients;
       public          postgres    false    236    236    236    236    234    234    234    218            �          0    17559    admin 
   TABLE DATA           >   COPY public.admin (username, pass, restaurant_id) FROM stdin;
    public          postgres    false    216   )�       �          0    17587    bill 
   TABLE DATA           w   COPY public.bill (bill_no, order_id, customer_fname, customer_lname, customer_id, order_dtl, total_amount) FROM stdin;
    public          postgres    false    219   ^�       �          0    17714 	   bill_info 
   TABLE DATA           3   COPY public.bill_info (bill_no, price) FROM stdin;
    public          postgres    false    233   {�       �          0    17756    bills 
   TABLE DATA           �   COPY public.bills (bill_no, order_id, customer_first_name, customer_last_name, customer_id, order_details, total_amount) FROM stdin;
    public          postgres    false    235   ��       �          0    17751    clients 
   TABLE DATA           b   COPY public.clients (customer_id, restaurant_id, first_name, last_name, phone, email) FROM stdin;
    public          postgres    false    234   ��       �          0    17685    cook 
   TABLE DATA           <   COPY public.cook (cook_id, cook_name, order_id) FROM stdin;
    public          postgres    false    230   ң       �          0    17675 	   cook_info 
   TABLE DATA           {   COPY public.cook_info (cook_id, fname, lname, contact, address, salary, sex, bdate, join_date, specialization) FROM stdin;
    public          postgres    false    228   �       �          0    17788    cooks 
   TABLE DATA           =   COPY public.cooks (cook_id, cook_name, order_id) FROM stdin;
    public          postgres    false    237   �       �          0    17567 	   customers 
   TABLE DATA           y   COPY public.customers (customer_id, restaurant_id, customer_fname, customer_lname, customer_phone, email_id) FROM stdin;
    public          postgres    false    217   )�       �          0    17665    food 
   TABLE DATA           P   COPY public.food (food_id, order_id, quantity, descriptions, price) FROM stdin;
    public          postgres    false    227   z�       �          0    17706 	   food_info 
   TABLE DATA           =   COPY public.food_info (food_id, quantity, price) FROM stdin;
    public          postgres    false    232   ��       �          0    17655    ingredients 
   TABLE DATA           b   COPY public.ingredients (ingredient_id, ingname, quantity, descp, supp_id, supp_name) FROM stdin;
    public          postgres    false    226   ��       �          0    17680    manager_info 
   TABLE DATA           r   COPY public.manager_info (manager_id, fname, lname, contact, address, salary, sex, b_date, join_date) FROM stdin;
    public          postgres    false    229   Ѥ       �          0    17698 
   order_info 
   TABLE DATA           G   COPY public.order_info (order_id, no_of_items, order_time) FROM stdin;
    public          postgres    false    231   �       �          0    17577    orders 
   TABLE DATA           |   COPY public.orders (order_id, customer_id, customer_fname, no_of_items, descriptions, created_at, order_status) FROM stdin;
    public          postgres    false    218   �       �          0    17635    payment 
   TABLE DATA           n   COPY public.payment (pay_id, pay_code, order_code, order_id, customer_id, pay_amount, pay_method) FROM stdin;
    public          postgres    false    224   (�       �          0    17625    products 
   TABLE DATA           d   COPY public.products (prod_id, prod_code, prod_name, prod_image, prod_desc, prod_price) FROM stdin;
    public          postgres    false    222   E�       �          0    17554    restaurant_info 
   TABLE DATA           ~   COPY public.restaurant_info (restaurant_id, restaurant_name, restaurant_phone, reslocation, opening_closing_time) FROM stdin;
    public          postgres    false    215   b�       �          0    17630    staff 
   TABLE DATA           `   COPY public.staff (staff_id, staff_name, staff_number, staff_email, staff_password) FROM stdin;
    public          postgres    false    223   ̥       �          0    17650    supplier 
   TABLE DATA           Q   COPY public.supplier (supp_id, supp_name, address, contact, details) FROM stdin;
    public          postgres    false    225   �       �          0    17798 	   suppliers 
   TABLE DATA           Z   COPY public.suppliers (supplier_id, supplier_name, address, contact, details) FROM stdin;
    public          postgres    false    238   �       �          0    17805    tables 
   TABLE DATA           @   COPY public.tables (table_number, capacity, status) FROM stdin;
    public          postgres    false    239   #�       �          0    17607    waiter 
   TABLE DATA           I   COPY public.waiter (waiter_id, fname, customer_id, order_id) FROM stdin;
    public          postgres    false    221   @�       �          0    17602    waiter_info 
   TABLE DATA           o   COPY public.waiter_info (waiter_id, fname, lname, contact, address, salary, sex, bdate, join_date) FROM stdin;
    public          postgres    false    220   ]�       �          0    17773    waiters 
   TABLE DATA           O   COPY public.waiters (waiter_id, first_name, customer_id, order_id) FROM stdin;
    public          postgres    false    236   z�                  2606    17718    bill_info bill_info_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public.bill_info
    ADD CONSTRAINT bill_info_pkey PRIMARY KEY (price);
 B   ALTER TABLE ONLY public.bill_info DROP CONSTRAINT bill_info_pkey;
       public            postgres    false    233            �           2606    17591    bill bill_pkey 
   CONSTRAINT     Q   ALTER TABLE ONLY public.bill
    ADD CONSTRAINT bill_pkey PRIMARY KEY (bill_no);
 8   ALTER TABLE ONLY public.bill DROP CONSTRAINT bill_pkey;
       public            postgres    false    219                       2606    17762    bills bills_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY public.bills
    ADD CONSTRAINT bills_pkey PRIMARY KEY (bill_no);
 :   ALTER TABLE ONLY public.bills DROP CONSTRAINT bills_pkey;
       public            postgres    false    235                       2606    17755    clients clients_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY public.clients
    ADD CONSTRAINT clients_pkey PRIMARY KEY (customer_id);
 >   ALTER TABLE ONLY public.clients DROP CONSTRAINT clients_pkey;
       public            postgres    false    234            	           2606    17679    cook_info cook_info_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY public.cook_info
    ADD CONSTRAINT cook_info_pkey PRIMARY KEY (cook_id);
 B   ALTER TABLE ONLY public.cook_info DROP CONSTRAINT cook_info_pkey;
       public            postgres    false    228                       2606    17792    cooks cooks_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY public.cooks
    ADD CONSTRAINT cooks_pkey PRIMARY KEY (cook_id);
 :   ALTER TABLE ONLY public.cooks DROP CONSTRAINT cooks_pkey;
       public            postgres    false    237            �           2606    17571    customers customers_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_pkey PRIMARY KEY (customer_id);
 B   ALTER TABLE ONLY public.customers DROP CONSTRAINT customers_pkey;
       public            postgres    false    217                       2606    17669    food food_pkey 
   CONSTRAINT     Q   ALTER TABLE ONLY public.food
    ADD CONSTRAINT food_pkey PRIMARY KEY (food_id);
 8   ALTER TABLE ONLY public.food DROP CONSTRAINT food_pkey;
       public            postgres    false    227                       2606    17659    ingredients ingredients_pkey 
   CONSTRAINT     e   ALTER TABLE ONLY public.ingredients
    ADD CONSTRAINT ingredients_pkey PRIMARY KEY (ingredient_id);
 F   ALTER TABLE ONLY public.ingredients DROP CONSTRAINT ingredients_pkey;
       public            postgres    false    226                       2606    17684    manager_info manager_info_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.manager_info
    ADD CONSTRAINT manager_info_pkey PRIMARY KEY (manager_id);
 H   ALTER TABLE ONLY public.manager_info DROP CONSTRAINT manager_info_pkey;
       public            postgres    false    229            �           2606    17581    orders orders_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (order_id);
 <   ALTER TABLE ONLY public.orders DROP CONSTRAINT orders_pkey;
       public            postgres    false    218                       2606    17639    payment payment_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.payment
    ADD CONSTRAINT payment_pkey PRIMARY KEY (pay_id);
 >   ALTER TABLE ONLY public.payment DROP CONSTRAINT payment_pkey;
       public            postgres    false    224            �           2606    17629    products products_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (prod_id);
 @   ALTER TABLE ONLY public.products DROP CONSTRAINT products_pkey;
       public            postgres    false    222            �           2606    17558 $   restaurant_info restaurant_info_pkey 
   CONSTRAINT     m   ALTER TABLE ONLY public.restaurant_info
    ADD CONSTRAINT restaurant_info_pkey PRIMARY KEY (restaurant_id);
 N   ALTER TABLE ONLY public.restaurant_info DROP CONSTRAINT restaurant_info_pkey;
       public            postgres    false    215            �           2606    17634    staff staff_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.staff
    ADD CONSTRAINT staff_pkey PRIMARY KEY (staff_id);
 :   ALTER TABLE ONLY public.staff DROP CONSTRAINT staff_pkey;
       public            postgres    false    223                       2606    17654    supplier supplier_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public.supplier
    ADD CONSTRAINT supplier_pkey PRIMARY KEY (supp_id);
 @   ALTER TABLE ONLY public.supplier DROP CONSTRAINT supplier_pkey;
       public            postgres    false    225                       2606    17804    suppliers suppliers_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public.suppliers
    ADD CONSTRAINT suppliers_pkey PRIMARY KEY (supplier_id);
 B   ALTER TABLE ONLY public.suppliers DROP CONSTRAINT suppliers_pkey;
       public            postgres    false    238                       2606    17809    tables tables_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.tables
    ADD CONSTRAINT tables_pkey PRIMARY KEY (table_number);
 <   ALTER TABLE ONLY public.tables DROP CONSTRAINT tables_pkey;
       public            postgres    false    239            �           2606    17606    waiter_info waiter_info_pkey 
   CONSTRAINT     a   ALTER TABLE ONLY public.waiter_info
    ADD CONSTRAINT waiter_info_pkey PRIMARY KEY (waiter_id);
 F   ALTER TABLE ONLY public.waiter_info DROP CONSTRAINT waiter_info_pkey;
       public            postgres    false    220                       2606    17777    waiters waiters_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public.waiters
    ADD CONSTRAINT waiters_pkey PRIMARY KEY (waiter_id);
 >   ALTER TABLE ONLY public.waiters DROP CONSTRAINT waiters_pkey;
       public            postgres    false    236            1           2620    18120    bills trg_validate_bill_amount    TRIGGER     �   CREATE TRIGGER trg_validate_bill_amount BEFORE INSERT OR UPDATE ON public.bills FOR EACH ROW EXECUTE FUNCTION public.validate_bill_amount();
 7   DROP TRIGGER trg_validate_bill_amount ON public.bills;
       public          postgres    false    254    235            0           2620    18116     orders trg_validate_order_status    TRIGGER     �   CREATE TRIGGER trg_validate_order_status BEFORE INSERT OR UPDATE ON public.orders FOR EACH ROW EXECUTE FUNCTION public.validate_order_status();
 9   DROP TRIGGER trg_validate_order_status ON public.orders;
       public          postgres    false    218    252            2           2620    18118     tables trg_validate_table_status    TRIGGER     �   CREATE TRIGGER trg_validate_table_status BEFORE INSERT OR UPDATE ON public.tables FOR EACH ROW EXECUTE FUNCTION public.validate_table_status();
 9   DROP TRIGGER trg_validate_table_status ON public.tables;
       public          postgres    false    253    239                       2606    17562    admin admin_restaurant_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.admin
    ADD CONSTRAINT admin_restaurant_id_fkey FOREIGN KEY (restaurant_id) REFERENCES public.restaurant_info(restaurant_id);
 H   ALTER TABLE ONLY public.admin DROP CONSTRAINT admin_restaurant_id_fkey;
       public          postgres    false    215    216    3571                       2606    17597    bill bill_customer_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.bill
    ADD CONSTRAINT bill_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES public.customers(customer_id);
 D   ALTER TABLE ONLY public.bill DROP CONSTRAINT bill_customer_id_fkey;
       public          postgres    false    217    3573    219            *           2606    17719     bill_info bill_info_bill_no_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.bill_info
    ADD CONSTRAINT bill_info_bill_no_fkey FOREIGN KEY (bill_no) REFERENCES public.bill(bill_no);
 J   ALTER TABLE ONLY public.bill_info DROP CONSTRAINT bill_info_bill_no_fkey;
       public          postgres    false    219    233    3577                       2606    17592    bill bill_order_id_fkey    FK CONSTRAINT     ~   ALTER TABLE ONLY public.bill
    ADD CONSTRAINT bill_order_id_fkey FOREIGN KEY (order_id) REFERENCES public.orders(order_id);
 A   ALTER TABLE ONLY public.bill DROP CONSTRAINT bill_order_id_fkey;
       public          postgres    false    219    218    3575            +           2606    17768    bills bills_customer_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.bills
    ADD CONSTRAINT bills_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES public.clients(customer_id);
 F   ALTER TABLE ONLY public.bills DROP CONSTRAINT bills_customer_id_fkey;
       public          postgres    false    234    3599    235            ,           2606    17763    bills bills_order_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.bills
    ADD CONSTRAINT bills_order_id_fkey FOREIGN KEY (order_id) REFERENCES public.orders(order_id);
 C   ALTER TABLE ONLY public.bills DROP CONSTRAINT bills_order_id_fkey;
       public          postgres    false    235    218    3575            &           2606    17688    cook cook_cook_id_fkey    FK CONSTRAINT     ~   ALTER TABLE ONLY public.cook
    ADD CONSTRAINT cook_cook_id_fkey FOREIGN KEY (cook_id) REFERENCES public.cook_info(cook_id);
 @   ALTER TABLE ONLY public.cook DROP CONSTRAINT cook_cook_id_fkey;
       public          postgres    false    228    3593    230            '           2606    17693    cook cook_order_id_fkey    FK CONSTRAINT     ~   ALTER TABLE ONLY public.cook
    ADD CONSTRAINT cook_order_id_fkey FOREIGN KEY (order_id) REFERENCES public.orders(order_id);
 A   ALTER TABLE ONLY public.cook DROP CONSTRAINT cook_order_id_fkey;
       public          postgres    false    230    218    3575            /           2606    17793    cooks cooks_order_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.cooks
    ADD CONSTRAINT cooks_order_id_fkey FOREIGN KEY (order_id) REFERENCES public.orders(order_id);
 C   ALTER TABLE ONLY public.cooks DROP CONSTRAINT cooks_order_id_fkey;
       public          postgres    false    3575    237    218                       2606    17572 &   customers customers_restaurant_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_restaurant_id_fkey FOREIGN KEY (restaurant_id) REFERENCES public.restaurant_info(restaurant_id);
 P   ALTER TABLE ONLY public.customers DROP CONSTRAINT customers_restaurant_id_fkey;
       public          postgres    false    3571    217    215            )           2606    17709     food_info food_info_food_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.food_info
    ADD CONSTRAINT food_info_food_id_fkey FOREIGN KEY (food_id) REFERENCES public.food(food_id);
 J   ALTER TABLE ONLY public.food_info DROP CONSTRAINT food_info_food_id_fkey;
       public          postgres    false    227    3591    232            %           2606    17670    food food_order_id_fkey    FK CONSTRAINT     ~   ALTER TABLE ONLY public.food
    ADD CONSTRAINT food_order_id_fkey FOREIGN KEY (order_id) REFERENCES public.orders(order_id);
 A   ALTER TABLE ONLY public.food DROP CONSTRAINT food_order_id_fkey;
       public          postgres    false    3575    218    227            $           2606    17660 $   ingredients ingredients_supp_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.ingredients
    ADD CONSTRAINT ingredients_supp_id_fkey FOREIGN KEY (supp_id) REFERENCES public.supplier(supp_id);
 N   ALTER TABLE ONLY public.ingredients DROP CONSTRAINT ingredients_supp_id_fkey;
       public          postgres    false    226    3587    225            (           2606    17701 #   order_info order_info_order_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.order_info
    ADD CONSTRAINT order_info_order_id_fkey FOREIGN KEY (order_id) REFERENCES public.orders(order_id);
 M   ALTER TABLE ONLY public.order_info DROP CONSTRAINT order_info_order_id_fkey;
       public          postgres    false    231    3575    218                       2606    17582    orders orders_customer_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES public.customers(customer_id);
 H   ALTER TABLE ONLY public.orders DROP CONSTRAINT orders_customer_id_fkey;
       public          postgres    false    217    218    3573            "           2606    17645     payment payment_customer_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.payment
    ADD CONSTRAINT payment_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES public.customers(customer_id);
 J   ALTER TABLE ONLY public.payment DROP CONSTRAINT payment_customer_id_fkey;
       public          postgres    false    3573    224    217            #           2606    17640    payment payment_order_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.payment
    ADD CONSTRAINT payment_order_id_fkey FOREIGN KEY (order_id) REFERENCES public.orders(order_id);
 G   ALTER TABLE ONLY public.payment DROP CONSTRAINT payment_order_id_fkey;
       public          postgres    false    3575    218    224                       2606    17615    waiter waiter_customer_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.waiter
    ADD CONSTRAINT waiter_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES public.customers(customer_id);
 H   ALTER TABLE ONLY public.waiter DROP CONSTRAINT waiter_customer_id_fkey;
       public          postgres    false    217    3573    221                        2606    17620    waiter waiter_order_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.waiter
    ADD CONSTRAINT waiter_order_id_fkey FOREIGN KEY (order_id) REFERENCES public.orders(order_id);
 E   ALTER TABLE ONLY public.waiter DROP CONSTRAINT waiter_order_id_fkey;
       public          postgres    false    218    3575    221            !           2606    17610    waiter waiter_waiter_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.waiter
    ADD CONSTRAINT waiter_waiter_id_fkey FOREIGN KEY (waiter_id) REFERENCES public.waiter_info(waiter_id);
 F   ALTER TABLE ONLY public.waiter DROP CONSTRAINT waiter_waiter_id_fkey;
       public          postgres    false    3579    221    220            -           2606    17778     waiters waiters_customer_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.waiters
    ADD CONSTRAINT waiters_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES public.clients(customer_id);
 J   ALTER TABLE ONLY public.waiters DROP CONSTRAINT waiters_customer_id_fkey;
       public          postgres    false    3599    236    234            .           2606    17783    waiters waiters_order_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.waiters
    ADD CONSTRAINT waiters_order_id_fkey FOREIGN KEY (order_id) REFERENCES public.orders(order_id);
 G   ALTER TABLE ONLY public.waiters DROP CONSTRAINT waiters_order_id_fkey;
       public          postgres    false    236    3575    218            �   %   x�KL���3�,H,..�/J142�200����� ���      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �   A   x�s600�200������t�O崴0�535�5624�����:�V$���%��r��qqq �pT      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �   Z   x�200�N�-�IUJ-.I,-J�+�442�515�5��4 q|3��Kt�3K*�d~i^IQ%�������������������� PO�      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �     