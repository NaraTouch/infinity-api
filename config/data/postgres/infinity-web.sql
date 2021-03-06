PGDMP     !    -                y            infinity-database    13.2    13.2 S               0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    16394    infinity-database    DATABASE     w   CREATE DATABASE "infinity-database" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'English_United States.1252';
 #   DROP DATABASE "infinity-database";
                postgres    false                        3079    16447 	   uuid-ossp 	   EXTENSION     ?   CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA public;
    DROP EXTENSION "uuid-ossp";
                   false                        0    0    EXTENSION "uuid-ossp"    COMMENT     W   COMMENT ON EXTENSION "uuid-ossp" IS 'generate universally unique identifiers (UUIDs)';
                        false    2            ?            1259    24675    groups    TABLE     +  CREATE TABLE public.groups (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    display character varying(180) NOT NULL,
    code character varying(10) NOT NULL,
    active boolean DEFAULT true,
    created timestamp without time zone,
    modified timestamp without time zone
);
    DROP TABLE public.groups;
       public         heap    postgres    false            ?            1259    24673    groups_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.groups_id_seq;
       public          postgres    false    205            !           0    0    groups_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.groups_id_seq OWNED BY public.groups.id;
          public          postgres    false    204            ?            1259    24725    methods    TABLE     ?  CREATE TABLE public.methods (
    id integer NOT NULL,
    module_id integer NOT NULL,
    name character varying(50) NOT NULL,
    display character varying(180) NOT NULL,
    symbol character varying(180) NOT NULL,
    controller_name character varying(180) NOT NULL,
    sort integer NOT NULL,
    is_menu boolean DEFAULT false,
    active boolean DEFAULT true,
    created timestamp without time zone,
    modified timestamp without time zone
);
    DROP TABLE public.methods;
       public         heap    postgres    false            ?            1259    24721    methods_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.methods_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.methods_id_seq;
       public          postgres    false    217            "           0    0    methods_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.methods_id_seq OWNED BY public.methods.id;
          public          postgres    false    215            ?            1259    24723    methods_module_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.methods_module_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.methods_module_id_seq;
       public          postgres    false    217            #           0    0    methods_module_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.methods_module_id_seq OWNED BY public.methods.module_id;
          public          postgres    false    216            ?            1259    24709    modules    TABLE     j  CREATE TABLE public.modules (
    id integer NOT NULL,
    parent_id integer NOT NULL,
    name character varying(50) NOT NULL,
    display character varying(180) NOT NULL,
    symbol character varying(180) NOT NULL,
    sort integer NOT NULL,
    active boolean DEFAULT true,
    created timestamp without time zone,
    modified timestamp without time zone
);
    DROP TABLE public.modules;
       public         heap    postgres    false            ?            1259    24705    modules_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.modules_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.modules_id_seq;
       public          postgres    false    214            $           0    0    modules_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.modules_id_seq OWNED BY public.modules.id;
          public          postgres    false    212            ?            1259    24707    modules_parent_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.modules_parent_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.modules_parent_id_seq;
       public          postgres    false    214            %           0    0    modules_parent_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.modules_parent_id_seq OWNED BY public.modules.parent_id;
          public          postgres    false    213            ?            1259    24744    permissions    TABLE     ?   CREATE TABLE public.permissions (
    id integer NOT NULL,
    role_id integer NOT NULL,
    method_id integer NOT NULL,
    created timestamp without time zone
);
    DROP TABLE public.permissions;
       public         heap    postgres    false            ?            1259    24738    permissions_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.permissions_id_seq;
       public          postgres    false    221            &           0    0    permissions_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.permissions_id_seq OWNED BY public.permissions.id;
          public          postgres    false    218            ?            1259    24742    permissions_method_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.permissions_method_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.permissions_method_id_seq;
       public          postgres    false    221            '           0    0    permissions_method_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.permissions_method_id_seq OWNED BY public.permissions.method_id;
          public          postgres    false    220            ?            1259    24740    permissions_role_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.permissions_role_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.permissions_role_id_seq;
       public          postgres    false    221            (           0    0    permissions_role_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.permissions_role_id_seq OWNED BY public.permissions.role_id;
          public          postgres    false    219            ?            1259    24697    roles    TABLE        CREATE TABLE public.roles (
    id integer NOT NULL,
    group_id integer NOT NULL,
    name character varying(50) NOT NULL,
    display character varying(180) NOT NULL,
    active boolean DEFAULT true,
    created timestamp without time zone,
    modified timestamp without time zone
);
    DROP TABLE public.roles;
       public         heap    postgres    false            ?            1259    24695    roles_group_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.roles_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.roles_group_id_seq;
       public          postgres    false    211            )           0    0    roles_group_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.roles_group_id_seq OWNED BY public.roles.group_id;
          public          postgres    false    210            ?            1259    24693    roles_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.roles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.roles_id_seq;
       public          postgres    false    211            *           0    0    roles_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.roles_id_seq OWNED BY public.roles.id;
          public          postgres    false    209            ?            1259    24686    tokens    TABLE     ?   CREATE TABLE public.tokens (
    id integer NOT NULL,
    user_id integer NOT NULL,
    token character varying(255) NOT NULL,
    created timestamp without time zone,
    modified timestamp without time zone
);
    DROP TABLE public.tokens;
       public         heap    postgres    false            ?            1259    24682    tokens_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.tokens_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.tokens_id_seq;
       public          postgres    false    208            +           0    0    tokens_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.tokens_id_seq OWNED BY public.tokens.id;
          public          postgres    false    206            ?            1259    24684    tokens_user_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.tokens_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.tokens_user_id_seq;
       public          postgres    false    208            ,           0    0    tokens_user_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.tokens_user_id_seq OWNED BY public.tokens.user_id;
          public          postgres    false    207            ?            1259    24660    users    TABLE     L  CREATE TABLE public.users (
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
       public         heap    postgres    false            ?            1259    24658    users_group_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.users_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.users_group_id_seq;
       public          postgres    false    203            -           0    0    users_group_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.users_group_id_seq OWNED BY public.users.group_id;
          public          postgres    false    202            ?            1259    24656    users_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.users_id_seq;
       public          postgres    false    203            .           0    0    users_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;
          public          postgres    false    201            d           2604    24678 	   groups id    DEFAULT     f   ALTER TABLE ONLY public.groups ALTER COLUMN id SET DEFAULT nextval('public.groups_id_seq'::regclass);
 8   ALTER TABLE public.groups ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    205    204    205            n           2604    24728 
   methods id    DEFAULT     h   ALTER TABLE ONLY public.methods ALTER COLUMN id SET DEFAULT nextval('public.methods_id_seq'::regclass);
 9   ALTER TABLE public.methods ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    215    217    217            o           2604    24729    methods module_id    DEFAULT     v   ALTER TABLE ONLY public.methods ALTER COLUMN module_id SET DEFAULT nextval('public.methods_module_id_seq'::regclass);
 @   ALTER TABLE public.methods ALTER COLUMN module_id DROP DEFAULT;
       public          postgres    false    216    217    217            k           2604    24712 
   modules id    DEFAULT     h   ALTER TABLE ONLY public.modules ALTER COLUMN id SET DEFAULT nextval('public.modules_id_seq'::regclass);
 9   ALTER TABLE public.modules ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    214    212    214            l           2604    24713    modules parent_id    DEFAULT     v   ALTER TABLE ONLY public.modules ALTER COLUMN parent_id SET DEFAULT nextval('public.modules_parent_id_seq'::regclass);
 @   ALTER TABLE public.modules ALTER COLUMN parent_id DROP DEFAULT;
       public          postgres    false    213    214    214            r           2604    24747    permissions id    DEFAULT     p   ALTER TABLE ONLY public.permissions ALTER COLUMN id SET DEFAULT nextval('public.permissions_id_seq'::regclass);
 =   ALTER TABLE public.permissions ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    221    218    221            s           2604    24748    permissions role_id    DEFAULT     z   ALTER TABLE ONLY public.permissions ALTER COLUMN role_id SET DEFAULT nextval('public.permissions_role_id_seq'::regclass);
 B   ALTER TABLE public.permissions ALTER COLUMN role_id DROP DEFAULT;
       public          postgres    false    219    221    221            t           2604    24749    permissions method_id    DEFAULT     ~   ALTER TABLE ONLY public.permissions ALTER COLUMN method_id SET DEFAULT nextval('public.permissions_method_id_seq'::regclass);
 D   ALTER TABLE public.permissions ALTER COLUMN method_id DROP DEFAULT;
       public          postgres    false    220    221    221            h           2604    24700    roles id    DEFAULT     d   ALTER TABLE ONLY public.roles ALTER COLUMN id SET DEFAULT nextval('public.roles_id_seq'::regclass);
 7   ALTER TABLE public.roles ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    211    209    211            i           2604    24701    roles group_id    DEFAULT     p   ALTER TABLE ONLY public.roles ALTER COLUMN group_id SET DEFAULT nextval('public.roles_group_id_seq'::regclass);
 =   ALTER TABLE public.roles ALTER COLUMN group_id DROP DEFAULT;
       public          postgres    false    210    211    211            f           2604    24689 	   tokens id    DEFAULT     f   ALTER TABLE ONLY public.tokens ALTER COLUMN id SET DEFAULT nextval('public.tokens_id_seq'::regclass);
 8   ALTER TABLE public.tokens ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    208    206    208            g           2604    24690    tokens user_id    DEFAULT     p   ALTER TABLE ONLY public.tokens ALTER COLUMN user_id SET DEFAULT nextval('public.tokens_user_id_seq'::regclass);
 =   ALTER TABLE public.tokens ALTER COLUMN user_id DROP DEFAULT;
       public          postgres    false    208    207    208            a           2604    24663    users id    DEFAULT     d   ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);
 7   ALTER TABLE public.users ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    203    201    203            b           2604    24664    users group_id    DEFAULT     p   ALTER TABLE ONLY public.users ALTER COLUMN group_id SET DEFAULT nextval('public.users_group_id_seq'::regclass);
 =   ALTER TABLE public.users ALTER COLUMN group_id DROP DEFAULT;
       public          postgres    false    202    203    203            	          0    24675    groups 
   TABLE DATA           T   COPY public.groups (id, name, display, code, active, created, modified) FROM stdin;
    public          postgres    false    205   ?[                 0    24725    methods 
   TABLE DATA           ?   COPY public.methods (id, module_id, name, display, symbol, controller_name, sort, is_menu, active, created, modified) FROM stdin;
    public          postgres    false    217   .\                 0    24709    modules 
   TABLE DATA           h   COPY public.modules (id, parent_id, name, display, symbol, sort, active, created, modified) FROM stdin;
    public          postgres    false    214   K\                 0    24744    permissions 
   TABLE DATA           F   COPY public.permissions (id, role_id, method_id, created) FROM stdin;
    public          postgres    false    221   h\                 0    24697    roles 
   TABLE DATA           W   COPY public.roles (id, group_id, name, display, active, created, modified) FROM stdin;
    public          postgres    false    211   ?\                 0    24686    tokens 
   TABLE DATA           G   COPY public.tokens (id, user_id, token, created, modified) FROM stdin;
    public          postgres    false    208   ?\                 0    24660    users 
   TABLE DATA           _   COPY public.users (id, group_id, name, email, password, active, created, modified) FROM stdin;
    public          postgres    false    203   X]       /           0    0    groups_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.groups_id_seq', 2, true);
          public          postgres    false    204            0           0    0    methods_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.methods_id_seq', 1, false);
          public          postgres    false    215            1           0    0    methods_module_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.methods_module_id_seq', 1, false);
          public          postgres    false    216            2           0    0    modules_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.modules_id_seq', 1, false);
          public          postgres    false    212            3           0    0    modules_parent_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.modules_parent_id_seq', 1, false);
          public          postgres    false    213            4           0    0    permissions_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.permissions_id_seq', 1, false);
          public          postgres    false    218            5           0    0    permissions_method_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.permissions_method_id_seq', 1, false);
          public          postgres    false    220            6           0    0    permissions_role_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.permissions_role_id_seq', 1, false);
          public          postgres    false    219            7           0    0    roles_group_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.roles_group_id_seq', 1, false);
          public          postgres    false    210            8           0    0    roles_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.roles_id_seq', 1, false);
          public          postgres    false    209            9           0    0    tokens_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.tokens_id_seq', 94, true);
          public          postgres    false    206            :           0    0    tokens_user_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.tokens_user_id_seq', 1, false);
          public          postgres    false    207            ;           0    0    users_group_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.users_group_id_seq', 1, false);
          public          postgres    false    202            <           0    0    users_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.users_id_seq', 1, true);
          public          postgres    false    201            x           2606    24681    groups groups_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.groups
    ADD CONSTRAINT groups_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.groups DROP CONSTRAINT groups_pkey;
       public            postgres    false    205            ?           2606    24736    methods methods_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.methods
    ADD CONSTRAINT methods_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.methods DROP CONSTRAINT methods_pkey;
       public            postgres    false    217            ~           2606    24716    modules modules_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.modules
    ADD CONSTRAINT modules_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.modules DROP CONSTRAINT modules_pkey;
       public            postgres    false    214            ?           2606    24751    permissions permissions_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.permissions DROP CONSTRAINT permissions_pkey;
       public            postgres    false    221            |           2606    24704    roles roles_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.roles DROP CONSTRAINT roles_pkey;
       public            postgres    false    211            z           2606    24692    tokens tokens_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.tokens
    ADD CONSTRAINT tokens_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.tokens DROP CONSTRAINT tokens_pkey;
       public            postgres    false    208            v           2606    24670    users users_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            postgres    false    203            	   G   x?3?t?O?????N#C]s]#c3+S+clb\F??)??y?? 2???(?$?*F?)1z\\\ W{?            x?????? ? ?            x?????? ? ?            x?????? ? ?            x?????? ? ?         ?   x?m?I?0  ??~ B??F??Ve)KL?,?"x?(?׋w?3?1??z?j?X???????0}v?c	]NMe?D?5??t??N?Nn???.??`?egY@??>^??M(?<??6?bj??+a"???\?]?????????U]??J?l?j?\ ?T5?         z   x?3?4?t+JM?,??/qH?M???+?I?T1?T14Pы?L.??q?,-(Hw6623/?H?t3,)?O35????O,3̮?J???O?/?,?420??50?52V00?21?2??&????? Wy$     