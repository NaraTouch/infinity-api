PGDMP         )                y            infinity-database    12.3    12.3 O    q           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            r           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            s           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            t           1262    33103    infinity-database    DATABASE     ?   CREATE DATABASE "infinity-database" WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'English_United States.1252' LC_CTYPE = 'English_United States.1252';
 #   DROP DATABASE "infinity-database";
                postgres    false                        3079    33104 	   uuid-ossp 	   EXTENSION     ?   CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA public;
    DROP EXTENSION "uuid-ossp";
                   false            u           0    0    EXTENSION "uuid-ossp"    COMMENT     W   COMMENT ON EXTENSION "uuid-ossp" IS 'generate universally unique identifiers (UUIDs)';
                        false    2            ?            1259    33159    groups    TABLE     "  CREATE TABLE public.groups (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    display character varying(180) NOT NULL,
    code character varying(10),
    active boolean DEFAULT true,
    created timestamp without time zone,
    modified timestamp without time zone
);
    DROP TABLE public.groups;
       public         heap    postgres    false            ?            1259    33163    groups_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.groups_id_seq;
       public          postgres    false    203            v           0    0    groups_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.groups_id_seq OWNED BY public.groups.id;
          public          postgres    false    204            ?            1259    33165    methods    TABLE     ?  CREATE TABLE public.methods (
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
       public         heap    postgres    false            ?            1259    33173    methods_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.methods_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.methods_id_seq;
       public          postgres    false    205            w           0    0    methods_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.methods_id_seq OWNED BY public.methods.id;
          public          postgres    false    206            ?            1259    33175    methods_module_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.methods_module_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.methods_module_id_seq;
       public          postgres    false    205            x           0    0    methods_module_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.methods_module_id_seq OWNED BY public.methods.module_id;
          public          postgres    false    207            ?            1259    33177    modules    TABLE     J  CREATE TABLE public.modules (
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
       public         heap    postgres    false            ?            1259    33181    modules_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.modules_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.modules_id_seq;
       public          postgres    false    208            y           0    0    modules_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.modules_id_seq OWNED BY public.modules.id;
          public          postgres    false    209            ?            1259    33185    permissions    TABLE     ?   CREATE TABLE public.permissions (
    id integer NOT NULL,
    role_id integer NOT NULL,
    method_id integer NOT NULL,
    created timestamp without time zone
);
    DROP TABLE public.permissions;
       public         heap    postgres    false            ?            1259    33188    permissions_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.permissions_id_seq;
       public          postgres    false    210            z           0    0    permissions_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.permissions_id_seq OWNED BY public.permissions.id;
          public          postgres    false    211            ?            1259    33190    permissions_method_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.permissions_method_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.permissions_method_id_seq;
       public          postgres    false    210            {           0    0    permissions_method_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.permissions_method_id_seq OWNED BY public.permissions.method_id;
          public          postgres    false    212            ?            1259    33192    permissions_role_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.permissions_role_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.permissions_role_id_seq;
       public          postgres    false    210            |           0    0    permissions_role_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.permissions_role_id_seq OWNED BY public.permissions.role_id;
          public          postgres    false    213            ?            1259    33194    roles    TABLE        CREATE TABLE public.roles (
    id integer NOT NULL,
    group_id integer NOT NULL,
    name character varying(50) NOT NULL,
    display character varying(180) NOT NULL,
    active boolean DEFAULT true,
    created timestamp without time zone,
    modified timestamp without time zone
);
    DROP TABLE public.roles;
       public         heap    postgres    false            ?            1259    33198    roles_group_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.roles_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.roles_group_id_seq;
       public          postgres    false    214            }           0    0    roles_group_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.roles_group_id_seq OWNED BY public.roles.group_id;
          public          postgres    false    215            ?            1259    33200    roles_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.roles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.roles_id_seq;
       public          postgres    false    214            ~           0    0    roles_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.roles_id_seq OWNED BY public.roles.id;
          public          postgres    false    216            ?            1259    33202    tokens    TABLE     ?   CREATE TABLE public.tokens (
    id integer NOT NULL,
    user_id integer NOT NULL,
    token character varying(255) NOT NULL,
    created timestamp without time zone,
    modified timestamp without time zone
);
    DROP TABLE public.tokens;
       public         heap    postgres    false            ?            1259    33205    tokens_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.tokens_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.tokens_id_seq;
       public          postgres    false    217                       0    0    tokens_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.tokens_id_seq OWNED BY public.tokens.id;
          public          postgres    false    218            ?            1259    33207    tokens_user_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.tokens_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.tokens_user_id_seq;
       public          postgres    false    217            ?           0    0    tokens_user_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.tokens_user_id_seq OWNED BY public.tokens.user_id;
          public          postgres    false    219            ?            1259    33209    users    TABLE     L  CREATE TABLE public.users (
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
       public         heap    postgres    false            ?            1259    33216    users_group_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.users_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.users_group_id_seq;
       public          postgres    false    220            ?           0    0    users_group_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.users_group_id_seq OWNED BY public.users.group_id;
          public          postgres    false    221            ?            1259    33218    users_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.users_id_seq;
       public          postgres    false    220            ?           0    0    users_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;
          public          postgres    false    222            ?
           2604    33220 	   groups id    DEFAULT     f   ALTER TABLE ONLY public.groups ALTER COLUMN id SET DEFAULT nextval('public.groups_id_seq'::regclass);
 8   ALTER TABLE public.groups ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    204    203            ?
           2604    33221 
   methods id    DEFAULT     h   ALTER TABLE ONLY public.methods ALTER COLUMN id SET DEFAULT nextval('public.methods_id_seq'::regclass);
 9   ALTER TABLE public.methods ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    206    205            ?
           2604    33222    methods module_id    DEFAULT     v   ALTER TABLE ONLY public.methods ALTER COLUMN module_id SET DEFAULT nextval('public.methods_module_id_seq'::regclass);
 @   ALTER TABLE public.methods ALTER COLUMN module_id DROP DEFAULT;
       public          postgres    false    207    205            ?
           2604    33223 
   modules id    DEFAULT     h   ALTER TABLE ONLY public.modules ALTER COLUMN id SET DEFAULT nextval('public.modules_id_seq'::regclass);
 9   ALTER TABLE public.modules ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    209    208            ?
           2604    33225    permissions id    DEFAULT     p   ALTER TABLE ONLY public.permissions ALTER COLUMN id SET DEFAULT nextval('public.permissions_id_seq'::regclass);
 =   ALTER TABLE public.permissions ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    211    210            ?
           2604    33226    permissions role_id    DEFAULT     z   ALTER TABLE ONLY public.permissions ALTER COLUMN role_id SET DEFAULT nextval('public.permissions_role_id_seq'::regclass);
 B   ALTER TABLE public.permissions ALTER COLUMN role_id DROP DEFAULT;
       public          postgres    false    213    210            ?
           2604    33227    permissions method_id    DEFAULT     ~   ALTER TABLE ONLY public.permissions ALTER COLUMN method_id SET DEFAULT nextval('public.permissions_method_id_seq'::regclass);
 D   ALTER TABLE public.permissions ALTER COLUMN method_id DROP DEFAULT;
       public          postgres    false    212    210            ?
           2604    33228    roles id    DEFAULT     d   ALTER TABLE ONLY public.roles ALTER COLUMN id SET DEFAULT nextval('public.roles_id_seq'::regclass);
 7   ALTER TABLE public.roles ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    216    214            ?
           2604    33229    roles group_id    DEFAULT     p   ALTER TABLE ONLY public.roles ALTER COLUMN group_id SET DEFAULT nextval('public.roles_group_id_seq'::regclass);
 =   ALTER TABLE public.roles ALTER COLUMN group_id DROP DEFAULT;
       public          postgres    false    215    214            ?
           2604    33230 	   tokens id    DEFAULT     f   ALTER TABLE ONLY public.tokens ALTER COLUMN id SET DEFAULT nextval('public.tokens_id_seq'::regclass);
 8   ALTER TABLE public.tokens ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    218    217            ?
           2604    33231    tokens user_id    DEFAULT     p   ALTER TABLE ONLY public.tokens ALTER COLUMN user_id SET DEFAULT nextval('public.tokens_user_id_seq'::regclass);
 =   ALTER TABLE public.tokens ALTER COLUMN user_id DROP DEFAULT;
       public          postgres    false    219    217            ?
           2604    33232    users id    DEFAULT     d   ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);
 7   ALTER TABLE public.users ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    222    220            ?
           2604    33233    users group_id    DEFAULT     p   ALTER TABLE ONLY public.users ALTER COLUMN group_id SET DEFAULT nextval('public.users_group_id_seq'::regclass);
 =   ALTER TABLE public.users ALTER COLUMN group_id DROP DEFAULT;
       public          postgres    false    221    220            [          0    33159    groups 
   TABLE DATA           T   COPY public.groups (id, name, display, code, active, created, modified) FROM stdin;
    public          postgres    false    203   ?V       ]          0    33165    methods 
   TABLE DATA           q   COPY public.methods (id, module_id, name, display, symbol, sort, is_menu, active, created, modified) FROM stdin;
    public          postgres    false    205   W       `          0    33177    modules 
   TABLE DATA           ]   COPY public.modules (id, name, display, symbol, sort, active, created, modified) FROM stdin;
    public          postgres    false    208   ?X       b          0    33185    permissions 
   TABLE DATA           F   COPY public.permissions (id, role_id, method_id, created) FROM stdin;
    public          postgres    false    210   sY       f          0    33194    roles 
   TABLE DATA           W   COPY public.roles (id, group_id, name, display, active, created, modified) FROM stdin;
    public          postgres    false    214   ?Y       i          0    33202    tokens 
   TABLE DATA           G   COPY public.tokens (id, user_id, token, created, modified) FROM stdin;
    public          postgres    false    217   ?Y       l          0    33209    users 
   TABLE DATA           _   COPY public.users (id, group_id, name, email, password, active, created, modified) FROM stdin;
    public          postgres    false    220   ?Z       ?           0    0    groups_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.groups_id_seq', 3, true);
          public          postgres    false    204            ?           0    0    methods_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.methods_id_seq', 21, true);
          public          postgres    false    206            ?           0    0    methods_module_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.methods_module_id_seq', 1, false);
          public          postgres    false    207            ?           0    0    modules_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.modules_id_seq', 7, true);
          public          postgres    false    209            ?           0    0    permissions_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.permissions_id_seq', 1, false);
          public          postgres    false    211            ?           0    0    permissions_method_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.permissions_method_id_seq', 1, false);
          public          postgres    false    212            ?           0    0    permissions_role_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.permissions_role_id_seq', 1, false);
          public          postgres    false    213            ?           0    0    roles_group_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.roles_group_id_seq', 1, false);
          public          postgres    false    215            ?           0    0    roles_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.roles_id_seq', 2, true);
          public          postgres    false    216            ?           0    0    tokens_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.tokens_id_seq', 118, true);
          public          postgres    false    218            ?           0    0    tokens_user_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.tokens_user_id_seq', 1, false);
          public          postgres    false    219            ?           0    0    users_group_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.users_group_id_seq', 1, false);
          public          postgres    false    221            ?           0    0    users_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.users_id_seq', 5, true);
          public          postgres    false    222            ?
           2606    33235    groups groups_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.groups
    ADD CONSTRAINT groups_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.groups DROP CONSTRAINT groups_pkey;
       public            postgres    false    203            ?
           2606    33237    methods methods_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.methods
    ADD CONSTRAINT methods_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.methods DROP CONSTRAINT methods_pkey;
       public            postgres    false    205            ?
           2606    33239    modules modules_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.modules
    ADD CONSTRAINT modules_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.modules DROP CONSTRAINT modules_pkey;
       public            postgres    false    208            ?
           2606    33241    permissions permissions_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.permissions DROP CONSTRAINT permissions_pkey;
       public            postgres    false    210            ?
           2606    33243    roles roles_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.roles DROP CONSTRAINT roles_pkey;
       public            postgres    false    214            ?
           2606    33245    tokens tokens_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.tokens
    ADD CONSTRAINT tokens_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.tokens DROP CONSTRAINT tokens_pkey;
       public            postgres    false    217            ?
           2606    33247    users users_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            postgres    false    220            [   G   x?3?t?O?????N#C]s]#c3+S+clb\F??)??y?? 2???(?$?*F?)1z\\\ W{?      ]   ?  x???MO?0?ϝ_??;??'4?&&k<y1???꒬?6??; ^h?r ?2o??)?	VV??cWo?????????dm]m>?????????????g?̸?PmP;?b??f?՗??Cٝޚ?]???????I??Uݳ?ᴤ?????a}???~?Ͼ???{Y??b??"̐?S?^:?v???/?tI9??
\?N#Z?o?c?\????"
?:??RD??T8%br???Ys?U?AA??Ѭi?<dZ r?'OMu=??k?&20?a???u|?ad??ʯ ?:?`??V2a??1???3??SS%?ȝ?d`@sb?M?1??Fh??
&hx?&?R?J&
'??? sf'?M?D4?1XPD??8wB??}??a,?????*??????? ~ ???      `   ?   x?????0?继 ?(--j?L&N.&n.hhԴ???ځ???7?ߕ???up??BG϶r?????FU2?T?&?3.??.?? 4?$I????PA?`<?0Y??a*+?????j?B>5rbȠ?f|98?bM??sAi?!??ȱU.s?10߰????0?N??Ük?7D?Cw`?t?լ????<???A?7??      b      x?????? ? ?      f   <   x?3?4?L?O?/??I?t?OQ1J8??u?uMͬ?,????Č?b\1z\\\ Y?F      i   ?   x????N?0?k?? ??n?n?ci???
11?`Z?:Cd??;o7^??s?`??N3r?????7????N?fv?$????T̤o?c6Ǌ2"????'?-$?j?]wU?{????N?X﾿????a?Ur?̃ݴ?º??y?Җ?"?%;??|p??|$?0?sX9?_?v?,af?????5??fm?"??t)uD?????f???p!,???݇??u?i???&k?      l      x?m??n?@F??St????JYiX??U,J?4??"?A??}դ?M?}9?s?D?]?cT3ƻ낦????p	?y?j?y?Vզ????	??x?ڄ7,???eSF$;?6󓙲G??!???~65?T?GLP??֔??eT????n?W??????#?N ?w?>}???????&??2?)?a????2??w;-Pr??*?*Ě??????7?ElnO?Ef?kU??s$?u?$??J?Nz?[?Y@?Qm?>ݑyR:??h??B?Ԍ??3L??%????mX     