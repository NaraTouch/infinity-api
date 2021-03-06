PGDMP         4                y            infinity-database-new    13.2    13.2 ?    ?           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
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
                        false    2            ?            1259    25096 
   components    TABLE     ]  CREATE TABLE public.components (
    id integer NOT NULL,
    template_id integer NOT NULL,
    name character varying(50) NOT NULL,
    table_name character varying(180) NOT NULL,
    description text,
    sort integer NOT NULL,
    active boolean DEFAULT false,
    created timestamp without time zone,
    modified timestamp without time zone
);
    DROP TABLE public.components;
       public         heap    postgres    false            ?            1259    24899    groups    TABLE     `  CREATE TABLE public.groups (
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
          public          postgres    false    223            ?            1259    24967    websites    TABLE     n  CREATE TABLE public.websites (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    domain character varying(255) NOT NULL,
    display character varying(180) NOT NULL,
    code character varying NOT NULL,
    active boolean DEFAULT true,
    created timestamp without time zone,
    modified timestamp without time zone,
    template_id integer
);
    DROP TABLE public.websites;
       public         heap    postgres    false            ?            1259    24974    websites_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.websites_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.websites_id_seq;
       public          postgres    false    224            ?           0    0    websites_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.websites_id_seq OWNED BY public.websites.id;
          public          postgres    false    225            ?           2604    25099    components id    DEFAULT     w   ALTER TABLE ONLY public.components ALTER COLUMN id SET DEFAULT nextval('public.template_components_id_seq'::regclass);
 <   ALTER TABLE public.components ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    228    230    230            ?           2604    25100    components template_id    DEFAULT     ?   ALTER TABLE ONLY public.components ALTER COLUMN template_id SET DEFAULT nextval('public.template_components_template_id_seq'::regclass);
 E   ALTER TABLE public.components ALTER COLUMN template_id DROP DEFAULT;
       public          postgres    false    229    230    230            ?           2604    24976 	   groups id    DEFAULT     f   ALTER TABLE ONLY public.groups ALTER COLUMN id SET DEFAULT nextval('public.groups_id_seq'::regclass);
 8   ALTER TABLE public.groups ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    202    201            ?           2604    25193 
   layouts id    DEFAULT     h   ALTER TABLE ONLY public.layouts ALTER COLUMN id SET DEFAULT nextval('public.layouts_id_seq'::regclass);
 9   ALTER TABLE public.layouts ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    237    240    240            ?           2604    25194    layouts subpage_id    DEFAULT     x   ALTER TABLE ONLY public.layouts ALTER COLUMN subpage_id SET DEFAULT nextval('public.layouts_subpage_id_seq'::regclass);
 A   ALTER TABLE public.layouts ALTER COLUMN subpage_id DROP DEFAULT;
       public          postgres    false    240    238    240            ?           2604    25195    layouts component_id    DEFAULT     |   ALTER TABLE ONLY public.layouts ALTER COLUMN component_id SET DEFAULT nextval('public.layouts_component_id_seq'::regclass);
 C   ALTER TABLE public.layouts ALTER COLUMN component_id DROP DEFAULT;
       public          postgres    false    240    239    240            ?           2604    24977 
   methods id    DEFAULT     h   ALTER TABLE ONLY public.methods ALTER COLUMN id SET DEFAULT nextval('public.methods_id_seq'::regclass);
 9   ALTER TABLE public.methods ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    204    203            ?           2604    24978    methods module_id    DEFAULT     v   ALTER TABLE ONLY public.methods ALTER COLUMN module_id SET DEFAULT nextval('public.methods_module_id_seq'::regclass);
 @   ALTER TABLE public.methods ALTER COLUMN module_id DROP DEFAULT;
       public          postgres    false    205    203            ?           2604    24979 
   modules id    DEFAULT     h   ALTER TABLE ONLY public.modules ALTER COLUMN id SET DEFAULT nextval('public.modules_id_seq'::regclass);
 9   ALTER TABLE public.modules ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    207    206            ?           2604    25125    pages id    DEFAULT     d   ALTER TABLE ONLY public.pages ALTER COLUMN id SET DEFAULT nextval('public.pages_id_seq'::regclass);
 7   ALTER TABLE public.pages ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    231    233    233            ?           2604    25126    pages website_id    DEFAULT     t   ALTER TABLE ONLY public.pages ALTER COLUMN website_id SET DEFAULT nextval('public.pages_website_id_seq'::regclass);
 ?   ALTER TABLE public.pages ALTER COLUMN website_id DROP DEFAULT;
       public          postgres    false    232    233    233            ?           2604    24980 
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
       public          postgres    false    226    227    227            ?           2604    24987 	   tokens id    DEFAULT     f   ALTER TABLE ONLY public.tokens ALTER COLUMN id SET DEFAULT nextval('public.tokens_id_seq'::regclass);
 8   ALTER TABLE public.tokens ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    219    218            ?           2604    24988    tokens user_id    DEFAULT     p   ALTER TABLE ONLY public.tokens ALTER COLUMN user_id SET DEFAULT nextval('public.tokens_user_id_seq'::regclass);
 =   ALTER TABLE public.tokens ALTER COLUMN user_id DROP DEFAULT;
       public          postgres    false    220    218            ?           2604    24989    users id    DEFAULT     d   ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);
 7   ALTER TABLE public.users ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    223    221            ?           2604    24990    users group_id    DEFAULT     p   ALTER TABLE ONLY public.users ALTER COLUMN group_id SET DEFAULT nextval('public.users_group_id_seq'::regclass);
 =   ALTER TABLE public.users ALTER COLUMN group_id DROP DEFAULT;
       public          postgres    false    222    221            ?           2604    24991    websites id    DEFAULT     j   ALTER TABLE ONLY public.websites ALTER COLUMN id SET DEFAULT nextval('public.websites_id_seq'::regclass);
 :   ALTER TABLE public.websites ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    225    224            }          0    25096 
   components 
   TABLE DATA           u   COPY public.components (id, template_id, name, table_name, description, sort, active, created, modified) FROM stdin;
    public          postgres    false    230   ??       `          0    24899    groups 
   TABLE DATA           l   COPY public.groups (id, name, display, code, active, created, modified, website_id, super_user) FROM stdin;
    public          postgres    false    201   =?       ?          0    25190    layouts 
   TABLE DATA           `   COPY public.layouts (id, subpage_id, component_id, sort, active, created, modified) FROM stdin;
    public          postgres    false    240   A?       b          0    24906    methods 
   TABLE DATA           q   COPY public.methods (id, module_id, name, display, symbol, sort, is_menu, active, created, modified) FROM stdin;
    public          postgres    false    203   ??       e          0    24915    modules 
   TABLE DATA           ]   COPY public.modules (id, name, display, symbol, sort, active, created, modified) FROM stdin;
    public          postgres    false    206   {?       ?          0    25122    pages 
   TABLE DATA           v   COPY public.pages (id, website_id, name, display, tag_links, icon, code, active, created, modified, sort) FROM stdin;
    public          postgres    false    233   Q?       g          0    24921    pclouds 
   TABLE DATA           ]   COPY public.pclouds (id, website_id, email, password, active, created, modified) FROM stdin;
    public          postgres    false    208   η       j          0    24932    permissions 
   TABLE DATA           Q   COPY public.permissions (id, role_id, method_id, created, module_id) FROM stdin;
    public          postgres    false    211   0?       n          0    24941    roles 
   TABLE DATA           W   COPY public.roles (id, group_id, name, display, active, created, modified) FROM stdin;
    public          postgres    false    215   x?       ?          0    25137    subpages 
   TABLE DATA           v   COPY public.subpages (id, page_id, name, display, tag_links, icon, code, active, created, modified, sort) FROM stdin;
    public          postgres    false    236   V?       z          0    25081 	   templates 
   TABLE DATA           [   COPY public.templates (id, name, description, sort, active, created, modified) FROM stdin;
    public          postgres    false    227   ۽       q          0    24949    tokens 
   TABLE DATA           G   COPY public.tokens (id, user_id, token, created, modified) FROM stdin;
    public          postgres    false    218   ??       t          0    24956    users 
   TABLE DATA           _   COPY public.users (id, group_id, name, email, password, active, created, modified) FROM stdin;
    public          postgres    false    221   ??       w          0    24967    websites 
   TABLE DATA           k   COPY public.websites (id, name, domain, display, code, active, created, modified, template_id) FROM stdin;
    public          postgres    false    224   ?       ?           0    0    groups_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.groups_id_seq', 7, true);
          public          postgres    false    202            ?           0    0    layouts_component_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.layouts_component_id_seq', 1, false);
          public          postgres    false    239            ?           0    0    layouts_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.layouts_id_seq', 14, true);
          public          postgres    false    237            ?           0    0    layouts_subpage_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.layouts_subpage_id_seq', 1, false);
          public          postgres    false    238            ?           0    0    methods_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.methods_id_seq', 80, true);
          public          postgres    false    204            ?           0    0    methods_module_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.methods_module_id_seq', 1, false);
          public          postgres    false    205            ?           0    0    modules_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.modules_id_seq', 17, true);
          public          postgres    false    207            ?           0    0    pages_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.pages_id_seq', 3, true);
          public          postgres    false    231            ?           0    0    pages_website_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.pages_website_id_seq', 1, false);
          public          postgres    false    232            ?           0    0    pclouds_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.pclouds_id_seq', 2, true);
          public          postgres    false    209            ?           0    0    pclouds_website_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.pclouds_website_id_seq', 1, false);
          public          postgres    false    210            ?           0    0    permissions_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.permissions_id_seq', 2313, true);
          public          postgres    false    212            ?           0    0    permissions_method_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.permissions_method_id_seq', 1, false);
          public          postgres    false    213            ?           0    0    permissions_role_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.permissions_role_id_seq', 1, false);
          public          postgres    false    214            ?           0    0    roles_group_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.roles_group_id_seq', 1, false);
          public          postgres    false    216            ?           0    0    roles_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.roles_id_seq', 6, true);
          public          postgres    false    217            ?           0    0    subpages_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.subpages_id_seq', 4, true);
          public          postgres    false    234            ?           0    0    subpages_page_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.subpages_page_id_seq', 1, true);
          public          postgres    false    235            ?           0    0    template_components_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.template_components_id_seq', 14, true);
          public          postgres    false    228            ?           0    0 #   template_components_template_id_seq    SEQUENCE SET     R   SELECT pg_catalog.setval('public.template_components_template_id_seq', 1, false);
          public          postgres    false    229            ?           0    0    templates_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.templates_id_seq', 2, true);
          public          postgres    false    226            ?           0    0    tokens_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.tokens_id_seq', 477, true);
          public          postgres    false    219            ?           0    0    tokens_user_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.tokens_user_id_seq', 1, false);
          public          postgres    false    220            ?           0    0    users_group_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.users_group_id_seq', 1, false);
          public          postgres    false    222            ?           0    0    users_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.users_id_seq', 9, true);
          public          postgres    false    223            ?           0    0    websites_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.websites_id_seq', 2, true);
          public          postgres    false    225            ?           2606    24993    groups groups_pkey 
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
       public            postgres    false    224            }   u  x?m??n? ??=O?t?ܟ7????v?ĸ?9??????h[9?!'hЩ\??Av?	t@1%+?V?#	?e>?ٝe??вl?J??,??-????!??O|?`~mO?uѡM?????4????r?????|?pFV4?ɢ?՗&ʵ??9??A??{d0o???vC[??1??e?LϺ?l?cA#??8D???wע?Ԕr??T??? ?/?l[p???8r<?$7z?????/???2?????n??????,??~"B?c@?{{n[=??????*?`˗`:?????K??r!?Q?????q????z?m?3???n?V?8q??n?-?.oٌZWJ??-?0?m??wYj????? ??^)?      `   ?   x???Mj?0F??)t????ϮP?	!?t(.Q???AR(?}eG??ɢ????f$???@^????4??? ?e????X?̤࠸PL ?d?!G*?j<\?ۿ{?ԛ?"?p?҅?xC"??gog??\7??-??b?P?%s??Iߴ??ԝC7?Q?n,?w?C]?v?Y??ef~c??!:?޴??"_Ţ??lZ?>???_?O??c6???>??ܟG5
?Z?9??y4???}?B)?I???      ?   \   x?m???0C??,P?8	????_???T?/϶l??Fh/???%/v?EZ??m?j??#?????qE?}?f??iH?O?g?ϕ?/??$?      b   ?  x??Y]o?6}??B߽????H???A?n/{qc6?X?-??~???,??T???>I?y??$[o6?????v}8????+w??}?I???^<??x????ULr)V\??N?ɵɅ?a???????kz?¯??F?44?o??W???|???c67?XCY???b????ǃ??
_?z? ????s?s=ڥ47,>Q??v_G?E?%?.˅?a?Pb??Y?e?ٗ?lx?u???c??G?c?H??????q???`lD?0?41?}0.?Cj?D?+?r5z~?@(??w=???̶N??K?Y?D???J???	,.???H'0yG?D?Wr"?հ0??????E?a&?0J,?????R?0@??bj2??0????a=a???oῲ??%	6E?_???֯???'~??w	?N?ՍJ????ң?ie??š:?w????H ???ieY	???E?\a??a?(B?mel.??^c@?b9??ⳇ?l[?;??~???8??@Z????_W?M????o?/???j?_?x??`???ĕHqL??4ᦶ=??????'i???0]?E??톨@k?LQ????B?????[K?%?z????????-כ7H?>?o??????E???c5?????n?????jr/-?g3]?1y? '????????b???4??K?b??7???????8M+?iI̷??̹\n??}u????P???ߩ????J:0y?=????X?????K*e8????ݡs??Z?????yS?d>JK??(P?xy?
N??!j??dZ1??sg?2	?q[??a?5??Z6?!1T?1І?M??1?%?XkyZ???<?0?+??9?YΓ???Pغ??\?14U??????ն<n(???n?GB??EbA2? ?X&*H?(??(#?RG	Ce?2??)?f???H?
?@_????????1?????L$?{?*E?`RXu$hj??f???}3iI<8@6???*?x??H?^????8pL[O?"I?Q?F????o??)?8??"~Q?????6?8ي?/ʦU?_??C??:?T?????BL?&#?K?>?????????(m/?n1?fDh}?8/???
.?????p?n0?)?? ?k??e|?AG?.?*˝?M:.F???rh?V4?XEf??v?u?T??}A27\YxX0???$Z?%F?OXK??n???a`????????d~J8?4,?6%?%>#$??fľ???K???2?k.=???	?_??p??a?k?r߭???9?l??????Hc??-S??:?&?.?\??`??/p????=wg???-???0p?	?}??Z?????K???Y:?Ḫe?	?Υ?H9???՗r_?????q??ti(NgW<[?`???gĸ?CQ͸	??g?̊?z????? ?2A?      e   ?  x???MO?0?????????#p??VZ?
X?e/?5`)?K?????$?#5?홼???x&?????ƱmU?p{嶾I>l?c?m?d???????? \@?e??0???M%<g\????<??߇c8?o]?/????%D쯁j??w}e??TLȍ?s?6hJm??wa?k:&?Go???f??7?>׸?K?:?ݡ??ضv!8߄?|"?;?p'o??I?Z{??#=3Ʊ?]?9*??ɳ????V1K/c????b??hN6?????x???=??K???fF ?kp?|L??럪 ?xfpi??Q?????ܧ?r)x??"??zɍ?O??H$????7???<]?1?Lc?T??)߱??s???۫?Je8EKM?????5&l5D?A?M-?4
)?U??=??1? ?9AM?)a?(dǁz????8`lV ?92~??Η4???R????      ?   m   x?3?4????M?? `?,?4202?50?52Q04?25?25G3?25?4?2?4"h??????????	V1C.c?K?Rˋ9?@?řW7?T?????????W? ??.3      g   R   x?3?4?,?/???K,J,?/M?pH?M???K??????+?L7????,?4202?50?54S04?24?20C36?22?????? p?       j   8  x?}?K??0??)r??	?J>K???ZO????? ????z?G<????1~??u?????y?#??q$^???-?.iOڧ?3?`]??;?d???J??~t?7?j???:?c<~???8_??%=???^IGE?#Y?4{?????=??t$eU????q?t%?J???u??~S31??oj>?8d??.????GZ????F???~??c.?xq܅/?8??F\???'.?t;yȟ/?x?[k????#._??i?????kޏ8???_\g??_??O????׽q?u?G\??^_?ߨ???׽?????G????3???X^????????b:?w|t??Mf???`?????u?W?^???{??G????c??ۥ???o??o?/?{?e? ? ??>?5^????{q????	?\????????q?2????4??{???8?_p??/?????_?ꈫ?????ϗo'_???'~7f???|}??????~??:?~N8???_\???_??O????׽q?u?G\g?^????2?????????8?F?g??z?\???'?????ۿ???`ݼ?n???; ???w ?????	?&? g?H????X?x??"@?,֠ &g?&g??????v0?|???$?????ѷ???*L? \?\?I0?
??????T?|ʏW믦?0???S?nuX?f?}갊Be??a&갊B)?:?R?:??P
?M/
? u?E갋:(@vQ0??
`r&	&w?a??Yx??ʣ????????????o???g?e??J?K?繿}x}`>8?s
?????{?p̽}?|p??jw??Oe.܅_???CZs?5???{????޾?n_<?C???_\?????_????׼q?u?G???ߨ???????Y????Yq???O???>,??O?ϯ????D?~`p??@??K?c?p??xK??t??|??4.?&w ??{??\?.???0?
?
`r?V??ܾ???nB?L
tL??$?s:&waRL?¤?܅I0??
`r?\?|?{ƯTx.?{v??y>?? 5??u      n   ?   x?m?ϊ1???S?*M??????-??AF?.?ݩ????:J?[??|??'??~lBO?Rd\ 㒡?h?XYi*Ӕ/?V-?~8????????磥???R?=?V4s?(??]??%vC?¶??uUh??`?եs???C?.V??}N?F>???
?|?l(7?}-???M~u???c?4wb7N?6M	Scc??cd? ??4?s      ?   u   x?m?K
?@D?ݧ??7F?? K?"???9??A⦺x?`x?>?`?~?Q?3??p b?=?S{?r??5?VRNG?VT??=?3??1??qo???څ5????".k$.p      z   ?   x?m?A
?0 ??+?ULl,???k/[]K 6!Y????IJo??}=.?²zv?c???(?{/p?	ưDb?n#_`	r???C??݈~/?1??rv???x?\%X?F???V??Y???????Vj1<`?̸&??8?>o4?m?֨N>k)??A?      q     x????n?0???S?@?Ąd?4mnD#U???4P?O??TM;L?/??>???c?B	I??ybp?[???6??r?}?Y(t????Cb3??X?????l???+
?v?3??Z?>?+V???^B! ?r?)/;?+????1>u??"^
?m?_	{@????:?:T?2!$??2g1{?9"????<??Z$O?N?2?O?U??|???xI???¢?Lj?ޟ???Ի???????L߃s???5$@??!??d????&??????L?Hd??2?y?]?&?æ???yAúv??A3V???
???\?57H????\{h?1???+?K?^????????}7??u4/??8B?2?$&??>1fUm2?;?xvz???T>??IW?2ip/???;#????@[d$??{#{?6q3 u2?)?^??a1ߌ2(??/?/?ѿ?Uu?ue??*i?:?:?????)?il?6+?$??t?˩???N???????XR3?%V?^$[??qn0҉ڕɿ??,?7"a?      t   M  x?m??r?@?u?YdK???YE?B$	*????V? r?>jj?????`?+? YƞF?6x$?#F??#Z??Mׯ?|??4U???:?z???R"?:v3??q?^Y?????`? ??H????d]?tA??q  ?? ?b
O?O??2?ȒC?<cO?p????\?p??:r?N93?4j?v?|?8???????,???H??x*D??Ƚ?#?hL??+????b7?F?^)5ƶ?Z?F?VY?[=???t??|6?}??t?????~	?K\
%]T???2U??? J?Q???A??'<???m?-??X??Yn?xgk07a??yկ<˶??tEd??6?Z?7??$?X:?#??ʽ?S?t!a?hUД]\???ܼ,???*?L?0?N?)?-ߥ???:(v?+w&̨څ<v??p?"??8?\X?Y??<+YX\|???m??t???C???G&BM??P?$??E?4??C?z???"m7?+^???m??oIt]2?):!? rPnlu8/#?Uy%?~W?qȧ??4Fq?j???>????7?J?l?ƫb?v?q??;-9??͎?)_I?|Z?:&?2??8??+?      w   ?   x?3???K???,??-J-.I,-J?+?,//׃?#????s9=??
A??A?%?FF??&???
V??VFX?b??????ZB??U7???5?*s+#c+#????????????1?!W? ?C     