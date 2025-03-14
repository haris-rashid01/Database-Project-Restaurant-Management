PGDMP  	    9                |            RestaurantManagementSystem    16.2    16.2 K    n           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            o           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            p           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            q           1262    24576    RestaurantManagementSystem    DATABASE     �   CREATE DATABASE "RestaurantManagementSystem" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_Pakistan.1252';
 ,   DROP DATABASE "RestaurantManagementSystem";
                postgres    false            �            1259    41151     Waiter_Info    TABLE     �  CREATE TABLE public." Waiter_Info" (
    "Waiter_Id" character varying(6) NOT NULL,
    "Fname" character varying(15) NOT NULL,
    "Lname" character varying(15) NOT NULL,
    "Contact" character varying(20) NOT NULL,
    "Addrss" character varying(30) NOT NULL,
    "Salary" character varying(30) NOT NULL,
    "Sex" "char" NOT NULL,
    "Birth_date" date NOT NULL,
    "Join_Date" date NOT NULL
);
 "   DROP TABLE public." Waiter_Info";
       public         heap    postgres    false            �            1259    41134    Bill    TABLE     r  CREATE TABLE public."Bill" (
    "Bill_No" character varying(8) NOT NULL,
    "Order_Id" character varying(8) NOT NULL,
    "Customer_Fname" character varying(20) NOT NULL,
    "Customer_Lname" character varying(20) NOT NULL,
    "Customer_Id" character(8)[] NOT NULL,
    "Order_DTL" character varying(30) NOT NULL,
    "Total_Amount" character varying(10) NOT NULL
);
    DROP TABLE public."Bill";
       public         heap    postgres    false            �            1259    41327 	   Bill_Info    TABLE        CREATE TABLE public."Bill_Info" (
    "Bill_No" character varying(8) NOT NULL,
    "Price" character varying(15)[] NOT NULL
);
    DROP TABLE public."Bill_Info";
       public         heap    postgres    false            �            1259    41284    Cook    TABLE     �   CREATE TABLE public."Cook" (
    "Cook_Id" character varying(8)[] NOT NULL,
    "Cook_Name" character varying(20)[] NOT NULL,
    "Order_Id" character varying(8) NOT NULL
);
    DROP TABLE public."Cook";
       public         heap    postgres    false            �            1259    41260 	   Cook_Info    TABLE     �  CREATE TABLE public."Cook_Info" (
    "Cook_Id" character varying(8)[] NOT NULL,
    "Fname" character varying(15)[] NOT NULL,
    "Lname" character varying(15)[] NOT NULL,
    "Contact" character varying(20)[] NOT NULL,
    "Addrss" character varying(30)[],
    "Salary" character varying(30)[],
    "Sex" character(1),
    "Birth_date" date,
    "Join_date" date NOT NULL,
    "Specialization" character varying(50)[]
);
    DROP TABLE public."Cook_Info";
       public         heap    postgres    false            �            1259    32778 	   Customers    TABLE     2  CREATE TABLE public."Customers" (
    "Customer_Id" character(8)[] NOT NULL,
    "Restaurant_Id" character(8)[] NOT NULL,
    "Customer_Fname" character(20)[] NOT NULL,
    "Customer_Lname" character(20)[] NOT NULL,
    "Customer_Phone" character(20)[] NOT NULL,
    "Email_Id" character(30)[] NOT NULL
);
    DROP TABLE public."Customers";
       public         heap    postgres    false            �            1259    41248    Food    TABLE     �   CREATE TABLE public."Food" (
    "Food_Id" character varying(8)[] NOT NULL,
    "Order_Id" character varying(8) NOT NULL,
    "Quantity" integer NOT NULL,
    "Descriptions" character varying(100)[] NOT NULL,
    "Price" integer NOT NULL
);
    DROP TABLE public."Food";
       public         heap    postgres    false            �            1259    41312 	   Food_Info    TABLE     �   CREATE TABLE public."Food_Info" (
    "Food_Id" character varying(8)[] NOT NULL,
    "Quantity" integer NOT NULL,
    "Price" character varying(8)[] NOT NULL
);
    DROP TABLE public."Food_Info";
       public         heap    postgres    false            �            1259    41234    Ingredients    TABLE     K  CREATE TABLE public."Ingredients" (
    "Ingredient_Id" character varying(8)[] NOT NULL,
    "IngName" character varying(30)[] NOT NULL,
    "Quantity" character varying(15)[] NOT NULL,
    "Descp" character varying(100)[] NOT NULL,
    "Supp_Id" character varying(8)[] NOT NULL,
    "Supp_Name" character varying(8)[] NOT NULL
);
 !   DROP TABLE public."Ingredients";
       public         heap    postgres    false            �            1259    40965    Manager    TABLE     �  CREATE TABLE public."Manager" (
    "Manager_Id" character varying(6) NOT NULL,
    fname character varying(15) NOT NULL,
    lname character varying(15) NOT NULL,
    "Contact" character varying(20) NOT NULL,
    "TheAddress" character varying(30) NOT NULL,
    "Salary" character varying(30) NOT NULL,
    "Sex" "char" NOT NULL,
    "Birth_Date" date NOT NULL,
    "Join_Date" date NOT NULL
);
    DROP TABLE public."Manager";
       public         heap    postgres    false            �            1259    41267    Manager_info    TABLE     �  CREATE TABLE public."Manager_info" (
    "Manager_Id" character varying(6)[] NOT NULL,
    fname character varying(15)[] NOT NULL,
    lname character varying(15)[] NOT NULL,
    "Contact" character varying(20)[] NOT NULL,
    "Addres" character varying(30)[] NOT NULL,
    "Salary" character varying(30)[] NOT NULL,
    "Sex" character(1) NOT NULL,
    "Birth_date" date NOT NULL,
    "Join_date" date NOT NULL
);
 "   DROP TABLE public."Manager_info";
       public         heap    postgres    false            �            1259    41085    Orders    TABLE     c  CREATE TABLE public."Orders" (
    "Order_Id" character varying(8) NOT NULL,
    "Customer_Id" character(8)[] NOT NULL,
    "Customer_Fname" character(20)[] NOT NULL,
    "Order_Status" character varying(7) NOT NULL,
    "Created_At" time without time zone NOT NULL,
    "No_of_Items" integer NOT NULL,
    descriptions character varying(100) NOT NULL
);
    DROP TABLE public."Orders";
       public         heap    postgres    false            �            1259    41210    Payment    TABLE     t  CREATE TABLE public."Payment" (
    "Pay_id " character varying(6)[] NOT NULL,
    "Pay_code" character varying(20)[] NOT NULL,
    "Order_code" character varying(20)[] NOT NULL,
    "Order_Id" character varying(8) NOT NULL,
    "Customer_Id" character(8)[] NOT NULL,
    "Pay_amount" character varying(20)[] NOT NULL,
    "Pay_method" character varying(30)[] NOT NULL
);
    DROP TABLE public."Payment";
       public         heap    postgres    false            �            1259    41097    Products    TABLE     F  CREATE TABLE public."Products" (
    "Product_Id" character varying(6) NOT NULL,
    "Product_code" character varying(20) NOT NULL,
    "Product_name" character varying(20) NOT NULL,
    "Product_image" character varying(20) NOT NULL,
    "Product_desc" character varying(100) NOT NULL,
    "Product_price" bigint NOT NULL
);
    DROP TABLE public."Products";
       public         heap    postgres    false            �            1259    32771    Restaurants_Info    TABLE       CREATE TABLE public."Restaurants_Info" (
    "Restaurant_Id" character(8)[] NOT NULL,
    "Restaurant_Name" character(20)[] NOT NULL,
    "Restaurant_Phone" character(20)[] NOT NULL,
    "TheLocation" character(30)[] NOT NULL,
    "Opening_Closing_Time" character(30)[] NOT NULL
);
 &   DROP TABLE public."Restaurants_Info";
       public         heap    postgres    false            �            1259    41102    Staff    TABLE       CREATE TABLE public."Staff" (
    "Staff_Id" character varying(6) NOT NULL,
    "Staff_name" character varying(20) NOT NULL,
    "Staff_number" character varying(20) NOT NULL,
    "Staff_email" character varying(20) NOT NULL,
    "Staff_password" character varying(20) NOT NULL
);
    DROP TABLE public."Staff";
       public         heap    postgres    false            �            1259    41227    Supplier    TABLE       CREATE TABLE public."Supplier" (
    "Supp_Id" character varying(8)[] NOT NULL,
    "Supp_Name" character varying(8)[] NOT NULL,
    "Addrss" character varying(30)[] NOT NULL,
    "Contact" character varying(20)[] NOT NULL,
    "Details" character varying(200)[] NOT NULL
);
    DROP TABLE public."Supplier";
       public         heap    postgres    false            �            1259    41164    Waiter    TABLE     �   CREATE TABLE public."Waiter" (
    "Waiter_Id" character varying(6) NOT NULL,
    "Fname" character varying(20) NOT NULL,
    "Customer_Id" character(8)[] NOT NULL,
    "Order_Id" character varying(8) NOT NULL
);
    DROP TABLE public."Waiter";
       public         heap    postgres    false            �            1259    41112    admin    TABLE     �   CREATE TABLE public.admin (
    "Username" character varying(20) NOT NULL,
    pass character varying(20) NOT NULL,
    "Restaurant_Id" character(8)[] NOT NULL
);
    DROP TABLE public.admin;
       public         heap    postgres    false            �            1259    41304 
   order_Info    TABLE     �   CREATE TABLE public."order_Info" (
    "Order_Id" character varying(8) NOT NULL,
    "No_of_items" integer NOT NULL,
    "Order_Time" time with time zone NOT NULL
);
     DROP TABLE public."order_Info";
       public         heap    postgres    false            `          0    41151     Waiter_Info 
   TABLE DATA           �   COPY public." Waiter_Info" ("Waiter_Id", "Fname", "Lname", "Contact", "Addrss", "Salary", "Sex", "Birth_date", "Join_Date") FROM stdin;
    public          postgres    false    223   Me       _          0    41134    Bill 
   TABLE DATA           �   COPY public."Bill" ("Bill_No", "Order_Id", "Customer_Fname", "Customer_Lname", "Customer_Id", "Order_DTL", "Total_Amount") FROM stdin;
    public          postgres    false    222   je       k          0    41327 	   Bill_Info 
   TABLE DATA           9   COPY public."Bill_Info" ("Bill_No", "Price") FROM stdin;
    public          postgres    false    234   �e       h          0    41284    Cook 
   TABLE DATA           D   COPY public."Cook" ("Cook_Id", "Cook_Name", "Order_Id") FROM stdin;
    public          postgres    false    231   �e       f          0    41260 	   Cook_Info 
   TABLE DATA           �   COPY public."Cook_Info" ("Cook_Id", "Fname", "Lname", "Contact", "Addrss", "Salary", "Sex", "Birth_date", "Join_date", "Specialization") FROM stdin;
    public          postgres    false    229   �e       Y          0    32778 	   Customers 
   TABLE DATA           �   COPY public."Customers" ("Customer_Id", "Restaurant_Id", "Customer_Fname", "Customer_Lname", "Customer_Phone", "Email_Id") FROM stdin;
    public          postgres    false    216   �e       e          0    41248    Food 
   TABLE DATA           \   COPY public."Food" ("Food_Id", "Order_Id", "Quantity", "Descriptions", "Price") FROM stdin;
    public          postgres    false    228   �e       j          0    41312 	   Food_Info 
   TABLE DATA           E   COPY public."Food_Info" ("Food_Id", "Quantity", "Price") FROM stdin;
    public          postgres    false    233   f       d          0    41234    Ingredients 
   TABLE DATA           p   COPY public."Ingredients" ("Ingredient_Id", "IngName", "Quantity", "Descp", "Supp_Id", "Supp_Name") FROM stdin;
    public          postgres    false    227   5f       Z          0    40965    Manager 
   TABLE DATA           �   COPY public."Manager" ("Manager_Id", fname, lname, "Contact", "TheAddress", "Salary", "Sex", "Birth_Date", "Join_Date") FROM stdin;
    public          postgres    false    217   Rf       g          0    41267    Manager_info 
   TABLE DATA           �   COPY public."Manager_info" ("Manager_Id", fname, lname, "Contact", "Addres", "Salary", "Sex", "Birth_date", "Join_date") FROM stdin;
    public          postgres    false    230   of       [          0    41085    Orders 
   TABLE DATA           �   COPY public."Orders" ("Order_Id", "Customer_Id", "Customer_Fname", "Order_Status", "Created_At", "No_of_Items", descriptions) FROM stdin;
    public          postgres    false    218   �f       b          0    41210    Payment 
   TABLE DATA              COPY public."Payment" ("Pay_id ", "Pay_code", "Order_code", "Order_Id", "Customer_Id", "Pay_amount", "Pay_method") FROM stdin;
    public          postgres    false    225   �f       \          0    41097    Products 
   TABLE DATA           �   COPY public."Products" ("Product_Id", "Product_code", "Product_name", "Product_image", "Product_desc", "Product_price") FROM stdin;
    public          postgres    false    219   �f       X          0    32771    Restaurants_Info 
   TABLE DATA           �   COPY public."Restaurants_Info" ("Restaurant_Id", "Restaurant_Name", "Restaurant_Phone", "TheLocation", "Opening_Closing_Time") FROM stdin;
    public          postgres    false    215   �f       ]          0    41102    Staff 
   TABLE DATA           l   COPY public."Staff" ("Staff_Id", "Staff_name", "Staff_number", "Staff_email", "Staff_password") FROM stdin;
    public          postgres    false    220    g       c          0    41227    Supplier 
   TABLE DATA           \   COPY public."Supplier" ("Supp_Id", "Supp_Name", "Addrss", "Contact", "Details") FROM stdin;
    public          postgres    false    226   g       a          0    41164    Waiter 
   TABLE DATA           S   COPY public."Waiter" ("Waiter_Id", "Fname", "Customer_Id", "Order_Id") FROM stdin;
    public          postgres    false    224   :g       ^          0    41112    admin 
   TABLE DATA           B   COPY public.admin ("Username", pass, "Restaurant_Id") FROM stdin;
    public          postgres    false    221   Wg       i          0    41304 
   order_Info 
   TABLE DATA           O   COPY public."order_Info" ("Order_Id", "No_of_items", "Order_Time") FROM stdin;
    public          postgres    false    232   tg       �           2606    41155     Waiter_Info  Waiter_Info_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY public." Waiter_Info"
    ADD CONSTRAINT " Waiter_Info_pkey" PRIMARY KEY ("Waiter_Id");
 L   ALTER TABLE ONLY public." Waiter_Info" DROP CONSTRAINT " Waiter_Info_pkey";
       public            postgres    false    223            �           2606    41140    Bill Bill_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public."Bill"
    ADD CONSTRAINT "Bill_pkey" PRIMARY KEY ("Bill_No");
 <   ALTER TABLE ONLY public."Bill" DROP CONSTRAINT "Bill_pkey";
       public            postgres    false    222            �           2606    41266    Cook_Info Cook_Info_pkey 
   CONSTRAINT     a   ALTER TABLE ONLY public."Cook_Info"
    ADD CONSTRAINT "Cook_Info_pkey" PRIMARY KEY ("Cook_Id");
 F   ALTER TABLE ONLY public."Cook_Info" DROP CONSTRAINT "Cook_Info_pkey";
       public            postgres    false    229            �           2606    32784    Customers Customers_pkey 
   CONSTRAINT     e   ALTER TABLE ONLY public."Customers"
    ADD CONSTRAINT "Customers_pkey" PRIMARY KEY ("Customer_Id");
 F   ALTER TABLE ONLY public."Customers" DROP CONSTRAINT "Customers_pkey";
       public            postgres    false    216            �           2606    41254    Food Food_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public."Food"
    ADD CONSTRAINT "Food_pkey" PRIMARY KEY ("Food_Id");
 <   ALTER TABLE ONLY public."Food" DROP CONSTRAINT "Food_pkey";
       public            postgres    false    228            �           2606    41240    Ingredients Ingredients_pkey 
   CONSTRAINT     k   ALTER TABLE ONLY public."Ingredients"
    ADD CONSTRAINT "Ingredients_pkey" PRIMARY KEY ("Ingredient_Id");
 J   ALTER TABLE ONLY public."Ingredients" DROP CONSTRAINT "Ingredients_pkey";
       public            postgres    false    227            �           2606    41273    Manager_info Manager_info_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public."Manager_info"
    ADD CONSTRAINT "Manager_info_pkey" PRIMARY KEY ("Manager_Id");
 L   ALTER TABLE ONLY public."Manager_info" DROP CONSTRAINT "Manager_info_pkey";
       public            postgres    false    230            �           2606    40969    Manager Manager_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public."Manager"
    ADD CONSTRAINT "Manager_pkey" PRIMARY KEY ("Manager_Id");
 B   ALTER TABLE ONLY public."Manager" DROP CONSTRAINT "Manager_pkey";
       public            postgres    false    217            �           2606    41091    Orders Orders_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public."Orders"
    ADD CONSTRAINT "Orders_pkey" PRIMARY KEY ("Order_Id");
 @   ALTER TABLE ONLY public."Orders" DROP CONSTRAINT "Orders_pkey";
       public            postgres    false    218            �           2606    41216    Payment Payment_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public."Payment"
    ADD CONSTRAINT "Payment_pkey" PRIMARY KEY ("Pay_code");
 B   ALTER TABLE ONLY public."Payment" DROP CONSTRAINT "Payment_pkey";
       public            postgres    false    225            �           2606    41101    Products Products_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public."Products"
    ADD CONSTRAINT "Products_pkey" PRIMARY KEY ("Product_code");
 D   ALTER TABLE ONLY public."Products" DROP CONSTRAINT "Products_pkey";
       public            postgres    false    219            �           2606    32777 !   Restaurants_Info Restaurants_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public."Restaurants_Info"
    ADD CONSTRAINT "Restaurants_pkey" PRIMARY KEY ("Restaurant_Id");
 O   ALTER TABLE ONLY public."Restaurants_Info" DROP CONSTRAINT "Restaurants_pkey";
       public            postgres    false    215            �           2606    41106    Staff Staff_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public."Staff"
    ADD CONSTRAINT "Staff_pkey" PRIMARY KEY ("Staff_Id");
 >   ALTER TABLE ONLY public."Staff" DROP CONSTRAINT "Staff_pkey";
       public            postgres    false    220            �           2606    41233    Supplier Supplier_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public."Supplier"
    ADD CONSTRAINT "Supplier_pkey" PRIMARY KEY ("Supp_Id");
 D   ALTER TABLE ONLY public."Supplier" DROP CONSTRAINT "Supplier_pkey";
       public            postgres    false    226            �           2606    41118    admin admin_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.admin
    ADD CONSTRAINT admin_pkey PRIMARY KEY ("Username");
 :   ALTER TABLE ONLY public.admin DROP CONSTRAINT admin_pkey;
       public            postgres    false    221            �           2606    41332    Bill_Info BillNo_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Bill_Info"
    ADD CONSTRAINT "BillNo_fkey" FOREIGN KEY ("Bill_No") REFERENCES public."Bill"("Bill_No");
 C   ALTER TABLE ONLY public."Bill_Info" DROP CONSTRAINT "BillNo_fkey";
       public          postgres    false    222    234    4778            �           2606    41289    Cook Cook_Id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Cook"
    ADD CONSTRAINT "Cook_Id_fkey" FOREIGN KEY ("Cook_Id") REFERENCES public."Cook_Info"("Cook_Id");
 ?   ALTER TABLE ONLY public."Cook" DROP CONSTRAINT "Cook_Id_fkey";
       public          postgres    false    229    4790    231            �           2606    41146    Bill CustomerId-fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Bill"
    ADD CONSTRAINT "CustomerId-fkey" FOREIGN KEY ("Customer_Id") REFERENCES public."Customers"("Customer_Id");
 B   ALTER TABLE ONLY public."Bill" DROP CONSTRAINT "CustomerId-fkey";
       public          postgres    false    222    216    4766            �           2606    41092     Orders Customer_Customer_Id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Orders"
    ADD CONSTRAINT "Customer_Customer_Id_fkey" FOREIGN KEY ("Customer_Id") REFERENCES public."Customers"("Customer_Id");
 N   ALTER TABLE ONLY public."Orders" DROP CONSTRAINT "Customer_Customer_Id_fkey";
       public          postgres    false    218    4766    216            �           2606    41174    Waiter Customer_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Waiter"
    ADD CONSTRAINT "Customer_id_fkey" FOREIGN KEY ("Customer_Id") REFERENCES public."Customers"("Customer_Id");
 E   ALTER TABLE ONLY public."Waiter" DROP CONSTRAINT "Customer_id_fkey";
       public          postgres    false    216    4766    224            �           2606    41217    Payment Customer_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Payment"
    ADD CONSTRAINT "Customer_id_fkey" FOREIGN KEY ("Customer_Id") REFERENCES public."Customers"("Customer_Id");
 F   ALTER TABLE ONLY public."Payment" DROP CONSTRAINT "Customer_id_fkey";
       public          postgres    false    4766    225    216            �           2606    40960 &   Customers Customers_Restaurant_Id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Customers"
    ADD CONSTRAINT "Customers_Restaurant_Id_fkey" FOREIGN KEY ("Restaurant_Id") REFERENCES public."Restaurants_Info"("Restaurant_Id") NOT VALID;
 T   ALTER TABLE ONLY public."Customers" DROP CONSTRAINT "Customers_Restaurant_Id_fkey";
       public          postgres    false    4764    216    215            �           2606    41317    Food_Info Food_Id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Food_Info"
    ADD CONSTRAINT "Food_Id_fkey" FOREIGN KEY ("Food_Id") REFERENCES public."Food"("Food_Id");
 D   ALTER TABLE ONLY public."Food_Info" DROP CONSTRAINT "Food_Id_fkey";
       public          postgres    false    233    228    4788            �           2606    41141    Bill OrderId-fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Bill"
    ADD CONSTRAINT "OrderId-fkey" FOREIGN KEY ("Order_Id") REFERENCES public."Orders"("Order_Id");
 ?   ALTER TABLE ONLY public."Bill" DROP CONSTRAINT "OrderId-fkey";
       public          postgres    false    222    218    4770            �           2606    41294    Cook OrderId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Cook"
    ADD CONSTRAINT "OrderId_fkey" FOREIGN KEY ("Order_Id") REFERENCES public."Orders"("Order_Id");
 ?   ALTER TABLE ONLY public."Cook" DROP CONSTRAINT "OrderId_fkey";
       public          postgres    false    231    4770    218            �           2606    41179    Waiter Order_Id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Waiter"
    ADD CONSTRAINT "Order_Id_fkey" FOREIGN KEY ("Order_Id") REFERENCES public."Orders"("Order_Id");
 B   ALTER TABLE ONLY public."Waiter" DROP CONSTRAINT "Order_Id_fkey";
       public          postgres    false    4770    224    218            �           2606    41222    Payment Order_Id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Payment"
    ADD CONSTRAINT "Order_Id_fkey" FOREIGN KEY ("Order_Id") REFERENCES public."Orders"("Order_Id");
 C   ALTER TABLE ONLY public."Payment" DROP CONSTRAINT "Order_Id_fkey";
       public          postgres    false    225    4770    218            �           2606    41255    Food Order_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Food"
    ADD CONSTRAINT "Order_fkey" FOREIGN KEY ("Order_Id") REFERENCES public."Orders"("Order_Id");
 =   ALTER TABLE ONLY public."Food" DROP CONSTRAINT "Order_fkey";
       public          postgres    false    228    4770    218            �           2606    41169    Waiter WaiterId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Waiter"
    ADD CONSTRAINT "WaiterId_fkey" FOREIGN KEY ("Waiter_Id") REFERENCES public." Waiter_Info"("Waiter_Id");
 B   ALTER TABLE ONLY public."Waiter" DROP CONSTRAINT "WaiterId_fkey";
       public          postgres    false    223    224    4780            �           2606    41119 
   admin fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.admin
    ADD CONSTRAINT fkey FOREIGN KEY ("Restaurant_Id") REFERENCES public."Restaurants_Info"("Restaurant_Id");
 4   ALTER TABLE ONLY public.admin DROP CONSTRAINT fkey;
       public          postgres    false    215    221    4764            �           2606    41307 #   order_Info order_Info_Order_Id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."order_Info"
    ADD CONSTRAINT "order_Info_Order_Id_fkey" FOREIGN KEY ("Order_Id") REFERENCES public."Orders"("Order_Id");
 Q   ALTER TABLE ONLY public."order_Info" DROP CONSTRAINT "order_Info_Order_Id_fkey";
       public          postgres    false    218    4770    232            `      x������ � �      _      x������ � �      k      x������ � �      h      x������ � �      f      x������ � �      Y      x������ � �      e      x������ � �      j      x������ � �      d      x������ � �      Z      x������ � �      g      x������ � �      [      x������ � �      b      x������ � �      \      x������ � �      X      x������ � �      ]      x������ � �      c      x������ � �      a      x������ � �      ^      x������ � �      i      x������ � �     