PGDMP             	            y            infinity-database-new    12.3    12.3     J           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            K           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            L           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            M           1262    33254    infinity-database-new    DATABASE     ?   CREATE DATABASE "infinity-database-new" WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'English_United States.1252' LC_CTYPE = 'English_United States.1252';
 '   DROP DATABASE "infinity-database-new";
                postgres    false            ?            1259    41459    pclouds    TABLE     '  CREATE TABLE public.pclouds (
    id integer NOT NULL,
    website_id integer NOT NULL,
    email character varying(255) NOT NULL,
    password character varying(255) NOT NULL,
    active boolean DEFAULT true,
    created timestamp without time zone,
    modified timestamp without time zone
);
    DROP TABLE public.pclouds;
       public         heap    postgres    false            ?            1259    41455    pclouds_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.pclouds_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.pclouds_id_seq;
       public          postgres    false    227            N           0    0    pclouds_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.pclouds_id_seq OWNED BY public.pclouds.id;
          public          postgres    false    225            ?            1259    41457    pclouds_website_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.pclouds_website_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.pclouds_website_id_seq;
       public          postgres    false    227            O           0    0    pclouds_website_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.pclouds_website_id_seq OWNED BY public.pclouds.website_id;
          public          postgres    false    226            ?
           2604    41462 
   pclouds id    DEFAULT     h   ALTER TABLE ONLY public.pclouds ALTER COLUMN id SET DEFAULT nextval('public.pclouds_id_seq'::regclass);
 9   ALTER TABLE public.pclouds ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    227    225    227            ?
           2604    41463    pclouds website_id    DEFAULT     x   ALTER TABLE ONLY public.pclouds ALTER COLUMN website_id SET DEFAULT nextval('public.pclouds_website_id_seq'::regclass);
 A   ALTER TABLE public.pclouds ALTER COLUMN website_id DROP DEFAULT;
       public          postgres    false    227    226    227            G          0    41459    pclouds 
   TABLE DATA           ]   COPY public.pclouds (id, website_id, email, password, active, created, modified) FROM stdin;
    public          postgres    false    227          P           0    0    pclouds_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.pclouds_id_seq', 2, true);
          public          postgres    false    225            Q           0    0    pclouds_website_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.pclouds_website_id_seq', 1, false);
          public          postgres    false    226            ?
           2606    41469    pclouds pclouds_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.pclouds
    ADD CONSTRAINT pclouds_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.pclouds DROP CONSTRAINT pclouds_pkey;
       public            postgres    false    227            G   R   x?3?4?,?/???K,J,?/M?pH?M???K??????+?L7????,?4202?50?54S04?24?20C36?22?????? p?      