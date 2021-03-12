PGDMP                         y            infinity-database    13.2    13.2     �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    16394    infinity-database    DATABASE     w   CREATE DATABASE "infinity-database" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'English_United States.1252';
 #   DROP DATABASE "infinity-database";
                postgres    false                        3079    16447 	   uuid-ossp 	   EXTENSION     ?   CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA public;
    DROP EXTENSION "uuid-ossp";
                   false            �           0    0    EXTENSION "uuid-ossp"    COMMENT     W   COMMENT ON EXTENSION "uuid-ossp" IS 'generate universally unique identifiers (UUIDs)';
                        false    2            �            1259    16458    groups    TABLE        CREATE TABLE public.groups (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    name character varying(50) NOT NULL,
    display character varying(50) NOT NULL,
    code character(10) NOT NULL,
    created timestamp without time zone,
    modified timestamp without time zone
);
    DROP TABLE public.groups;
       public         heap    postgres    false    2            �            1259    16503    methods    TABLE     �  CREATE TABLE public.methods (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    module_id uuid NOT NULL,
    name character(50) NOT NULL,
    display character(50) NOT NULL,
    symbol character(180) NOT NULL,
    sort integer NOT NULL,
    is_menu boolean NOT NULL,
    controller_name character(180) NOT NULL,
    created timestamp without time zone,
    modified timestamp without time zone
);
    DROP TABLE public.methods;
       public         heap    postgres    false    2            �            1259    16494    modules    TABLE     L  CREATE TABLE public.modules (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    parent_id uuid NOT NULL,
    name character(50) NOT NULL,
    display character(50) NOT NULL,
    symbol character(180) NOT NULL,
    sort integer NOT NULL,
    created timestamp without time zone,
    modified timestamp without time zone
);
    DROP TABLE public.modules;
       public         heap    postgres    false    2            �            1259    16488    roles    TABLE     
  CREATE TABLE public.roles (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    group_id uuid NOT NULL,
    name character(50) NOT NULL,
    display character(50) NOT NULL,
    created timestamp without time zone,
    modified timestamp without time zone
);
    DROP TABLE public.roles;
       public         heap    postgres    false    2            �            1259    16482    tokens    TABLE     �   CREATE TABLE public.tokens (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    user_id uuid NOT NULL,
    token character varying(255) NOT NULL,
    created timestamp without time zone,
    modified timestamp without time zone
);
    DROP TABLE public.tokens;
       public         heap    postgres    false    2            �            1259    16473    users    TABLE     T  CREATE TABLE public.users (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    group_id uuid NOT NULL,
    name character(50) NOT NULL,
    email character(180) NOT NULL,
    password character varying(255) NOT NULL,
    active boolean NOT NULL,
    created timestamp without time zone,
    modified timestamp without time zone
);
    DROP TABLE public.users;
       public         heap    postgres    false    2            �          0    16458    groups 
   TABLE DATA           L   COPY public.groups (id, name, display, code, created, modified) FROM stdin;
    public          postgres    false    201   c       �          0    16503    methods 
   TABLE DATA           z   COPY public.methods (id, module_id, name, display, symbol, sort, is_menu, controller_name, created, modified) FROM stdin;
    public          postgres    false    206   �       �          0    16494    modules 
   TABLE DATA           `   COPY public.modules (id, parent_id, name, display, symbol, sort, created, modified) FROM stdin;
    public          postgres    false    205          �          0    16488    roles 
   TABLE DATA           O   COPY public.roles (id, group_id, name, display, created, modified) FROM stdin;
    public          postgres    false    204   3       �          0    16482    tokens 
   TABLE DATA           G   COPY public.tokens (id, user_id, token, created, modified) FROM stdin;
    public          postgres    false    203   P       �          0    16473    users 
   TABLE DATA           _   COPY public.users (id, group_id, name, email, password, active, created, modified) FROM stdin;
    public          postgres    false    202   Z       F           2606    16463    groups groups_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.groups
    ADD CONSTRAINT groups_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.groups DROP CONSTRAINT groups_pkey;
       public            postgres    false    201            P           2606    16511    methods methods_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.methods
    ADD CONSTRAINT methods_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.methods DROP CONSTRAINT methods_pkey;
       public            postgres    false    206            N           2606    16502    modules modules_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.modules
    ADD CONSTRAINT modules_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.modules DROP CONSTRAINT modules_pkey;
       public            postgres    false    205            L           2606    16493    roles roles_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.roles DROP CONSTRAINT roles_pkey;
       public            postgres    false    204            J           2606    16487    tokens tokens_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.tokens
    ADD CONSTRAINT tokens_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.tokens DROP CONSTRAINT tokens_pkey;
       public            postgres    false    203            H           2606    16481    users users_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            postgres    false    202            �   �   x����1 ��+���v��sU8��#9MJ�?
��3�H�S`��w�PkFGb�Ӵk�p�F�.��@z��/�nb6�����rf����P�cL�lD�Z&�Z ���8�s������������zN�/�      �      x������ � �      �      x������ � �      �      x������ � �      �   �   x�m��n�0 D��+�F��8�"0a)$%�T�6V�"�����p�q�f�0 �3�bPF�:$�P��
I�6�$�H9T�D�P�a8��jF"��9�w����[���L՚E��l�����I,p�p�(n���L&X�O��ݵNW��^&�K�v�(W��zx�E0�q�v˾qe�f��ȴ[E�č5����*^�'}��<�#O������}���\��ǛP�C� $ �ȷ(���^|��� ��V�      �   �   x���ϊ�0��s�z�:��4�'A.,�+xi�T�]��o�x�����g��&��H�	\��u�FZ�.*�N$%�g�O)�%�;�PP-����D]s���j^��E�t/5��Oo�b�w>L��n/���/�x˝������}����6��V��P;@��gbf잵b_E� ��P     