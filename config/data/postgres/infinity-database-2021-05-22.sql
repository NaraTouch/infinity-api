PGDMP         *                y            infinity-database-new    13.2    13.2 ?    ?           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            ?           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            ?           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            ?           1262    24887    infinity-database-new    DATABASE     {   CREATE DATABASE "infinity-database-new" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'English_United States.1252';
 '   DROP DATABASE "infinity-database-new";
                postgres    false                        3079    24888 	   uuid-ossp 	   EXTENSION     ?   CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA public;
    DROP EXTENSION "uuid-ossp";
                   false            ?           0    0    EXTENSION "uuid-ossp"    COMMENT     W   COMMENT ON EXTENSION "uuid-ossp" IS 'generate universally unique identifiers (UUIDs)';
                        false    2            ?            1259    25210    applications    TABLE     [  CREATE TABLE public.applications (
    id integer NOT NULL,
    template_id integer NOT NULL,
    name character varying(50) NOT NULL,
    display character varying(180) NOT NULL,
    script text,
    active boolean DEFAULT true,
    created timestamp without time zone,
    modified timestamp without time zone,
    layout text,
    menu text
);
     DROP TABLE public.applications;
       public         heap    postgres    false            ?            1259    25206    applications_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.applications_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.applications_id_seq;
       public          postgres    false    243            ?           0    0    applications_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.applications_id_seq OWNED BY public.applications.id;
          public          postgres    false    241            ?            1259    25208    applications_template_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.applications_template_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.applications_template_id_seq;
       public          postgres    false    243            ?           0    0    applications_template_id_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public.applications_template_id_seq OWNED BY public.applications.template_id;
          public          postgres    false    242            ?            1259    25096 
   components    TABLE     n  CREATE TABLE public.components (
    id integer NOT NULL,
    template_id integer NOT NULL,
    name character varying(50) NOT NULL,
    table_name character varying(180) NOT NULL,
    description text,
    sort integer NOT NULL,
    active boolean DEFAULT false,
    created timestamp without time zone,
    modified timestamp without time zone,
    script text
);
    DROP TABLE public.components;
       public         heap    postgres    false            ?            1259    25274    gg_main_sliders    TABLE     P  CREATE TABLE public.gg_main_sliders (
    id integer NOT NULL,
    website_id integer NOT NULL,
    image text,
    display character varying(255),
    descriptions text,
    tag_links text,
    sort integer NOT NULL,
    active boolean DEFAULT true,
    created timestamp without time zone,
    modified timestamp without time zone
);
 #   DROP TABLE public.gg_main_sliders;
       public         heap    postgres    false            ?            1259    25270    gg_main_sliders_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.gg_main_sliders_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.gg_main_sliders_id_seq;
       public          postgres    false    247            ?           0    0    gg_main_sliders_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.gg_main_sliders_id_seq OWNED BY public.gg_main_sliders.id;
          public          postgres    false    245            ?            1259    25272    gg_main_sliders_website_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.gg_main_sliders_website_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE public.gg_main_sliders_website_id_seq;
       public          postgres    false    247            ?           0    0    gg_main_sliders_website_id_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE public.gg_main_sliders_website_id_seq OWNED BY public.gg_main_sliders.website_id;
          public          postgres    false    246            ?            1259    24899    groups    TABLE     `  CREATE TABLE public.groups (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    display character varying(180) NOT NULL,
    code character varying(10),
    active boolean DEFAULT true,
    created timestamp without time zone,
    modified timestamp without time zone,
    website_id integer,
    super_user boolean DEFAULT false
);
    DROP TABLE public.groups;
       public         heap    postgres    false            ?            1259    24904    groups_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.groups_id_seq;
       public          postgres    false    201            ?           0    0    groups_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.groups_id_seq OWNED BY public.groups.id;
          public          postgres    false    202            ?            1259    25190    layouts    TABLE       CREATE TABLE public.layouts (
    id integer NOT NULL,
    subpage_id integer NOT NULL,
    component_id integer NOT NULL,
    sort integer NOT NULL,
    active boolean DEFAULT false,
    created timestamp without time zone,
    modified timestamp without time zone
);
    DROP TABLE public.layouts;
       public         heap    postgres    false            ?            1259    25188    layouts_component_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.layouts_component_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.layouts_component_id_seq;
       public          postgres    false    240            ?           0    0    layouts_component_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.layouts_component_id_seq OWNED BY public.layouts.component_id;
          public          postgres    false    239            ?            1259    25184    layouts_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.layouts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.layouts_id_seq;
       public          postgres    false    240            ?           0    0    layouts_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.layouts_id_seq OWNED BY public.layouts.id;
          public          postgres    false    237            ?            1259    25186    layouts_subpage_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.layouts_subpage_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.layouts_subpage_id_seq;
       public          postgres    false    240            ?           0    0    layouts_subpage_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.layouts_subpage_id_seq OWNED BY public.layouts.subpage_id;
          public          postgres    false    238            ?            1259    24906    methods    TABLE     ?  CREATE TABLE public.methods (
    id integer NOT NULL,
    module_id integer NOT NULL,
    name character varying(50) NOT NULL,
    display character varying(180) NOT NULL,
    symbol character varying(180) NOT NULL,
    sort integer NOT NULL,
    is_menu boolean DEFAULT false,
    active boolean DEFAULT true,
    created timestamp without time zone,
    modified timestamp without time zone
);
    DROP TABLE public.methods;
       public         heap    postgres    false            ?            1259    24911    methods_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.methods_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.methods_id_seq;
       public          postgres    false    203            ?           0    0    methods_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.methods_id_seq OWNED BY public.methods.id;
          public          postgres    false    204            ?            1259    24913    methods_module_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.methods_module_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.methods_module_id_seq;
       public          postgres    false    203            ?           0    0    methods_module_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.methods_module_id_seq OWNED BY public.methods.module_id;
          public          postgres    false    205            ?            1259    24915    modules    TABLE     J  CREATE TABLE public.modules (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    display character varying(180) NOT NULL,
    symbol character varying(180) NOT NULL,
    sort integer NOT NULL,
    active boolean DEFAULT true,
    created timestamp without time zone,
    modified timestamp without time zone
);
    DROP TABLE public.modules;
       public         heap    postgres    false            ?            1259    24919    modules_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.modules_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.modules_id_seq;
       public          postgres    false    206            ?           0    0    modules_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.modules_id_seq OWNED BY public.modules.id;
          public          postgres    false    207            ?            1259    25122    pages    TABLE     ?  CREATE TABLE public.pages (
    id integer NOT NULL,
    website_id integer NOT NULL,
    name character varying(50) NOT NULL,
    display character varying(180) NOT NULL,
    tag_links character varying(250) NOT NULL,
    icon character varying(250),
    code character varying(50) NOT NULL,
    active boolean DEFAULT false,
    created timestamp without time zone,
    modified timestamp without time zone,
    sort integer NOT NULL
);
    DROP TABLE public.pages;
       public         heap    postgres    false            ?            1259    25118    pages_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.pages_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.pages_id_seq;
       public          postgres    false    233            ?           0    0    pages_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.pages_id_seq OWNED BY public.pages.id;
          public          postgres    false    231            ?            1259    25120    pages_website_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.pages_website_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.pages_website_id_seq;
       public          postgres    false    233            ?           0    0    pages_website_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.pages_website_id_seq OWNED BY public.pages.website_id;
          public          postgres    false    232            ?            1259    24921    pclouds    TABLE     '  CREATE TABLE public.pclouds (
    id integer NOT NULL,
    website_id integer NOT NULL,
    email character varying(255) NOT NULL,
    password character varying(255) NOT NULL,
    active boolean DEFAULT true,
    created timestamp without time zone,
    modified timestamp without time zone
);
    DROP TABLE public.pclouds;
       public         heap    postgres    false            ?            1259    24928    pclouds_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.pclouds_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.pclouds_id_seq;
       public          postgres    false    208            ?           0    0    pclouds_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.pclouds_id_seq OWNED BY public.pclouds.id;
          public          postgres    false    209            ?            1259    24930    pclouds_website_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.pclouds_website_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.pclouds_website_id_seq;
       public          postgres    false    208            ?           0    0    pclouds_website_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.pclouds_website_id_seq OWNED BY public.pclouds.website_id;
          public          postgres    false    210            ?            1259    24932    permissions    TABLE     ?   CREATE TABLE public.permissions (
    id integer NOT NULL,
    role_id integer NOT NULL,
    method_id integer NOT NULL,
    created timestamp without time zone,
    module_id integer NOT NULL
);
    DROP TABLE public.permissions;
       public         heap    postgres    false            ?            1259    24935    permissions_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.permissions_id_seq;
       public          postgres    false    211            ?           0    0    permissions_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.permissions_id_seq OWNED BY public.permissions.id;
          public          postgres    false    212            ?            1259    24937    permissions_method_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.permissions_method_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.permissions_method_id_seq;
       public          postgres    false    211            ?           0    0    permissions_method_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.permissions_method_id_seq OWNED BY public.permissions.method_id;
          public          postgres    false    213            ?            1259    24939    permissions_role_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.permissions_role_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.permissions_role_id_seq;
       public          postgres    false    211            ?           0    0    permissions_role_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.permissions_role_id_seq OWNED BY public.permissions.role_id;
          public          postgres    false    214            ?            1259    24941    roles    TABLE        CREATE TABLE public.roles (
    id integer NOT NULL,
    group_id integer NOT NULL,
    name character varying(50) NOT NULL,
    display character varying(180) NOT NULL,
    active boolean DEFAULT true,
    created timestamp without time zone,
    modified timestamp without time zone
);
    DROP TABLE public.roles;
       public         heap    postgres    false            ?            1259    24945    roles_group_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.roles_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.roles_group_id_seq;
       public          postgres    false    215            ?           0    0    roles_group_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.roles_group_id_seq OWNED BY public.roles.group_id;
          public          postgres    false    216            ?            1259    24947    roles_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.roles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.roles_id_seq;
       public          postgres    false    215            ?           0    0    roles_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.roles_id_seq OWNED BY public.roles.id;
          public          postgres    false    217            ?            1259    25137    subpages    TABLE     ?  CREATE TABLE public.subpages (
    id integer NOT NULL,
    page_id integer NOT NULL,
    name character varying(50) NOT NULL,
    display character varying(180) NOT NULL,
    tag_links character varying(250) NOT NULL,
    icon character varying(250),
    code character varying(50) NOT NULL,
    active boolean DEFAULT false,
    created timestamp without time zone,
    modified timestamp without time zone,
    sort integer NOT NULL
);
    DROP TABLE public.subpages;
       public         heap    postgres    false            ?            1259    25133    subpages_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.subpages_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.subpages_id_seq;
       public          postgres    false    236            ?           0    0    subpages_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.subpages_id_seq OWNED BY public.subpages.id;
          public          postgres    false    234            ?            1259    25135    subpages_page_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.subpages_page_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.subpages_page_id_seq;
       public          postgres    false    236            ?           0    0    subpages_page_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.subpages_page_id_seq OWNED BY public.subpages.page_id;
          public          postgres    false    235            ?            1259    25092    template_components_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.template_components_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.template_components_id_seq;
       public          postgres    false    230            ?           0    0    template_components_id_seq    SEQUENCE OWNED BY     P   ALTER SEQUENCE public.template_components_id_seq OWNED BY public.components.id;
          public          postgres    false    228            ?            1259    25094 #   template_components_template_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.template_components_template_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 :   DROP SEQUENCE public.template_components_template_id_seq;
       public          postgres    false    230            ?           0    0 #   template_components_template_id_seq    SEQUENCE OWNED BY     b   ALTER SEQUENCE public.template_components_template_id_seq OWNED BY public.components.template_id;
          public          postgres    false    229            ?            1259    25081 	   templates    TABLE       CREATE TABLE public.templates (
    id integer NOT NULL,
    name character varying(180) NOT NULL,
    description text,
    sort integer NOT NULL,
    active boolean DEFAULT false,
    created timestamp without time zone,
    modified timestamp without time zone
);
    DROP TABLE public.templates;
       public         heap    postgres    false            ?            1259    25079    templates_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.templates_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.templates_id_seq;
       public          postgres    false    227            ?           0    0    templates_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.templates_id_seq OWNED BY public.templates.id;
          public          postgres    false    226            ?            1259    24949    tokens    TABLE     ?   CREATE TABLE public.tokens (
    id integer NOT NULL,
    user_id integer NOT NULL,
    token character varying(255) NOT NULL,
    created timestamp without time zone,
    modified timestamp without time zone
);
    DROP TABLE public.tokens;
       public         heap    postgres    false            ?            1259    24952    tokens_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.tokens_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.tokens_id_seq;
       public          postgres    false    218            ?           0    0    tokens_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.tokens_id_seq OWNED BY public.tokens.id;
          public          postgres    false    219            ?            1259    24954    tokens_user_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.tokens_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.tokens_user_id_seq;
       public          postgres    false    218            ?           0    0    tokens_user_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.tokens_user_id_seq OWNED BY public.tokens.user_id;
          public          postgres    false    220            ?            1259    24956    users    TABLE     L  CREATE TABLE public.users (
    id integer NOT NULL,
    group_id integer NOT NULL,
    name character varying(50) NOT NULL,
    email character varying(255) NOT NULL,
    password character varying(255) NOT NULL,
    active boolean DEFAULT true,
    created timestamp without time zone,
    modified timestamp without time zone
);
    DROP TABLE public.users;
       public         heap    postgres    false            ?            1259    24963    users_group_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.users_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.users_group_id_seq;
       public          postgres    false    221            ?           0    0    users_group_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.users_group_id_seq OWNED BY public.users.group_id;
          public          postgres    false    222            ?            1259    24965    users_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.users_id_seq;
       public          postgres    false    221            ?           0    0    users_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;
          public          postgres    false    223            ?            1259    24967    websites    TABLE     ?  CREATE TABLE public.websites (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    domain character varying(255) NOT NULL,
    display character varying(180) NOT NULL,
    code character varying NOT NULL,
    active boolean DEFAULT true,
    created timestamp without time zone,
    modified timestamp without time zone,
    template_id integer,
    application_id integer
);
    DROP TABLE public.websites;
       public         heap    postgres    false            ?            1259    25231    websites_application_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.websites_application_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.websites_application_id_seq;
       public          postgres    false    224            ?           0    0    websites_application_id_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public.websites_application_id_seq OWNED BY public.websites.application_id;
          public          postgres    false    244            ?            1259    24974    websites_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.websites_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.websites_id_seq;
       public          postgres    false    224            ?           0    0    websites_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.websites_id_seq OWNED BY public.websites.id;
          public          postgres    false    225            ?           2604    25213    applications id    DEFAULT     r   ALTER TABLE ONLY public.applications ALTER COLUMN id SET DEFAULT nextval('public.applications_id_seq'::regclass);
 >   ALTER TABLE public.applications ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    243    241    243            ?           2604    25214    applications template_id    DEFAULT     ?   ALTER TABLE ONLY public.applications ALTER COLUMN template_id SET DEFAULT nextval('public.applications_template_id_seq'::regclass);
 G   ALTER TABLE public.applications ALTER COLUMN template_id DROP DEFAULT;
       public          postgres    false    242    243    243            ?           2604    25099    components id    DEFAULT     w   ALTER TABLE ONLY public.components ALTER COLUMN id SET DEFAULT nextval('public.template_components_id_seq'::regclass);
 <   ALTER TABLE public.components ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    228    230    230            ?           2604    25100    components template_id    DEFAULT     ?   ALTER TABLE ONLY public.components ALTER COLUMN template_id SET DEFAULT nextval('public.template_components_template_id_seq'::regclass);
 E   ALTER TABLE public.components ALTER COLUMN template_id DROP DEFAULT;
       public          postgres    false    229    230    230            ?           2604    25277    gg_main_sliders id    DEFAULT     x   ALTER TABLE ONLY public.gg_main_sliders ALTER COLUMN id SET DEFAULT nextval('public.gg_main_sliders_id_seq'::regclass);
 A   ALTER TABLE public.gg_main_sliders ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    245    247    247            ?           2604    25278    gg_main_sliders website_id    DEFAULT     ?   ALTER TABLE ONLY public.gg_main_sliders ALTER COLUMN website_id SET DEFAULT nextval('public.gg_main_sliders_website_id_seq'::regclass);
 I   ALTER TABLE public.gg_main_sliders ALTER COLUMN website_id DROP DEFAULT;
       public          postgres    false    247    246    247            ?           2604    24976 	   groups id    DEFAULT     f   ALTER TABLE ONLY public.groups ALTER COLUMN id SET DEFAULT nextval('public.groups_id_seq'::regclass);
 8   ALTER TABLE public.groups ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    202    201            ?           2604    25193 
   layouts id    DEFAULT     h   ALTER TABLE ONLY public.layouts ALTER COLUMN id SET DEFAULT nextval('public.layouts_id_seq'::regclass);
 9   ALTER TABLE public.layouts ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    240    237    240            ?           2604    25194    layouts subpage_id    DEFAULT     x   ALTER TABLE ONLY public.layouts ALTER COLUMN subpage_id SET DEFAULT nextval('public.layouts_subpage_id_seq'::regclass);
 A   ALTER TABLE public.layouts ALTER COLUMN subpage_id DROP DEFAULT;
       public          postgres    false    240    238    240            ?           2604    25195    layouts component_id    DEFAULT     |   ALTER TABLE ONLY public.layouts ALTER COLUMN component_id SET DEFAULT nextval('public.layouts_component_id_seq'::regclass);
 C   ALTER TABLE public.layouts ALTER COLUMN component_id DROP DEFAULT;
       public          postgres    false    239    240    240            ?           2604    24977 
   methods id    DEFAULT     h   ALTER TABLE ONLY public.methods ALTER COLUMN id SET DEFAULT nextval('public.methods_id_seq'::regclass);
 9   ALTER TABLE public.methods ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    204    203            ?           2604    24978    methods module_id    DEFAULT     v   ALTER TABLE ONLY public.methods ALTER COLUMN module_id SET DEFAULT nextval('public.methods_module_id_seq'::regclass);
 @   ALTER TABLE public.methods ALTER COLUMN module_id DROP DEFAULT;
       public          postgres    false    205    203            ?           2604    24979 
   modules id    DEFAULT     h   ALTER TABLE ONLY public.modules ALTER COLUMN id SET DEFAULT nextval('public.modules_id_seq'::regclass);
 9   ALTER TABLE public.modules ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    207    206            ?           2604    25125    pages id    DEFAULT     d   ALTER TABLE ONLY public.pages ALTER COLUMN id SET DEFAULT nextval('public.pages_id_seq'::regclass);
 7   ALTER TABLE public.pages ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    233    231    233            ?           2604    25126    pages website_id    DEFAULT     t   ALTER TABLE ONLY public.pages ALTER COLUMN website_id SET DEFAULT nextval('public.pages_website_id_seq'::regclass);
 ?   ALTER TABLE public.pages ALTER COLUMN website_id DROP DEFAULT;
       public          postgres    false    233    232    233            ?           2604    24980 
   pclouds id    DEFAULT     h   ALTER TABLE ONLY public.pclouds ALTER COLUMN id SET DEFAULT nextval('public.pclouds_id_seq'::regclass);
 9   ALTER TABLE public.pclouds ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    209    208            ?           2604    24981    pclouds website_id    DEFAULT     x   ALTER TABLE ONLY public.pclouds ALTER COLUMN website_id SET DEFAULT nextval('public.pclouds_website_id_seq'::regclass);
 A   ALTER TABLE public.pclouds ALTER COLUMN website_id DROP DEFAULT;
       public          postgres    false    210    208            ?           2604    24982    permissions id    DEFAULT     p   ALTER TABLE ONLY public.permissions ALTER COLUMN id SET DEFAULT nextval('public.permissions_id_seq'::regclass);
 =   ALTER TABLE public.permissions ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    212    211            ?           2604    24983    permissions role_id    DEFAULT     z   ALTER TABLE ONLY public.permissions ALTER COLUMN role_id SET DEFAULT nextval('public.permissions_role_id_seq'::regclass);
 B   ALTER TABLE public.permissions ALTER COLUMN role_id DROP DEFAULT;
       public          postgres    false    214    211            ?           2604    24984    permissions method_id    DEFAULT     ~   ALTER TABLE ONLY public.permissions ALTER COLUMN method_id SET DEFAULT nextval('public.permissions_method_id_seq'::regclass);
 D   ALTER TABLE public.permissions ALTER COLUMN method_id DROP DEFAULT;
       public          postgres    false    213    211            ?           2604    24985    roles id    DEFAULT     d   ALTER TABLE ONLY public.roles ALTER COLUMN id SET DEFAULT nextval('public.roles_id_seq'::regclass);
 7   ALTER TABLE public.roles ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    217    215            ?           2604    24986    roles group_id    DEFAULT     p   ALTER TABLE ONLY public.roles ALTER COLUMN group_id SET DEFAULT nextval('public.roles_group_id_seq'::regclass);
 =   ALTER TABLE public.roles ALTER COLUMN group_id DROP DEFAULT;
       public          postgres    false    216    215            ?           2604    25140    subpages id    DEFAULT     j   ALTER TABLE ONLY public.subpages ALTER COLUMN id SET DEFAULT nextval('public.subpages_id_seq'::regclass);
 :   ALTER TABLE public.subpages ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    234    236    236            ?           2604    25141    subpages page_id    DEFAULT     t   ALTER TABLE ONLY public.subpages ALTER COLUMN page_id SET DEFAULT nextval('public.subpages_page_id_seq'::regclass);
 ?   ALTER TABLE public.subpages ALTER COLUMN page_id DROP DEFAULT;
       public          postgres    false    235    236    236            ?           2604    25084    templates id    DEFAULT     l   ALTER TABLE ONLY public.templates ALTER COLUMN id SET DEFAULT nextval('public.templates_id_seq'::regclass);
 ;   ALTER TABLE public.templates ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    227    226    227            ?           2604    24987 	   tokens id    DEFAULT     f   ALTER TABLE ONLY public.tokens ALTER COLUMN id SET DEFAULT nextval('public.tokens_id_seq'::regclass);
 8   ALTER TABLE public.tokens ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    219    218            ?           2604    24988    tokens user_id    DEFAULT     p   ALTER TABLE ONLY public.tokens ALTER COLUMN user_id SET DEFAULT nextval('public.tokens_user_id_seq'::regclass);
 =   ALTER TABLE public.tokens ALTER COLUMN user_id DROP DEFAULT;
       public          postgres    false    220    218            ?           2604    24989    users id    DEFAULT     d   ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);
 7   ALTER TABLE public.users ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    223    221            ?           2604    24990    users group_id    DEFAULT     p   ALTER TABLE ONLY public.users ALTER COLUMN group_id SET DEFAULT nextval('public.users_group_id_seq'::regclass);
 =   ALTER TABLE public.users ALTER COLUMN group_id DROP DEFAULT;
       public          postgres    false    222    221            ?           2604    24991    websites id    DEFAULT     j   ALTER TABLE ONLY public.websites ALTER COLUMN id SET DEFAULT nextval('public.websites_id_seq'::regclass);
 :   ALTER TABLE public.websites ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    225    224            ?           2604    25233    websites application_id    DEFAULT     ?   ALTER TABLE ONLY public.websites ALTER COLUMN application_id SET DEFAULT nextval('public.websites_application_id_seq'::regclass);
 F   ALTER TABLE public.websites ALTER COLUMN application_id DROP DEFAULT;
       public          postgres    false    244    224            ?          0    25210    applications 
   TABLE DATA           w   COPY public.applications (id, template_id, name, display, script, active, created, modified, layout, menu) FROM stdin;
    public          postgres    false    243   ??       ?          0    25096 
   components 
   TABLE DATA           }   COPY public.components (id, template_id, name, table_name, description, sort, active, created, modified, script) FROM stdin;
    public          postgres    false    230   ??       ?          0    25274    gg_main_sliders 
   TABLE DATA           ?   COPY public.gg_main_sliders (id, website_id, image, display, descriptions, tag_links, sort, active, created, modified) FROM stdin;
    public          postgres    false    247   \?                 0    24899    groups 
   TABLE DATA           l   COPY public.groups (id, name, display, code, active, created, modified, website_id, super_user) FROM stdin;
    public          postgres    false    201   ??       ?          0    25190    layouts 
   TABLE DATA           `   COPY public.layouts (id, subpage_id, component_id, sort, active, created, modified) FROM stdin;
    public          postgres    false    240   ??       ?          0    24906    methods 
   TABLE DATA           q   COPY public.methods (id, module_id, name, display, symbol, sort, is_menu, active, created, modified) FROM stdin;
    public          postgres    false    203   %?       ?          0    24915    modules 
   TABLE DATA           ]   COPY public.modules (id, name, display, symbol, sort, active, created, modified) FROM stdin;
    public          postgres    false    206   ??       ?          0    25122    pages 
   TABLE DATA           v   COPY public.pages (id, website_id, name, display, tag_links, icon, code, active, created, modified, sort) FROM stdin;
    public          postgres    false    233   ??       ?          0    24921    pclouds 
   TABLE DATA           ]   COPY public.pclouds (id, website_id, email, password, active, created, modified) FROM stdin;
    public          postgres    false    208   G?       ?          0    24932    permissions 
   TABLE DATA           Q   COPY public.permissions (id, role_id, method_id, created, module_id) FROM stdin;
    public          postgres    false    211   ??       ?          0    24941    roles 
   TABLE DATA           W   COPY public.roles (id, group_id, name, display, active, created, modified) FROM stdin;
    public          postgres    false    215   i?       ?          0    25137    subpages 
   TABLE DATA           v   COPY public.subpages (id, page_id, name, display, tag_links, icon, code, active, created, modified, sort) FROM stdin;
    public          postgres    false    236   G?       ?          0    25081 	   templates 
   TABLE DATA           [   COPY public.templates (id, name, description, sort, active, created, modified) FROM stdin;
    public          postgres    false    227   ??       ?          0    24949    tokens 
   TABLE DATA           G   COPY public.tokens (id, user_id, token, created, modified) FROM stdin;
    public          postgres    false    218   ??       ?          0    24956    users 
   TABLE DATA           _   COPY public.users (id, group_id, name, email, password, active, created, modified) FROM stdin;
    public          postgres    false    221   ??       ?          0    24967    websites 
   TABLE DATA           {   COPY public.websites (id, name, domain, display, code, active, created, modified, template_id, application_id) FROM stdin;
    public          postgres    false    224   ?       ?           0    0    applications_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.applications_id_seq', 1, true);
          public          postgres    false    241            ?           0    0    applications_template_id_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.applications_template_id_seq', 1, false);
          public          postgres    false    242            ?           0    0    gg_main_sliders_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.gg_main_sliders_id_seq', 2, true);
          public          postgres    false    245            ?           0    0    gg_main_sliders_website_id_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.gg_main_sliders_website_id_seq', 1, false);
          public          postgres    false    246            ?           0    0    groups_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.groups_id_seq', 7, true);
          public          postgres    false    202            ?           0    0    layouts_component_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.layouts_component_id_seq', 1, false);
          public          postgres    false    239            ?           0    0    layouts_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.layouts_id_seq', 17, true);
          public          postgres    false    237            ?           0    0    layouts_subpage_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.layouts_subpage_id_seq', 1, false);
          public          postgres    false    238            ?           0    0    methods_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.methods_id_seq', 90, true);
          public          postgres    false    204            ?           0    0    methods_module_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.methods_module_id_seq', 1, false);
          public          postgres    false    205            ?           0    0    modules_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.modules_id_seq', 19, true);
          public          postgres    false    207            ?           0    0    pages_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.pages_id_seq', 3, true);
          public          postgres    false    231            ?           0    0    pages_website_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.pages_website_id_seq', 1, false);
          public          postgres    false    232            ?           0    0    pclouds_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.pclouds_id_seq', 2, true);
          public          postgres    false    209            ?           0    0    pclouds_website_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.pclouds_website_id_seq', 1, false);
          public          postgres    false    210            ?           0    0    permissions_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.permissions_id_seq', 2598, true);
          public          postgres    false    212            ?           0    0    permissions_method_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.permissions_method_id_seq', 1, false);
          public          postgres    false    213            ?           0    0    permissions_role_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.permissions_role_id_seq', 1, false);
          public          postgres    false    214            ?           0    0    roles_group_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.roles_group_id_seq', 1, false);
          public          postgres    false    216            ?           0    0    roles_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.roles_id_seq', 6, true);
          public          postgres    false    217            ?           0    0    subpages_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.subpages_id_seq', 6, true);
          public          postgres    false    234            ?           0    0    subpages_page_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.subpages_page_id_seq', 1, true);
          public          postgres    false    235            ?           0    0    template_components_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.template_components_id_seq', 15, true);
          public          postgres    false    228            ?           0    0 #   template_components_template_id_seq    SEQUENCE SET     R   SELECT pg_catalog.setval('public.template_components_template_id_seq', 1, false);
          public          postgres    false    229            ?           0    0    templates_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.templates_id_seq', 2, true);
          public          postgres    false    226            ?           0    0    tokens_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.tokens_id_seq', 534, true);
          public          postgres    false    219            ?           0    0    tokens_user_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.tokens_user_id_seq', 1, false);
          public          postgres    false    220            ?           0    0    users_group_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.users_group_id_seq', 1, false);
          public          postgres    false    222            ?           0    0    users_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.users_id_seq', 9, true);
          public          postgres    false    223            ?           0    0    websites_application_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.websites_application_id_seq', 2, true);
          public          postgres    false    244            ?           0    0    websites_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.websites_id_seq', 2, true);
          public          postgres    false    225            ?           2606    25220    applications applications_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.applications
    ADD CONSTRAINT applications_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.applications DROP CONSTRAINT applications_pkey;
       public            postgres    false    243            ?           2606    25284 $   gg_main_sliders gg_main_sliders_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.gg_main_sliders
    ADD CONSTRAINT gg_main_sliders_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.gg_main_sliders DROP CONSTRAINT gg_main_sliders_pkey;
       public            postgres    false    247            ?           2606    24993    groups groups_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.groups
    ADD CONSTRAINT groups_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.groups DROP CONSTRAINT groups_pkey;
       public            postgres    false    201            ?           2606    25198    layouts layouts_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.layouts
    ADD CONSTRAINT layouts_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.layouts DROP CONSTRAINT layouts_pkey;
       public            postgres    false    240            ?           2606    24995    methods methods_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.methods
    ADD CONSTRAINT methods_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.methods DROP CONSTRAINT methods_pkey;
       public            postgres    false    203            ?           2606    24997    modules modules_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.modules
    ADD CONSTRAINT modules_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.modules DROP CONSTRAINT modules_pkey;
       public            postgres    false    206            ?           2606    25132    pages pages_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.pages
    ADD CONSTRAINT pages_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.pages DROP CONSTRAINT pages_pkey;
       public            postgres    false    233            ?           2606    24999    pclouds pclouds_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.pclouds
    ADD CONSTRAINT pclouds_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.pclouds DROP CONSTRAINT pclouds_pkey;
       public            postgres    false    208            ?           2606    25001    permissions permissions_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.permissions DROP CONSTRAINT permissions_pkey;
       public            postgres    false    211            ?           2606    25003    roles roles_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.roles DROP CONSTRAINT roles_pkey;
       public            postgres    false    215            ?           2606    25147    subpages subpages_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.subpages
    ADD CONSTRAINT subpages_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.subpages DROP CONSTRAINT subpages_pkey;
       public            postgres    false    236            ?           2606    25106 #   components template_components_pkey 
   CONSTRAINT     a   ALTER TABLE ONLY public.components
    ADD CONSTRAINT template_components_pkey PRIMARY KEY (id);
 M   ALTER TABLE ONLY public.components DROP CONSTRAINT template_components_pkey;
       public            postgres    false    230            ?           2606    25090    templates templates_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.templates
    ADD CONSTRAINT templates_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.templates DROP CONSTRAINT templates_pkey;
       public            postgres    false    227            ?           2606    25005    tokens tokens_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.tokens
    ADD CONSTRAINT tokens_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.tokens DROP CONSTRAINT tokens_pkey;
       public            postgres    false    218            ?           2606    25007    users users_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            postgres    false    221            ?           2606    25009    websites websites_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.websites
    ADD CONSTRAINT websites_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.websites DROP CONSTRAINT websites_pkey;
       public            postgres    false    224            ?   ?	  x??Zms?6???
?qG??!َsi\I??͵7si2g??M?ɀ$H?	? ??~?- ??/R,?r??h?&????x???'?O??9gQLd???y???????3???f??Q??t??|T4H?S	?xI9Mi??'????`%?ށHs??L??|i??!??N?\x?5N	˼???aLr|?-?3hnd?R??????
?㱷U$
J?9~!"??5?A?%??BxI??ֿ?7
f??퇗???~?HJ멨dae?i>w??̽k????>U??U7?1??|???3????H???e"??Oԓ???c|??BG/?^|??u???2m/?̟??????|x??r?\_!N?x??&Z󄒰????%?^?T.?f?b#??1?$gr
s7?<?H?????~N????ӣ??WGG߽
??4???d?桂??'??2?TyH??t?)?Uiu?F'b???X*~?=	??+?OI?? ????/0????B(?
???K??m????6?H???d???xQ?<???5S7v>????"O?r?rj?h??J/B??+,?YֹyL???Ē??#?[=y???2Mi?	UMW{?}y?(??i ?	A??G?? ?nen>s?t??????|Qן?? ??'?*??䢦?Μ>s,WH?]V?.?+*EJqTP:??3???J?"lU??ЗS,?ʇ?v?gI?
???YnG?W4P8b
????&E?vc/?P????Y?h8?\Q??#_?^?˘A??
????`?wc=yHvU?j??u?N????U?<?A????`??f6???gS?B ݛi~?????R?????{^0?Xh?Vԩ?wk; үB???nZwc;zw????ܥ?XJ????_2?~3^1?`?h?/?? ?????[J2X??I??ۈ3R?????-v??(?|??o&?k??b?50R???m\?l?a?wUc??j?8f??o{?$? 
-PD????'@?,(@?TxSuaE?t3	?'oJ?L????=!r??????=Sc>?G????xi??d69DL?HN'?T?8u8?J?$Ҷi???ܓ͞i??U?9??4|?{?d?%???A???-??
?h??$͞?+iv?h#?V乇4???q?a'??????&?1??A?Wn?ɜd?;?IƲ???gC?3?wr6??$2?S%d:?nt??]:???%唦?q?%??oTc????
k
/?^q?E,J?Sx8?k?V?N??vQNG$!3`DV?Rٗ?????
Kh?@?6??%b??vc??R/?????ވ泒oy?
?q?0??????Ҁ??Y:?4?R?*??Aast?Ë:Հ?S?;?%̗׳??k ?,?m?1i? ?tRmhu?i????pȄ_????K??V,T??;~??7?^t????P?d??@l2
?xl???	??R?3??ϫn?~03{?ɿ}?q?c?s_eT????s=?lò?=?z??d?2??ѳ"?L?tl??d1??4F?.?0T}?U5mA??NdotvF?|???f?q͌?X;?Qxm}?m??ğ?69?No|?Ѧ??NcX??h?a?Yu??U??[?w?m????U????q???}¼u?7?xC?o?o?p?????Ӄ|?W7??j?U?6?Z?Y??(>D?f?F?!?4?h????f?7Z]?????@V?q`?wP?x-;???R????Ӣ-??`?4???ű?W?_???Ŧ]S6l???M|IrnM???Z????{?a?t(??8??Oj??WQ?;??/?u??	??2?i??????<X?:??҂??#?"?9W4?"E?EX??̓U??N?;?b?mC?Zt?b0[?N?2:)?|9b?ٿ??g??ٗ  ?,?ׅ?A? (	?P@
F0???fO?z,?2l?XKX??&?ig??]?Rt ?_??B??J????????I+??r??FS5*N|???'#׏?KP1ɀ ?[?c5?Y?05??f >??(ׯ9??=X/X?U???5 ????9~?rP?Rd????6?)U????B*w?Y??*=??f!V?	vy?>R?:?;???}????????r?_?"<?xݰ?]?L???f???!C}4?诏??zL?ϒ???<??5yV@??,???? ????????>~?;?T?1gn???"???d?nw?P??ք?8R??u|?נS??q???d??_?4b??Ed=?\c?~??s^?o?s%?eR??R??6???najt?4?%??w[?z?]?????C???E????V ???G???ia?25v???T?5+??U???l>"??Y݂pZ7?\?cj??N?[????)?r?O	?K?t?-
݈?hP?ܦ?˦5Xwg'~ԫԧ?92?+??8???nZ4?ޙ?F????G?X???wۓ??]?????Z??gjv?[?%?u9?????c???V???4;????TS?S?KP??wd ?YlWA?Do3SW?)}???Ym???8}???? U"?      ?   ?  x?m??N?0??????9??KN??bh?AB?Q???)??I???u?I?oG??:?$@??ݔ?=6me?W????V\?D?xf?6:bz%?qe8Є
?u???>lK?v?pC?4??Q??i????????.[?)??O?Y:|Abé???֡DQ?,{??????r?3
?3#:?B!?7e?ņ.E??p???1?ܘԈd?I?z?,?]??ln ?<%M??????/?q?.89???a??+????4?.?5?㥯@h??6?2j?$?a?-?? ??ov?4]???? p????@???^j?b}d?s?; ???Fj\I??d?t??f?m????}??c?&a??,?Ŏ+?Tuc?Yl]?Ν?ث??? /???$c???_?(?_?      ?   D   x?3?4?,I-.?
.???E?%??y?q?4????????????????????????!W? ?>?         ?   x???Mj?0F??)t????ϮP?	!?t(.Q???AR(?}eG??ɢ????f$???@^????4??? ?e????X?̤࠸PL ?d?!G*?j<\?ۿ{?ԛ?"?p?҅?xC"??gog??\7??-??b?P?%s??Iߴ??ԝC7?Q?n,?w?C]?v?Y??ef~c??!:?޴??"_Ţ??lZ?>???_?O??c6???>??ܟG5
?Z?9??y4???}?B)?I???      ?   a   x?m???0C??,P?oK2ct?r@?*˗?ؖң02U??m??!?aG??8X~Kj??j??b@Z???XE?G4??$??xG?g#?Y18w ? ??$?      ?   ?  x??Y?n?F]??
?{????H8iH#i?M7?I?dѠ?<????ɡ8F$R@?X??9?9?5#????]?׋2?]g??˫??ڬ??2???nEo?^???|??}?&b?W?\qq?*?r?@??yٰ??r
??ky???[Pȟ??)?o??N?P!??d?!??X?ɋ??󶨷?
E6U???VP?T????K5?O?Wx_W???DpS	?KR?CX?Xls?*??!?r?u??*?A????Y?#?SL?1????ݺ?o?6? ?D/?A?4>??ŀ???6???'?D?9aq?Cp?L?D?<T?'\*&+!0O?r'?@?? ?????la?-
\ȉ$?ǅ?ŀ;fN|?eD??'(????q*Tt?.??%SI?Q?> !?n??D????7?7?D??c^F???+?Ū?????=~??mS?????z?????a 5????6[??}????$??}??0??%? z????%???"t??PƦ???[?S,??C|?0??????r?>??????B?????)?U뼨???j?~o?~????'H?@\q?cҀ?(֭?D??u????c??t=Гf?<=?U¡?>?
???]o??ԌP?XӒ?4?vO?*??!??~?ߟ[*??GЊ? :U?X??H?????b??U?<???fڡcz?RN???????b??X?¥*>??Ho$?w6??????۱?Hc?܄??MQ???mYm^??f??M4???Q?\_?ʗFNO_X???h?p}{??}?׭??]Do?L???$-??@
?????;(ꆨ):?)ɰOΝ?KG1??ؚx????б??c??Ia???1j?@R	???tH??Ce??>?1̆p>Il\?i??J?a???\?nVo??.?0?v??<??X[$$??0?eR????G?<EP*?Hh*K????D7??a???????z?G???Ǘ?? ?????|Z%O",C?? E?2?oՖ]wߜ???;@x6???)?x??H?]??U<>?q?8m=???t$AF?0ВTN1???L^??0??ዲ??e??Ʉ0?ɖ?QvZU>??????֤q? ???^??-`?`?/t@???a?b????
8`?Fiw?w?)7#B????yц001???
?????=?b?!É?1?sY<? ?%??.????M?9??Lf??c????H2cv(u??F`?E??yϕ??u??A?u\|????1Ŀ???O???n[???D?S?~Y00?T???LX?l??2?[.!Bؘ????r?????r?-}>?!,???.?C?????fM?^?Q6XI?]????6``?/p???f>????{.5?s?0??????????`ٷ?Kg??ŗ??Gb?Nz8?*?c??s)-\Lbٮy??򿬡????ݹ! c:????KD|?=?A?+ۖ͌?p???;?W?iY*??0?????i]޶???6?ז????ߪ???WQV??????b????w?,?+n{?>?0p?ԧYt????}59??I???Y?2$*??6??)??Y?*,?T?I??$<KX???????>[~?ǽr}Z???ϱ?JpJ
-?O?G8Kj?*q?$?z??s?>wD??T???.!??tϥR?0Hb?_R?=>?B?? ??V?&      ?     x???M??0??ү{w?ч??v??!??^z??????]?>??w?Ml'2??hF??}4?䧷????????/?PWѻ?v?Uۇ???????D\F??(}?T?SƕѨI?Ȧ???_?[?By??~B???&ۺ?K?Ǹ??BBj???@c???{]?1?!萐?R???z8?Ǻ?=^r?q???ζG罫+?O?c??????Q?Z{??#=Ʊ?]9*??????u????1Y??v$!F'4%??????x???]??K???fdF ???w?|L??럪 ?xb??rI? ?{l?|p??????&??C?%7*??b#?Q???>6ue????r??8?HEA?o???XW?˹??T?S??Q?d߿6'kL?j?????0Z,ib?=?W?x;?????}??k¤QH.?b???w〱QX????xx,??.iR??iJwȻӋ?ڬ`MGG??A??Q??f??]?/]1??l6lز?~/??0????xI???QJ?@??      ?   m   x?3?4????M?? `?,?4202?50?52Q04?25?25G3?25?4?2?4"h??????????	V1C.c?K?Rˋ9?@?řW7?T?????????W? ??.3      ?   R   x?3?4?,?/???K,J,?/M?pH?M???K??????+?L7????,?4202?50?54S04?24?20C36?22?????? p?       ?   ?  x?}?[??(??N1?5??:?????Y?M?~{????e??+?????U?R?s?O???_?=??i?qڸ[Z7͛???MK??m\y?i?ظ??|m????tm>?W?<?sm)߼}???j??>[W??ĸo\c<6N1?<}?|?????y??????m?5c\6^1?[???????{́??eI?????MKH?/<????z?????\???q?O????uS?j?t???i?t?[???+?Im?_?O???uɘ]gɗCi?Dk?7??o?????K?yq?%_q?%_q?6??q????'????????/??????????????/{????~|q}?~???˾~??˾~????????x???h???????2??????+~???????g? ??lB;???+x??y?
V??h????A?9ʒ?l\g????9̒?*?9̊?+?????%?4K???8K?yqγ?OKqN???Kqu~~?????????O?Z1?_???O??ǟ??~~????τ?/???u?????????_???_?~??W?q5S??/??x??????ϯq????RC??/?֟??8???B;???_P;?R;?+t?З?@?pX?????D? [??؂Y(???BD??%?d?? &[???d?k?`??Ŧ@Rk?W??r???`?&+L??????I0?Q
`???df?`????@5????V@??
`r&;L?????I09?
`r&??<???09{?j?3?? &g?A??<(??xP ?3??`r+JL?`E)???T ?+0I`??Ŏ???s?߁??_???i?Ƈ????????
??2???m_?=n???]|̭?)???U?????.>?߿??8?????Ѕ??}c?Vyb???o????7Ĺ?]wm?9??.u^-zÝ?3u_?9?\?yxSYc?<?g?=?g?>?g?u??Ǻ??s}?ẏ??ǟ?3ײ???????????????????????????????????g?????7??>?p??>??q?}??Q?70?z<|????!@o3p?z|????yXt??	L4???	???6O ???!??>1?z?'?I??<L???	h'???`??6?n&&]o?0?z?X?t?????m? &]oC?=eaҵ.X???mxNdL???	`ҵw??????^%      ?   ?   x?m?ϊ1???S?*M??????-??AF?.?ݩ????:J?[??|??'??~lBO?Rd\ 㒡?h?XYi*Ӕ/?V-?~8????????磥???R?=?V4s?(??]??%vC?¶??uUh??`?եs???C?.V??}N?F>???
?|?l(7?}-???M~u???c?4wb7N?6M	Scc??cd? ??4?s      ?   ?   x?m?1?0Eg??@??8@?qN?"?C???I?
????????,??L???G??s?m !aG?D>XP?v?cT???(p?????cGmC{ӼO????'F_????u?͋?????[??T??l
??%e??e??_??><      ?   ?   x?m?A
?0 ??+?ULl,???k/[]K 6!Y????IJo??}=.?²zv?c???(?{/p?	ưDb?n#_`	r???C??݈~/?1??rv???x?\%X?F???V??Y???????Vj1<`?̸&??8?>o4?m?֨N>k)??A?      ?     x????r?0???)|:$!?Y
5؀ 2;? ?A??*??_:??-;/?E~?d?/9?? ????e2asf?ٓ?l???mM?? ?9?]??ob¼i?>R
??4\]\^q/? ??X???tATRmΩ??KY??N1_???%????mf6?kA? ?????D?2??H?6??????L?
?[?????R^pz}Ǽ?Oi_Y??ĩl7Ii??g??V?W?%ur??????tII?v???:?]U??5?#Y7dh 4??PW?V??L^7??g??$?x??_7&?r??iB?l?????U??p? s?Fm?qW???X??????MpS??_r}?c#d m(1??V???͵/Hê??K?????)??/+??Qg?f^????t???ufaZ'???????@??YX?`$ciF?U????V?'+7$?.&??c5y?*?"??{u?%??Ij?????9^??L{%?ԷW?`(??A??y?????]|??%c0/??a???]$??*:?y^?1u?????I<???ޱ?Q?C???Nş??`?      ?   M  x?m??r?@?u?YdK???YE?B$	*????V? r?>jj?????`?+? YƞF?6x$?#F??#Z??Mׯ?|??4U???:?z???R"?:v3??q?^Y?????`? ??H????d]?tA??q  ?? ?b
O?O??2?ȒC?<cO?p????\?p??:r?N93?4j?v?|?8???????,???H??x*D??Ƚ?#?hL??+????b7?F?^)5ƶ?Z?F?VY?[=???t??|6?}??t?????~	?K\
%]T???2U??? J?Q???A??'<???m?-??X??Yn?xgk07a??yկ<˶??tEd??6?Z?7??$?X:?#??ʽ?S?t!a?hUД]\???ܼ,???*?L?0?N?)?-ߥ???:(v?+w&̨څ<v??p?"??8?\X?Y??<+YX\|???m??t???C???G&BM??P?$??E?4??C?z???"m7?+^???m??oIt]2?):!? rPnlu8/#?Uy%?~W?qȧ??4Fq?j???>????7?J?l?ƫb?v?q??;-9??͎?)_I?|Z?:&?2??8??+?      ?   ?   x?3???K???,??-J-.I,-J?+?,//׃?#????s9=??
A??A?%?FF??&???
V??VFX?b????aojqA~??!T?\u???<]??l3?22?20?????+? ??20?B?=... W?C?     