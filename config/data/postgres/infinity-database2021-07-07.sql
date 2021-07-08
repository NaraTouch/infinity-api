PGDMP     .    *                y            infinity-database-new2    13.2    13.2 �    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    25285    infinity-database-new2    DATABASE     |   CREATE DATABASE "infinity-database-new2" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'English_United States.1252';
 (   DROP DATABASE "infinity-database-new2";
                postgres    false                        3079    25286 	   uuid-ossp 	   EXTENSION     ?   CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA public;
    DROP EXTENSION "uuid-ossp";
                   false            �           0    0    EXTENSION "uuid-ossp"    COMMENT     W   COMMENT ON EXTENSION "uuid-ossp" IS 'generate universally unique identifiers (UUIDs)';
                        false    2            �            1259    25297    applications    TABLE     [  CREATE TABLE public.applications (
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
       public         heap    postgres    false            �            1259    25304    applications_id_seq    SEQUENCE     �   CREATE SEQUENCE public.applications_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.applications_id_seq;
       public          postgres    false    201            �           0    0    applications_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.applications_id_seq OWNED BY public.applications.id;
          public          postgres    false    202            �            1259    25306    applications_template_id_seq    SEQUENCE     �   CREATE SEQUENCE public.applications_template_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.applications_template_id_seq;
       public          postgres    false    201            �           0    0    applications_template_id_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public.applications_template_id_seq OWNED BY public.applications.template_id;
          public          postgres    false    203            �            1259    25308 
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
       public         heap    postgres    false            �            1259    25519    gg_categories    TABLE     <  CREATE TABLE public.gg_categories (
    id integer NOT NULL,
    website_id integer NOT NULL,
    title character varying(50) NOT NULL,
    icon text,
    tag_links text,
    sort integer NOT NULL,
    active boolean DEFAULT true,
    created timestamp without time zone,
    modified timestamp without time zone
);
 !   DROP TABLE public.gg_categories;
       public         heap    postgres    false            �            1259    25515    gg_categories_id_seq    SEQUENCE     �   CREATE SEQUENCE public.gg_categories_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.gg_categories_id_seq;
       public          postgres    false    250            �           0    0    gg_categories_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.gg_categories_id_seq OWNED BY public.gg_categories.id;
          public          postgres    false    248            �            1259    25517    gg_categories_website_id_seq    SEQUENCE     �   CREATE SEQUENCE public.gg_categories_website_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.gg_categories_website_id_seq;
       public          postgres    false    250            �           0    0    gg_categories_website_id_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public.gg_categories_website_id_seq OWNED BY public.gg_categories.website_id;
          public          postgres    false    249            �            1259    25315    gg_main_sliders    TABLE     `  CREATE TABLE public.gg_main_sliders (
    id integer NOT NULL,
    website_id integer NOT NULL,
    image text,
    display character varying(255),
    descriptions text,
    tag_links text,
    sort integer NOT NULL,
    active boolean DEFAULT true,
    created timestamp without time zone,
    modified timestamp without time zone,
    thumb text
);
 #   DROP TABLE public.gg_main_sliders;
       public         heap    postgres    false            �            1259    25322    gg_main_sliders_id_seq    SEQUENCE     �   CREATE SEQUENCE public.gg_main_sliders_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.gg_main_sliders_id_seq;
       public          postgres    false    205            �           0    0    gg_main_sliders_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.gg_main_sliders_id_seq OWNED BY public.gg_main_sliders.id;
          public          postgres    false    206            �            1259    25324    gg_main_sliders_website_id_seq    SEQUENCE     �   CREATE SEQUENCE public.gg_main_sliders_website_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE public.gg_main_sliders_website_id_seq;
       public          postgres    false    205            �           0    0    gg_main_sliders_website_id_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE public.gg_main_sliders_website_id_seq OWNED BY public.gg_main_sliders.website_id;
          public          postgres    false    207            �            1259    25326    groups    TABLE     `  CREATE TABLE public.groups (
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
       public         heap    postgres    false            �            1259    25331    groups_id_seq    SEQUENCE     �   CREATE SEQUENCE public.groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.groups_id_seq;
       public          postgres    false    208            �           0    0    groups_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.groups_id_seq OWNED BY public.groups.id;
          public          postgres    false    209            �            1259    25333    layouts    TABLE       CREATE TABLE public.layouts (
    id integer NOT NULL,
    subpage_id integer NOT NULL,
    component_id integer NOT NULL,
    sort integer NOT NULL,
    active boolean DEFAULT false,
    created timestamp without time zone,
    modified timestamp without time zone
);
    DROP TABLE public.layouts;
       public         heap    postgres    false            �            1259    25337    layouts_component_id_seq    SEQUENCE     �   CREATE SEQUENCE public.layouts_component_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.layouts_component_id_seq;
       public          postgres    false    210            �           0    0    layouts_component_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.layouts_component_id_seq OWNED BY public.layouts.component_id;
          public          postgres    false    211            �            1259    25339    layouts_id_seq    SEQUENCE     �   CREATE SEQUENCE public.layouts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.layouts_id_seq;
       public          postgres    false    210            �           0    0    layouts_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.layouts_id_seq OWNED BY public.layouts.id;
          public          postgres    false    212            �            1259    25341    layouts_subpage_id_seq    SEQUENCE     �   CREATE SEQUENCE public.layouts_subpage_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.layouts_subpage_id_seq;
       public          postgres    false    210            �           0    0    layouts_subpage_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.layouts_subpage_id_seq OWNED BY public.layouts.subpage_id;
          public          postgres    false    213            �            1259    25343    methods    TABLE     �  CREATE TABLE public.methods (
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
       public         heap    postgres    false            �            1259    25348    methods_id_seq    SEQUENCE     �   CREATE SEQUENCE public.methods_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.methods_id_seq;
       public          postgres    false    214            �           0    0    methods_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.methods_id_seq OWNED BY public.methods.id;
          public          postgres    false    215            �            1259    25350    methods_module_id_seq    SEQUENCE     �   CREATE SEQUENCE public.methods_module_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.methods_module_id_seq;
       public          postgres    false    214            �           0    0    methods_module_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.methods_module_id_seq OWNED BY public.methods.module_id;
          public          postgres    false    216            �            1259    25352    modules    TABLE     J  CREATE TABLE public.modules (
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
       public         heap    postgres    false            �            1259    25356    modules_id_seq    SEQUENCE     �   CREATE SEQUENCE public.modules_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.modules_id_seq;
       public          postgres    false    217            �           0    0    modules_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.modules_id_seq OWNED BY public.modules.id;
          public          postgres    false    218            �            1259    25358    pages    TABLE     �  CREATE TABLE public.pages (
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
       public         heap    postgres    false            �            1259    25365    pages_id_seq    SEQUENCE     �   CREATE SEQUENCE public.pages_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.pages_id_seq;
       public          postgres    false    219            �           0    0    pages_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.pages_id_seq OWNED BY public.pages.id;
          public          postgres    false    220            �            1259    25367    pages_website_id_seq    SEQUENCE     �   CREATE SEQUENCE public.pages_website_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.pages_website_id_seq;
       public          postgres    false    219            �           0    0    pages_website_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.pages_website_id_seq OWNED BY public.pages.website_id;
          public          postgres    false    221            �            1259    25369    pclouds    TABLE     '  CREATE TABLE public.pclouds (
    id integer NOT NULL,
    website_id integer NOT NULL,
    email character varying(255) NOT NULL,
    password character varying(255) NOT NULL,
    active boolean DEFAULT true,
    created timestamp without time zone,
    modified timestamp without time zone
);
    DROP TABLE public.pclouds;
       public         heap    postgres    false            �            1259    25376    pclouds_id_seq    SEQUENCE     �   CREATE SEQUENCE public.pclouds_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.pclouds_id_seq;
       public          postgres    false    222            �           0    0    pclouds_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.pclouds_id_seq OWNED BY public.pclouds.id;
          public          postgres    false    223            �            1259    25378    pclouds_website_id_seq    SEQUENCE     �   CREATE SEQUENCE public.pclouds_website_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.pclouds_website_id_seq;
       public          postgres    false    222            �           0    0    pclouds_website_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.pclouds_website_id_seq OWNED BY public.pclouds.website_id;
          public          postgres    false    224            �            1259    25380    permissions    TABLE     �   CREATE TABLE public.permissions (
    id integer NOT NULL,
    role_id integer NOT NULL,
    method_id integer NOT NULL,
    created timestamp without time zone,
    module_id integer NOT NULL
);
    DROP TABLE public.permissions;
       public         heap    postgres    false            �            1259    25383    permissions_id_seq    SEQUENCE     �   CREATE SEQUENCE public.permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.permissions_id_seq;
       public          postgres    false    225            �           0    0    permissions_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.permissions_id_seq OWNED BY public.permissions.id;
          public          postgres    false    226            �            1259    25385    permissions_method_id_seq    SEQUENCE     �   CREATE SEQUENCE public.permissions_method_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.permissions_method_id_seq;
       public          postgres    false    225            �           0    0    permissions_method_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.permissions_method_id_seq OWNED BY public.permissions.method_id;
          public          postgres    false    227            �            1259    25387    permissions_role_id_seq    SEQUENCE     �   CREATE SEQUENCE public.permissions_role_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.permissions_role_id_seq;
       public          postgres    false    225            �           0    0    permissions_role_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.permissions_role_id_seq OWNED BY public.permissions.role_id;
          public          postgres    false    228            �            1259    25389    roles    TABLE        CREATE TABLE public.roles (
    id integer NOT NULL,
    group_id integer NOT NULL,
    name character varying(50) NOT NULL,
    display character varying(180) NOT NULL,
    active boolean DEFAULT true,
    created timestamp without time zone,
    modified timestamp without time zone
);
    DROP TABLE public.roles;
       public         heap    postgres    false            �            1259    25393    roles_group_id_seq    SEQUENCE     �   CREATE SEQUENCE public.roles_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.roles_group_id_seq;
       public          postgres    false    229            �           0    0    roles_group_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.roles_group_id_seq OWNED BY public.roles.group_id;
          public          postgres    false    230            �            1259    25395    roles_id_seq    SEQUENCE     �   CREATE SEQUENCE public.roles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.roles_id_seq;
       public          postgres    false    229            �           0    0    roles_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.roles_id_seq OWNED BY public.roles.id;
          public          postgres    false    231            �            1259    25397    subpages    TABLE     �  CREATE TABLE public.subpages (
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
       public         heap    postgres    false            �            1259    25404    subpages_id_seq    SEQUENCE     �   CREATE SEQUENCE public.subpages_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.subpages_id_seq;
       public          postgres    false    232            �           0    0    subpages_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.subpages_id_seq OWNED BY public.subpages.id;
          public          postgres    false    233            �            1259    25406    subpages_page_id_seq    SEQUENCE     �   CREATE SEQUENCE public.subpages_page_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.subpages_page_id_seq;
       public          postgres    false    232            �           0    0    subpages_page_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.subpages_page_id_seq OWNED BY public.subpages.page_id;
          public          postgres    false    234            �            1259    25408    template_components_id_seq    SEQUENCE     �   CREATE SEQUENCE public.template_components_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.template_components_id_seq;
       public          postgres    false    204            �           0    0    template_components_id_seq    SEQUENCE OWNED BY     P   ALTER SEQUENCE public.template_components_id_seq OWNED BY public.components.id;
          public          postgres    false    235            �            1259    25410 #   template_components_template_id_seq    SEQUENCE     �   CREATE SEQUENCE public.template_components_template_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 :   DROP SEQUENCE public.template_components_template_id_seq;
       public          postgres    false    204            �           0    0 #   template_components_template_id_seq    SEQUENCE OWNED BY     b   ALTER SEQUENCE public.template_components_template_id_seq OWNED BY public.components.template_id;
          public          postgres    false    236            �            1259    25412 	   templates    TABLE       CREATE TABLE public.templates (
    id integer NOT NULL,
    name character varying(180) NOT NULL,
    description text,
    sort integer NOT NULL,
    active boolean DEFAULT false,
    created timestamp without time zone,
    modified timestamp without time zone
);
    DROP TABLE public.templates;
       public         heap    postgres    false            �            1259    25419    templates_id_seq    SEQUENCE     �   CREATE SEQUENCE public.templates_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.templates_id_seq;
       public          postgres    false    237            �           0    0    templates_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.templates_id_seq OWNED BY public.templates.id;
          public          postgres    false    238            �            1259    25421    tokens    TABLE     �   CREATE TABLE public.tokens (
    id integer NOT NULL,
    user_id integer NOT NULL,
    token character varying(255) NOT NULL,
    created timestamp without time zone,
    modified timestamp without time zone
);
    DROP TABLE public.tokens;
       public         heap    postgres    false            �            1259    25424    tokens_id_seq    SEQUENCE     �   CREATE SEQUENCE public.tokens_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.tokens_id_seq;
       public          postgres    false    239            �           0    0    tokens_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.tokens_id_seq OWNED BY public.tokens.id;
          public          postgres    false    240            �            1259    25426    tokens_user_id_seq    SEQUENCE     �   CREATE SEQUENCE public.tokens_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.tokens_user_id_seq;
       public          postgres    false    239            �           0    0    tokens_user_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.tokens_user_id_seq OWNED BY public.tokens.user_id;
          public          postgres    false    241            �            1259    25428    users    TABLE     L  CREATE TABLE public.users (
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
       public         heap    postgres    false            �            1259    25435    users_group_id_seq    SEQUENCE     �   CREATE SEQUENCE public.users_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.users_group_id_seq;
       public          postgres    false    242            �           0    0    users_group_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.users_group_id_seq OWNED BY public.users.group_id;
          public          postgres    false    243            �            1259    25437    users_id_seq    SEQUENCE     �   CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.users_id_seq;
       public          postgres    false    242            �           0    0    users_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;
          public          postgres    false    244            �            1259    25439    websites    TABLE     �  CREATE TABLE public.websites (
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
       public         heap    postgres    false            �            1259    25446    websites_application_id_seq    SEQUENCE     �   CREATE SEQUENCE public.websites_application_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.websites_application_id_seq;
       public          postgres    false    245            �           0    0    websites_application_id_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public.websites_application_id_seq OWNED BY public.websites.application_id;
          public          postgres    false    246            �            1259    25448    websites_id_seq    SEQUENCE     �   CREATE SEQUENCE public.websites_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.websites_id_seq;
       public          postgres    false    245            �           0    0    websites_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.websites_id_seq OWNED BY public.websites.id;
          public          postgres    false    247            �           2604    25450    applications id    DEFAULT     r   ALTER TABLE ONLY public.applications ALTER COLUMN id SET DEFAULT nextval('public.applications_id_seq'::regclass);
 >   ALTER TABLE public.applications ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    202    201            �           2604    25451    applications template_id    DEFAULT     �   ALTER TABLE ONLY public.applications ALTER COLUMN template_id SET DEFAULT nextval('public.applications_template_id_seq'::regclass);
 G   ALTER TABLE public.applications ALTER COLUMN template_id DROP DEFAULT;
       public          postgres    false    203    201            �           2604    25452    components id    DEFAULT     w   ALTER TABLE ONLY public.components ALTER COLUMN id SET DEFAULT nextval('public.template_components_id_seq'::regclass);
 <   ALTER TABLE public.components ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    235    204            �           2604    25453    components template_id    DEFAULT     �   ALTER TABLE ONLY public.components ALTER COLUMN template_id SET DEFAULT nextval('public.template_components_template_id_seq'::regclass);
 E   ALTER TABLE public.components ALTER COLUMN template_id DROP DEFAULT;
       public          postgres    false    236    204            �           2604    25522    gg_categories id    DEFAULT     t   ALTER TABLE ONLY public.gg_categories ALTER COLUMN id SET DEFAULT nextval('public.gg_categories_id_seq'::regclass);
 ?   ALTER TABLE public.gg_categories ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    250    248    250            �           2604    25523    gg_categories website_id    DEFAULT     �   ALTER TABLE ONLY public.gg_categories ALTER COLUMN website_id SET DEFAULT nextval('public.gg_categories_website_id_seq'::regclass);
 G   ALTER TABLE public.gg_categories ALTER COLUMN website_id DROP DEFAULT;
       public          postgres    false    249    250    250            �           2604    25454    gg_main_sliders id    DEFAULT     x   ALTER TABLE ONLY public.gg_main_sliders ALTER COLUMN id SET DEFAULT nextval('public.gg_main_sliders_id_seq'::regclass);
 A   ALTER TABLE public.gg_main_sliders ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    206    205            �           2604    25455    gg_main_sliders website_id    DEFAULT     �   ALTER TABLE ONLY public.gg_main_sliders ALTER COLUMN website_id SET DEFAULT nextval('public.gg_main_sliders_website_id_seq'::regclass);
 I   ALTER TABLE public.gg_main_sliders ALTER COLUMN website_id DROP DEFAULT;
       public          postgres    false    207    205            �           2604    25456 	   groups id    DEFAULT     f   ALTER TABLE ONLY public.groups ALTER COLUMN id SET DEFAULT nextval('public.groups_id_seq'::regclass);
 8   ALTER TABLE public.groups ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    209    208            �           2604    25457 
   layouts id    DEFAULT     h   ALTER TABLE ONLY public.layouts ALTER COLUMN id SET DEFAULT nextval('public.layouts_id_seq'::regclass);
 9   ALTER TABLE public.layouts ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    212    210            �           2604    25458    layouts subpage_id    DEFAULT     x   ALTER TABLE ONLY public.layouts ALTER COLUMN subpage_id SET DEFAULT nextval('public.layouts_subpage_id_seq'::regclass);
 A   ALTER TABLE public.layouts ALTER COLUMN subpage_id DROP DEFAULT;
       public          postgres    false    213    210            �           2604    25459    layouts component_id    DEFAULT     |   ALTER TABLE ONLY public.layouts ALTER COLUMN component_id SET DEFAULT nextval('public.layouts_component_id_seq'::regclass);
 C   ALTER TABLE public.layouts ALTER COLUMN component_id DROP DEFAULT;
       public          postgres    false    211    210            �           2604    25460 
   methods id    DEFAULT     h   ALTER TABLE ONLY public.methods ALTER COLUMN id SET DEFAULT nextval('public.methods_id_seq'::regclass);
 9   ALTER TABLE public.methods ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    215    214            �           2604    25461    methods module_id    DEFAULT     v   ALTER TABLE ONLY public.methods ALTER COLUMN module_id SET DEFAULT nextval('public.methods_module_id_seq'::regclass);
 @   ALTER TABLE public.methods ALTER COLUMN module_id DROP DEFAULT;
       public          postgres    false    216    214            �           2604    25462 
   modules id    DEFAULT     h   ALTER TABLE ONLY public.modules ALTER COLUMN id SET DEFAULT nextval('public.modules_id_seq'::regclass);
 9   ALTER TABLE public.modules ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    218    217            �           2604    25463    pages id    DEFAULT     d   ALTER TABLE ONLY public.pages ALTER COLUMN id SET DEFAULT nextval('public.pages_id_seq'::regclass);
 7   ALTER TABLE public.pages ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    220    219            �           2604    25464    pages website_id    DEFAULT     t   ALTER TABLE ONLY public.pages ALTER COLUMN website_id SET DEFAULT nextval('public.pages_website_id_seq'::regclass);
 ?   ALTER TABLE public.pages ALTER COLUMN website_id DROP DEFAULT;
       public          postgres    false    221    219            �           2604    25465 
   pclouds id    DEFAULT     h   ALTER TABLE ONLY public.pclouds ALTER COLUMN id SET DEFAULT nextval('public.pclouds_id_seq'::regclass);
 9   ALTER TABLE public.pclouds ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    223    222            �           2604    25466    pclouds website_id    DEFAULT     x   ALTER TABLE ONLY public.pclouds ALTER COLUMN website_id SET DEFAULT nextval('public.pclouds_website_id_seq'::regclass);
 A   ALTER TABLE public.pclouds ALTER COLUMN website_id DROP DEFAULT;
       public          postgres    false    224    222            �           2604    25467    permissions id    DEFAULT     p   ALTER TABLE ONLY public.permissions ALTER COLUMN id SET DEFAULT nextval('public.permissions_id_seq'::regclass);
 =   ALTER TABLE public.permissions ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    226    225            �           2604    25468    permissions role_id    DEFAULT     z   ALTER TABLE ONLY public.permissions ALTER COLUMN role_id SET DEFAULT nextval('public.permissions_role_id_seq'::regclass);
 B   ALTER TABLE public.permissions ALTER COLUMN role_id DROP DEFAULT;
       public          postgres    false    228    225            �           2604    25469    permissions method_id    DEFAULT     ~   ALTER TABLE ONLY public.permissions ALTER COLUMN method_id SET DEFAULT nextval('public.permissions_method_id_seq'::regclass);
 D   ALTER TABLE public.permissions ALTER COLUMN method_id DROP DEFAULT;
       public          postgres    false    227    225            �           2604    25470    roles id    DEFAULT     d   ALTER TABLE ONLY public.roles ALTER COLUMN id SET DEFAULT nextval('public.roles_id_seq'::regclass);
 7   ALTER TABLE public.roles ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    231    229            �           2604    25471    roles group_id    DEFAULT     p   ALTER TABLE ONLY public.roles ALTER COLUMN group_id SET DEFAULT nextval('public.roles_group_id_seq'::regclass);
 =   ALTER TABLE public.roles ALTER COLUMN group_id DROP DEFAULT;
       public          postgres    false    230    229            �           2604    25472    subpages id    DEFAULT     j   ALTER TABLE ONLY public.subpages ALTER COLUMN id SET DEFAULT nextval('public.subpages_id_seq'::regclass);
 :   ALTER TABLE public.subpages ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    233    232            �           2604    25473    subpages page_id    DEFAULT     t   ALTER TABLE ONLY public.subpages ALTER COLUMN page_id SET DEFAULT nextval('public.subpages_page_id_seq'::regclass);
 ?   ALTER TABLE public.subpages ALTER COLUMN page_id DROP DEFAULT;
       public          postgres    false    234    232            �           2604    25474    templates id    DEFAULT     l   ALTER TABLE ONLY public.templates ALTER COLUMN id SET DEFAULT nextval('public.templates_id_seq'::regclass);
 ;   ALTER TABLE public.templates ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    238    237            �           2604    25475 	   tokens id    DEFAULT     f   ALTER TABLE ONLY public.tokens ALTER COLUMN id SET DEFAULT nextval('public.tokens_id_seq'::regclass);
 8   ALTER TABLE public.tokens ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    240    239            �           2604    25476    tokens user_id    DEFAULT     p   ALTER TABLE ONLY public.tokens ALTER COLUMN user_id SET DEFAULT nextval('public.tokens_user_id_seq'::regclass);
 =   ALTER TABLE public.tokens ALTER COLUMN user_id DROP DEFAULT;
       public          postgres    false    241    239            �           2604    25477    users id    DEFAULT     d   ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);
 7   ALTER TABLE public.users ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    244    242            �           2604    25478    users group_id    DEFAULT     p   ALTER TABLE ONLY public.users ALTER COLUMN group_id SET DEFAULT nextval('public.users_group_id_seq'::regclass);
 =   ALTER TABLE public.users ALTER COLUMN group_id DROP DEFAULT;
       public          postgres    false    243    242            �           2604    25479    websites id    DEFAULT     j   ALTER TABLE ONLY public.websites ALTER COLUMN id SET DEFAULT nextval('public.websites_id_seq'::regclass);
 :   ALTER TABLE public.websites ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    247    245            �           2604    25480    websites application_id    DEFAULT     �   ALTER TABLE ONLY public.websites ALTER COLUMN application_id SET DEFAULT nextval('public.websites_application_id_seq'::regclass);
 F   ALTER TABLE public.websites ALTER COLUMN application_id DROP DEFAULT;
       public          postgres    false    246    245            �          0    25297    applications 
   TABLE DATA           w   COPY public.applications (id, template_id, name, display, script, active, created, modified, layout, menu) FROM stdin;
    public          postgres    false    201   
�       �          0    25308 
   components 
   TABLE DATA           }   COPY public.components (id, template_id, name, table_name, description, sort, active, created, modified, script) FROM stdin;
    public          postgres    false    204   ��       �          0    25519    gg_categories 
   TABLE DATA           p   COPY public.gg_categories (id, website_id, title, icon, tag_links, sort, active, created, modified) FROM stdin;
    public          postgres    false    250   ��       �          0    25315    gg_main_sliders 
   TABLE DATA           �   COPY public.gg_main_sliders (id, website_id, image, display, descriptions, tag_links, sort, active, created, modified, thumb) FROM stdin;
    public          postgres    false    205   ��       �          0    25326    groups 
   TABLE DATA           l   COPY public.groups (id, name, display, code, active, created, modified, website_id, super_user) FROM stdin;
    public          postgres    false    208   ��       �          0    25333    layouts 
   TABLE DATA           `   COPY public.layouts (id, subpage_id, component_id, sort, active, created, modified) FROM stdin;
    public          postgres    false    210   ��       �          0    25343    methods 
   TABLE DATA           q   COPY public.methods (id, module_id, name, display, symbol, sort, is_menu, active, created, modified) FROM stdin;
    public          postgres    false    214   ��       �          0    25352    modules 
   TABLE DATA           ]   COPY public.modules (id, name, display, symbol, sort, active, created, modified) FROM stdin;
    public          postgres    false    217   �       �          0    25358    pages 
   TABLE DATA           v   COPY public.pages (id, website_id, name, display, tag_links, icon, code, active, created, modified, sort) FROM stdin;
    public          postgres    false    219   a�       �          0    25369    pclouds 
   TABLE DATA           ]   COPY public.pclouds (id, website_id, email, password, active, created, modified) FROM stdin;
    public          postgres    false    222   ��       �          0    25380    permissions 
   TABLE DATA           Q   COPY public.permissions (id, role_id, method_id, created, module_id) FROM stdin;
    public          postgres    false    225   O�       �          0    25389    roles 
   TABLE DATA           W   COPY public.roles (id, group_id, name, display, active, created, modified) FROM stdin;
    public          postgres    false    229   ]�       �          0    25397    subpages 
   TABLE DATA           v   COPY public.subpages (id, page_id, name, display, tag_links, icon, code, active, created, modified, sort) FROM stdin;
    public          postgres    false    232   ;�       �          0    25412 	   templates 
   TABLE DATA           [   COPY public.templates (id, name, description, sort, active, created, modified) FROM stdin;
    public          postgres    false    237   ��       �          0    25421    tokens 
   TABLE DATA           G   COPY public.tokens (id, user_id, token, created, modified) FROM stdin;
    public          postgres    false    239   �       �          0    25428    users 
   TABLE DATA           _   COPY public.users (id, group_id, name, email, password, active, created, modified) FROM stdin;
    public          postgres    false    242   �      �          0    25439    websites 
   TABLE DATA           {   COPY public.websites (id, name, domain, display, code, active, created, modified, template_id, application_id) FROM stdin;
    public          postgres    false    245          �           0    0    applications_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.applications_id_seq', 1, true);
          public          postgres    false    202            �           0    0    applications_template_id_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.applications_template_id_seq', 1, false);
          public          postgres    false    203            �           0    0    gg_categories_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.gg_categories_id_seq', 3, true);
          public          postgres    false    248            �           0    0    gg_categories_website_id_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.gg_categories_website_id_seq', 1, false);
          public          postgres    false    249            �           0    0    gg_main_sliders_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.gg_main_sliders_id_seq', 6, true);
          public          postgres    false    206            �           0    0    gg_main_sliders_website_id_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.gg_main_sliders_website_id_seq', 1, false);
          public          postgres    false    207            �           0    0    groups_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.groups_id_seq', 7, true);
          public          postgres    false    209            �           0    0    layouts_component_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.layouts_component_id_seq', 1, false);
          public          postgres    false    211            �           0    0    layouts_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.layouts_id_seq', 17, true);
          public          postgres    false    212            �           0    0    layouts_subpage_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.layouts_subpage_id_seq', 1, false);
          public          postgres    false    213            �           0    0    methods_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.methods_id_seq', 97, true);
          public          postgres    false    215            �           0    0    methods_module_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.methods_module_id_seq', 1, false);
          public          postgres    false    216            �           0    0    modules_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.modules_id_seq', 21, true);
          public          postgres    false    218            �           0    0    pages_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.pages_id_seq', 3, true);
          public          postgres    false    220            �           0    0    pages_website_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.pages_website_id_seq', 1, false);
          public          postgres    false    221            �           0    0    pclouds_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.pclouds_id_seq', 2, true);
          public          postgres    false    223            �           0    0    pclouds_website_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.pclouds_website_id_seq', 1, false);
          public          postgres    false    224            �           0    0    permissions_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.permissions_id_seq', 2947, true);
          public          postgres    false    226            �           0    0    permissions_method_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.permissions_method_id_seq', 1, false);
          public          postgres    false    227            �           0    0    permissions_role_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.permissions_role_id_seq', 1, false);
          public          postgres    false    228            �           0    0    roles_group_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.roles_group_id_seq', 1, false);
          public          postgres    false    230            �           0    0    roles_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.roles_id_seq', 6, true);
          public          postgres    false    231            �           0    0    subpages_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.subpages_id_seq', 6, true);
          public          postgres    false    233            �           0    0    subpages_page_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.subpages_page_id_seq', 1, true);
          public          postgres    false    234            �           0    0    template_components_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.template_components_id_seq', 15, true);
          public          postgres    false    235                        0    0 #   template_components_template_id_seq    SEQUENCE SET     R   SELECT pg_catalog.setval('public.template_components_template_id_seq', 1, false);
          public          postgres    false    236                       0    0    templates_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.templates_id_seq', 2, true);
          public          postgres    false    238                       0    0    tokens_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.tokens_id_seq', 588, true);
          public          postgres    false    240                       0    0    tokens_user_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.tokens_user_id_seq', 1, false);
          public          postgres    false    241                       0    0    users_group_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.users_group_id_seq', 1, false);
          public          postgres    false    243                       0    0    users_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.users_id_seq', 9, true);
          public          postgres    false    244                       0    0    websites_application_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.websites_application_id_seq', 2, true);
          public          postgres    false    246                       0    0    websites_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.websites_id_seq', 2, true);
          public          postgres    false    247            �           2606    25483    applications applications_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.applications
    ADD CONSTRAINT applications_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.applications DROP CONSTRAINT applications_pkey;
       public            postgres    false    201            
           2606    25529     gg_categories gg_categories_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.gg_categories
    ADD CONSTRAINT gg_categories_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.gg_categories DROP CONSTRAINT gg_categories_pkey;
       public            postgres    false    250            �           2606    25485 $   gg_main_sliders gg_main_sliders_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.gg_main_sliders
    ADD CONSTRAINT gg_main_sliders_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.gg_main_sliders DROP CONSTRAINT gg_main_sliders_pkey;
       public            postgres    false    205            �           2606    25487    groups groups_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.groups
    ADD CONSTRAINT groups_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.groups DROP CONSTRAINT groups_pkey;
       public            postgres    false    208            �           2606    25489    layouts layouts_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.layouts
    ADD CONSTRAINT layouts_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.layouts DROP CONSTRAINT layouts_pkey;
       public            postgres    false    210            �           2606    25491    methods methods_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.methods
    ADD CONSTRAINT methods_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.methods DROP CONSTRAINT methods_pkey;
       public            postgres    false    214            �           2606    25493    modules modules_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.modules
    ADD CONSTRAINT modules_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.modules DROP CONSTRAINT modules_pkey;
       public            postgres    false    217            �           2606    25495    pages pages_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.pages
    ADD CONSTRAINT pages_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.pages DROP CONSTRAINT pages_pkey;
       public            postgres    false    219            �           2606    25497    pclouds pclouds_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.pclouds
    ADD CONSTRAINT pclouds_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.pclouds DROP CONSTRAINT pclouds_pkey;
       public            postgres    false    222            �           2606    25499    permissions permissions_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.permissions DROP CONSTRAINT permissions_pkey;
       public            postgres    false    225            �           2606    25501    roles roles_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.roles DROP CONSTRAINT roles_pkey;
       public            postgres    false    229                        2606    25503    subpages subpages_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.subpages
    ADD CONSTRAINT subpages_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.subpages DROP CONSTRAINT subpages_pkey;
       public            postgres    false    232            �           2606    25505 #   components template_components_pkey 
   CONSTRAINT     a   ALTER TABLE ONLY public.components
    ADD CONSTRAINT template_components_pkey PRIMARY KEY (id);
 M   ALTER TABLE ONLY public.components DROP CONSTRAINT template_components_pkey;
       public            postgres    false    204                       2606    25507    templates templates_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.templates
    ADD CONSTRAINT templates_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.templates DROP CONSTRAINT templates_pkey;
       public            postgres    false    237                       2606    25509    tokens tokens_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.tokens
    ADD CONSTRAINT tokens_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.tokens DROP CONSTRAINT tokens_pkey;
       public            postgres    false    239                       2606    25511    users users_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            postgres    false    242                       2606    25513    websites websites_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.websites
    ADD CONSTRAINT websites_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.websites DROP CONSTRAINT websites_pkey;
       public            postgres    false    245            �   �	  x��Zms�6���
�qG��!َsi\I��͵7si2g��M�ɀ$H�	� ��~�- ��/R,�r��h�&����x���'�O��9gQLd���y�������3���f��Q��t��|T4H�S	�xI9Mi��'��`%�ށHs��L��|i��!��N�\x�5N	˼���aLr|�-�3hnd�R������
�㱷U$
J�9~!"��5�A�%��BxI��ֿ�7
f��퇗���~�HJ멨dae�i>w�̽k����>U�U7�1��|���3���H��e"��Oԓ���c|��BG/�^|��u���2m/�̟������|x��r�\_!N�x��&Z󄒰����%�^�T.�f�b#��1�$gr
s7�<�H����~N����ӣ��WGG߽
��4���d�桂�'��2�TyH��t�)�Uiu�F'b���X*~�=	��+�OI�� ����/0����B(�
���K��m����6�H���d���xQ�<���5S7v>���"O�r�rj�h��J/B��+,�YֹyL���Ē��#�[=y��2Mi�	UMW{�}y�(��i �	A��G�� �nen>s�t����|Qן�� ��'�*��䢦�Μ>s,WH�]V�.�+*EJqTP:��3���J�"lU��ЗS,�ʇ�v�gI�
��YnG�W4P8b
����&E�vc/�P����Y�h8�\Q��#_�^�˘A��
����`�wc=yHvU�j��u�N����U�<�A����`��f6���gS�B ݛi~�����R�����{^0�Xh�Vԩ�wk; үB��nZwc;zw����ܥ�XJ����_2�~3^1�`�h�/�� ����[J2X��I��ۈ3R����-v��(�|��o&�k��b�50R���m\�l�a�wUc��j�8f��o{�$� 
-PD��?�'@�,(@�TxSuaE�t3	�'oJ�L����=!r������=Sc>�G����xi��d69DL�HN'�T�8u8�J�$Ҷi���ܓ͞i�U�9��4|�{�d�%���A���-��
�h��$͞�+iv�h#�V乇4���q�a'����&�1��A�Wn�ɜd�;�IƲ���gC�3�wr6��$2�S%d:�nt��]:���%唦�q�%��oTc����
k
/�^q�E,J�Sx8�k�V�N�vQNG$!3`DV�Rٗ�����
Kh�@�6��%b��vc��R/����ވ泒oy�
�q�0������Ҁ��Y:�4�R�*��Aast�Ë:Հ�S�;�%̗׳��k ?,�m�1i� �tRmhu�i����pȄ_����K��V,T��;~��7�^t����P�d��@l2
�xl���	��R�3��ϫn�~03{�ɿ}�q�c�s_eT����s=�lò�=�z��d�2�ѳ"�L�tl��d1�4F�.�0T}�U5mA��NdotvF�|���f�q͌�X;�Qxm}�m��ğ�69�No|�Ѧ��NcX�h�a�Yu��U��[�w�m����U����q���}¼u�7�xC�o�o�p�����Ӄ|�W7��j�U�6�Z�Y��(>D�f�F�!�4�h����f�7Z]����@V�q`�wP�x-;�?�R����Ӣ-��`�4���ű�W�_��Ŧ]S6l���M|IrnM���Z����{�a�t(��8��Oj��WQ�;��/�u��	��2�i������<X�:�҂��#�"�9W4�"E�EX��̓U��N�;�b�mC�Zt?b0[�N�2:)�|9b�ٿ�g��ٗ  �,�ׅ�A� (	�P@
F0���fO�z,�2l�XKX��&�ig��]�Rt �_��B�J��������I+��r��FS5*N|���'#׏�KP1ɀ �[�c5�Y�05��f >��(ׯ9��=X/X�U��?5 ��?�9~�rP�Rd����6�)U����B*w�Y��*=��f!V�	vy�>R�:�;���}��������r�_�"<�xݰ�]�L���f���!C}4�诏��zL�ϒ���<��5yV@��,���� ��������>~�;�T�1gn���"���d�nw�P��ք�8R��u|�נS��q���d��_�4b��Ed=�\c�~��s^�o�s%�eR��R��6���najt�4�%��w[�z�]�?���C���E����V ��G���ia�25v��T�5+��U��?l>"��Y݂pZ7�\�cj��N�[����)�r�O	�K�t�-
݈�hP�ܦ�˦5Xwg'~ԫԧ�92�+�8�nZ4�ޙ�F����G�X���wۓ��]�����Z��gjv�[�%�u9����c��V���4;���TS�S�KP��wd �YlWA�Do3SW�)}���Ym�?�8}���� U"�      �   �  x��Vms�F���x,�1�z�F��v<�&Ng�N���'q
'�t��{p`$y�N�g��-��>��{��KI:O�D�|s�^*�&IWuMQME��:�M���Bf)�T�V5�P%٤ꗗ��(�0!q}*(��2�� �#[�фiI��L\�5_\gx٢|�wLxd�#�H���)PoS^f�xc[7�t��%y���C�Q���@��T[5Zpƒ<�p�9"%^�����-�	oP�<��Y�K�jU���4�����i�}V�=5U����2l�z��\�~�-���jAG�K�e�h��,��׋w�ç�O��+��e����#u�ʸ�Q����>��dh��\��4�|�c�·a[����uN���j�V��@������ҙ���4uz�JY�X�{��*�̒Y��'��G	�.2�Ә�~���^��Wh���7Z�Q�B2� ����f:۴~��Q��࿚�E� H����)8X�'�L��=6�3�T�|tn(�R1{�~]��@�l�hu�N=�FaS�*W��OFNSD����$��N�C��K�&��;�:� ��_����IO� ��4&�!r�3ƾ���Ë�]qTu��Yi��-��ˢ2U��O��齦5O��aO�I����h�lvY=eq(�M͋��z��8\�ǵ��,�Y"n1z�;c�᳹�즄k���l��9�(H�s�Vy�u��;_/������:�{dd�$t�t�YS+ �=���3f�w�.�H�ʱ��b��c�ܠ�7k�������p�4�9 (x�Ha���گ7$����F�����E��`�5����a�t�}�c<�4�nL�����k����s��g��5y�Yy�B������M;��o�w�	��j�-�Gfkr����QсR7�1�Q���?��-Ŕ�3�6�}�7ٴzA�ZGV��yW{�iE7ѹ�k&xJ����f�Io���.Fsx�7f��d�h����Z
�=� |i�~�T��#!`?JmBy咎�(a̖"?���mt���A|�ݭm����Lt�f���_��	p-w��m�	�҆����TM�(��	�S����M���{C��	��xs�w��{���e���Ѝ<䬾�?���v����]�ᯋ��B�ʴȓy���)F��-S�r4]UC���Ԝ����5K}�	Y�M������� np����/"�	��K�­K��r%�u��� �;{�(����WyݰP��<{#���o�n      �   �   x��л
�0@�9y
�n�n�QA���4�zi#M����.�z��CA�9G�s�VA���o��j2_W�`k�mR�7Ǵ�)��b�	� ���*3�~���(Y�d���#]�6�Ӿ��*�b���sWkb[n����8���"D�C(iCئ�L��S��M���)��_){��I	x�rfϥ�J����劽}6��1�w
�i      �   �  x�ŕMo�6��ʯ�SN�#Y�?TER`���"�P,z���ȍDj�E��;�bt��v�� Q�p8�3/�$K�s����� WﴯW\�W-�������Fv(��<���./�Ez�u�׏�������7[+���s�Gs��Q��E�r���������2`{i�7���i��ٖ	���%�t�-�r�g�n�����el�\�ؾ*�U���47y���f�>�ˋ�m�r��qСj� �tN`�u֠����ӯ޺0A�@CV�u��G`-�j�FS�9
T��,��̂�#�� Ma
���DB�b�Z%I�Z��J��l��P�mY��������{h�Ah��ദjߊE(2���W��c�q���S����{.`��Ʋ;x����MZ�KՆ �$�n�A3SS5Ѡ��"�X�0�0h;F[� 9e��]�hˏ�Z�Eg�2!aI^��Pά��!1�H\uq"��H�p�'��p?XǤ�t���G`��Y�`@��yʾ�Z2����s\P�;�w�E� p\�(�?y4Tb�{J�MFh[���:E���i-_Ӻ�������]�9���)��i�|caDx`�"{{f�~�0��@`�y'��p���$L�����~�Y�Հ]o��a�����0�/�_{Y��dM:6*"_�^!)�)���#I�i�YkF�j=R	�^�$[�V�[I��[G��*������1/ϺXf��S�+��ԏչ#�YM*�L�j��9�<TP��'��<+^V��}���3�z��� ki�w�	>;��[�`fe�ђ�e���_����&���J�'V�v�$�'�-�'�4Y	���%��h�DL��-�����}lcZ���i�aN�x�Mf���G��2�� 5El��8�6�B�;�[��V��C��`���c+�t��Qݢ߭_�] ���9ݞ �>ݝ��_�����9�p�      �   �   x���Mj�0F��)t���?ϮP�	!�t(.Q���AR(�}eG��ɢ����f$���@^����4��� �e����X�̤࠸PL �d�!G*�j<\�ۿ{�ԛ�"�p�҅�xC"��gog��\7��-��b�P�%s��Iߴ��ԝC7�Q�n,�w�C]�v�Y��ef~c��!:�޴��"_Ţ��lZ�>���_�O��c6���>��ܟG5
�Z�9��y4���}�B)�I���      �   a   x�m���0C��,P�oK2ct�r@�*˗�ؖң02U��m��!�aG��8X~Kj��j��b@Z��XE�G4��$��xG�g#�Y18w � �$�      �     x��Y]��F}��+о�e�%�6iUJ�UҴ/}!��E�q>��{/60�Y�KY�>ٜ�̹_3L�4��-��(��&��^��\=�E<��~Eo^���x��}�&B�W�\qp�(�p��@���YѰ��r���ky�E	���?�7y������|&��TC���������.�w�
�y:U��?VP�T���R�h����ۉ�wS	���}X�Xls�(�� B��6�0	����c��G���C��.�Qe�M>�m<"���^샶Ix�C�H#l"'�Op�Wr���0���Ή�y��ND����0�<1˝�a}p��Wp�w�I��(p%'�D��1{t�c�(#b�d<F�e>�$�|��v�-��}���	�i=b %���ȿ���%p��"���}��WM��G~��Uh��:�P7FH����K�~F>����)v͎}h_.`&1mx�#�a�'��#�>r�%ڇ��]�9���8}������#h�`��(ه�u����aX��u�6��j�����V����oZ<8����W<�1i�� ԭ����L����c��|=�ѓf�=�U"B�C���tk����%�i�o7U��C"��}��/-���h�q��q�dz�vWWu�۹�A^ZH{3��1y)'��LZ`g�x��ml��¥*>��Ho$�w6�����۩�HB�ܘ=��]^?�]Q��P3e��&�������/|�K#��/,Ȉ�h�p�^�s��M�|���y��d>IK��(��xy�rN��!jʘdJ2�sg��A��2�&��@)�?4tl�C�T��@iRX658�Z�0P�T|��y�S����@Y���>���g���!7m�U��|(��G׃�՛M��(��}y�G���a�Ă��L`���� �Q0OQx��(���e~q9Q��2'{�a $*���������R� WBP3��C��q�eHb���U���ڱ���YK
��c��K��gx����_��v��y�qU��#	2�Ї���r��96�gr*��&0�_�=�/}��MƇN�������o�g�&�KY��w���os�}�ڍW�%O�u��S��ȍ�`�v�|w�r3"�=*���
.�!��w�>`*�2���C8���@[�8�қ�i[�yy�qћ�:�f+I��d��P�6]y��@5��$�+v�F��D����	c�����>�ݶ~�	槄%Oݲ:``"RY�32aA�>LL��|n���a`C�_�s˥&�CXN��}���L�0�X�����j?'�55{-G�<``%i�v�cr�ڀ�Uľ��˙��&�.��p�=���_�r�''k ,f�e��/����_�K��:�Ḫ��q�Υ��BK��cU��6nG�.��ϖN":����yb\ٮhf܄;G��)�
M;�RY���o��M�n��J��ז?�O�ϪIv7AZ��Ȳ�|y��{_��ǁ�FD�ԧYt����}59� �$�K��D�OT�m�A�Hԗo�*��R>"M��%�E��'��H�0�0�����x�+��Ӧ��|��W�SRh1|S>� ��6��Lr�GD���.����~����R	}�!�/���T>bj�쾮��m��w�&�w�kȠnZ%E���	=� ���m�t}�^0<w$"�aKҚkS�a+b�k=��r�A��n�9\B�0��/�5�ON bK�x��>��bK_�t@�!o^��0�Q�������� ����f�      �   E  x���M��0��ү{w�ї�](���fK/�x5+p�Բ��gĆ��H���>�f4�Gpe������4�O~W�ћK����:j�O���"����@1�U����'�+�Q�T�UYԧp�n����m�b쯁j�.�u�B;�!�1!�
n	�r���]�V�C;�!�1aa�莐�И<����9�f�]��;,�l\y�!�"��#���/��3U�sN�r�3f� 0�c�28ٺ]]���)z�}�b��t�c��) ��^��й���f<��i9�Q��OYڸw�����:��Mj$�*h�J-(H�,��"wy���s�J3�HEA�o��xg�˾�j�T�Y��(h��_Ogk�l������ZLi���-j���<���}��!��(�ׂzvj���X+�@�>�4�,��ɔF!!�O������"���e���H+��)��V������V�Z�fɮ������n�̔F�YfE��r+gxǽ�&�yۢk�eƍ|K1�|-������̜��%��<�y���K�@��ʖ�E��5����>L�>�(�������R�w�      �   |   x�u�1
�@k�����Sl����MkH�H�����$`�fXv���1C_P��7	G�(�<���SO�M>Y��CAM��ߋ�d��ڝw( ?�0NT�l��F�΢䟶�e��?{�.�      �   R   x�3�4�,�/���K,J,�/M�pH�M���K������+�L7����,�4202�50�54S04�24�20C36�22����� p�       �   �  x�}�ۑ�8�)+ց� ހlY��8dacB���w!"�Ɇ8˺ڕ�|��uׯ�������+?f�7�1NwK�y�Ҳii��+�5-7�����;�_����ʞ�G��F�?޿��Lu�{�q��^�1.W�vnp��;��~��o�-�����x�xm�B��V�8q6����ć�ײ��L�M�%�k��u_����(��V�gp|uٸ[Z7�FHw^3�}�Rl����7�]/|%���H�-c~uq�%_q�_q��� �9ޒ���1����K�,��K�0��6�?q���'���?����/����߇��4���p�e�Gٯ/�g��_��O����W�q��G\m|5�_�_�~���8����=�v ��?`{� ���	��+PpX��Ћ�oR��3ʒ6�Y�_��u�����g�8���-a8�,��;�q����̳�%|0В��:	���˟��.~����s��|}�������~����τ�/���S)�q��|���}���W�q��G\������a}���˟�q����ҁ��_p����8��_��v ��ߠ� K�Q_��B_��a�{85��� [�̻�؂]����؂](��ܤ�l�6�dT�l��N ��7�	�h��Ԏ�N �=0Y	`�&	$L�����(0��
`��h0��
�d�ZL�@����V �#0�	`r&	dL�����I09�
`rL����\A-��DM���(��3� &g �@��D)���Z09�m*����2�V@&�
`r�o�\�g�D �+�0�����&p7y�\��	��_�wˍ'}@��a�M��������{	���w˝ ��æ�r� �����
�z�f*���;s.�(
�����~ ���U^? �ċ���*o�~r�Mu�+8o<b��f���b���ŉ#.��58�^��?��y����o��썻��_�|׋9�w/���a}�Uo_\}��y��_���/����/{����?<�x?��+ޏ8�j|�	����k֗?�d���~�����<��W|���W��:og=���Y7c�κ���g��q؃�
��ؽ��b�]rh�MN ��{<D�`��Ϙ�I�ݷ�	`r�^:�	}3� &G`����#0� &G`RL�����I09�S
&g�M��br?AWWLΠX
`r�R@S%�I4W�b)���d���e0���� &���	`ryQ;������?@&��      �   �   x�m�ϊ1���S�*M������-��AF�.�ݩ���:J�[�|��'�~lBO�Rd\ 㒡�h�XYi*Ӕ/�V-�~8�����??�磥���R�=�V4s�(��]��%vC�¶��uUh��`�եs���C�.V�}N�F>���
�|�l(7�}-���M~u��c�4wb7N�6M	Scc��cd� ��4�s      �   �   x�m�1�0Eg��@��8@�qN�"�C���I�
��������,��L���G��s�m !aG�D>XP�v�cT��(p�����cGmC{ӼO����'F_����u�͋�����[��T��l
��%e��e��_��><      �   �   x�m�A
�0 ��+�ULl,���k/[]K 6!Y����IJo��}=.�²zv�c���(�{/p�	ưDb�n#_`	r���C��݈~/�1��rv��x�\%X�F���V��Y�������Vj1<`�̸&��8�>o4�m�֨N>k)��A�      �   "  x���]o�@���W�`��sqP�"�MA�q�p��¯/M������\̛3g�'9��C\�Z �Fԥ�,�:׭Cb��g��t����n�IM�@Lu"�����X��#��M���D&l���%��(�z*uOG��ab��N��F/%��w�CNO# 
@y X�P�⭌Gq�{��+fw�Bv�vv����/q_�ȓ摕��;l�~h���� 'F�`
��$���v��f�'�Ƅ�����/~�2Z����P5�4�oe<ReN��d��d/:>�\�?&aХ��nu�$�qD�mʀ�HH���*n����ɰat���lh4y^ёTf��\}�1֠r+�!��{m֟mZ�u�O���Φ�'m�c$��q!U9�1��H�?�@�/Ң)�숪^Y@=���Pҭ����{�������n���i2?=�s�aX_�'Ś����Ŗ�?�hƦY��b���S44�oe=�©�2���jm���8��>��Q�}lәd'v^2o�@�؅�zD����Z4i���V�g[xW���&�[�s���TLc�      �   Z  x�m�Kw�0@��Wt�-�Dޫ*ŷbED<sΜ(hy�_?hg��%7�:��4����у^q���+��7Y��9y��&�}4�k��ho<�fL
T��06�V�h
0D2%7_���ڔ�1�	0�HJ�p��[E>����?	�w?l��xP�ѩK�^jvyb(�l���j�d͹��]:w�l����"�2�*����$ ����Z�N���#=���	�Ѩ�]M��,�;����C0'��|����-��P֝����T^�g�`�*\%$  ?���O+6�2J�D��q7�(�^�7�kkR�����y^�|�Y�'��I��'7-dSl[T�[�87�o9�E�TT�[y��79/K┲I�Q/��}���J�,ε�T+�1�)B���CXYc�]�C��Nr�D�*��M�?�P�<�1�J*�j�g =���u�S�ͳ;ï3n��!߾��L��T��-��y̝^*�O�h�ha��E��(�����*(F=����bHT~��7S�~t�w�>��FJuĻe�U��l�9�����mܚ[V�%�E��R�Q)��%��ʹ���/�r��_&�X��?�
2�c�+�      �   �   x�3���K���,��-J-.I,-J�+�,//׃�#����s9=��
A�A�%�FF��&���
V��VFX�b����aojqA~��!T�\u���<]��l3�22�20�����+� ��20�B�=... W�C�     