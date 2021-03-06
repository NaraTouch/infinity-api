PGDMP     	                    y            infinity-database    13.2    13.2 O               0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    16394    infinity-database    DATABASE     w   CREATE DATABASE "infinity-database" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'English_United States.1252';
 #   DROP DATABASE "infinity-database";
                postgres    false                        3079    16447 	   uuid-ossp 	   EXTENSION     ?   CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA public;
    DROP EXTENSION "uuid-ossp";
                   false                       0    0    EXTENSION "uuid-ossp"    COMMENT     W   COMMENT ON EXTENSION "uuid-ossp" IS 'generate universally unique identifiers (UUIDs)';
                        false    2            ?            1259    24756    groups    TABLE     "  CREATE TABLE public.groups (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    display character varying(180) NOT NULL,
    code character varying(10),
    active boolean DEFAULT true,
    created timestamp without time zone,
    modified timestamp without time zone
);
    DROP TABLE public.groups;
       public         heap    postgres    false            ?            1259    24760    groups_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.groups_id_seq;
       public          postgres    false    201                       0    0    groups_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.groups_id_seq OWNED BY public.groups.id;
          public          postgres    false    202            ?            1259    24762    methods    TABLE     ?  CREATE TABLE public.methods (
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
       public         heap    postgres    false            ?            1259    24767    methods_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.methods_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.methods_id_seq;
       public          postgres    false    203                       0    0    methods_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.methods_id_seq OWNED BY public.methods.id;
          public          postgres    false    204            ?            1259    24769    methods_module_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.methods_module_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.methods_module_id_seq;
       public          postgres    false    203                       0    0    methods_module_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.methods_module_id_seq OWNED BY public.methods.module_id;
          public          postgres    false    205            ?            1259    24771    modules    TABLE     J  CREATE TABLE public.modules (
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
       public         heap    postgres    false            ?            1259    24775    modules_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.modules_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.modules_id_seq;
       public          postgres    false    206                       0    0    modules_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.modules_id_seq OWNED BY public.modules.id;
          public          postgres    false    207            ?            1259    24777    permissions    TABLE     ?   CREATE TABLE public.permissions (
    id integer NOT NULL,
    role_id integer NOT NULL,
    method_id integer NOT NULL,
    created timestamp without time zone
);
    DROP TABLE public.permissions;
       public         heap    postgres    false            ?            1259    24780    permissions_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.permissions_id_seq;
       public          postgres    false    208                        0    0    permissions_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.permissions_id_seq OWNED BY public.permissions.id;
          public          postgres    false    209            ?            1259    24782    permissions_method_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.permissions_method_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.permissions_method_id_seq;
       public          postgres    false    208            !           0    0    permissions_method_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.permissions_method_id_seq OWNED BY public.permissions.method_id;
          public          postgres    false    210            ?            1259    24784    permissions_role_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.permissions_role_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.permissions_role_id_seq;
       public          postgres    false    208            "           0    0    permissions_role_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.permissions_role_id_seq OWNED BY public.permissions.role_id;
          public          postgres    false    211            ?            1259    24786    roles    TABLE        CREATE TABLE public.roles (
    id integer NOT NULL,
    group_id integer NOT NULL,
    name character varying(50) NOT NULL,
    display character varying(180) NOT NULL,
    active boolean DEFAULT true,
    created timestamp without time zone,
    modified timestamp without time zone
);
    DROP TABLE public.roles;
       public         heap    postgres    false            ?            1259    24790    roles_group_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.roles_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.roles_group_id_seq;
       public          postgres    false    212            #           0    0    roles_group_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.roles_group_id_seq OWNED BY public.roles.group_id;
          public          postgres    false    213            ?            1259    24792    roles_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.roles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.roles_id_seq;
       public          postgres    false    212            $           0    0    roles_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.roles_id_seq OWNED BY public.roles.id;
          public          postgres    false    214            ?            1259    24794    tokens    TABLE     ?   CREATE TABLE public.tokens (
    id integer NOT NULL,
    user_id integer NOT NULL,
    token character varying(255) NOT NULL,
    created timestamp without time zone,
    modified timestamp without time zone
);
    DROP TABLE public.tokens;
       public         heap    postgres    false            ?            1259    24797    tokens_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.tokens_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.tokens_id_seq;
       public          postgres    false    215            %           0    0    tokens_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.tokens_id_seq OWNED BY public.tokens.id;
          public          postgres    false    216            ?            1259    24799    tokens_user_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.tokens_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.tokens_user_id_seq;
       public          postgres    false    215            &           0    0    tokens_user_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.tokens_user_id_seq OWNED BY public.tokens.user_id;
          public          postgres    false    217            ?            1259    24801    users    TABLE     L  CREATE TABLE public.users (
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
       public         heap    postgres    false            ?            1259    24808    users_group_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.users_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.users_group_id_seq;
       public          postgres    false    218            '           0    0    users_group_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.users_group_id_seq OWNED BY public.users.group_id;
          public          postgres    false    219            ?            1259    24810    users_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.users_id_seq;
       public          postgres    false    218            (           0    0    users_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;
          public          postgres    false    220            _           2604    24812 	   groups id    DEFAULT     f   ALTER TABLE ONLY public.groups ALTER COLUMN id SET DEFAULT nextval('public.groups_id_seq'::regclass);
 8   ALTER TABLE public.groups ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    202    201            b           2604    24813 
   methods id    DEFAULT     h   ALTER TABLE ONLY public.methods ALTER COLUMN id SET DEFAULT nextval('public.methods_id_seq'::regclass);
 9   ALTER TABLE public.methods ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    204    203            c           2604    24814    methods module_id    DEFAULT     v   ALTER TABLE ONLY public.methods ALTER COLUMN module_id SET DEFAULT nextval('public.methods_module_id_seq'::regclass);
 @   ALTER TABLE public.methods ALTER COLUMN module_id DROP DEFAULT;
       public          postgres    false    205    203            e           2604    24815 
   modules id    DEFAULT     h   ALTER TABLE ONLY public.modules ALTER COLUMN id SET DEFAULT nextval('public.modules_id_seq'::regclass);
 9   ALTER TABLE public.modules ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    207    206            f           2604    24816    permissions id    DEFAULT     p   ALTER TABLE ONLY public.permissions ALTER COLUMN id SET DEFAULT nextval('public.permissions_id_seq'::regclass);
 =   ALTER TABLE public.permissions ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    209    208            g           2604    24817    permissions role_id    DEFAULT     z   ALTER TABLE ONLY public.permissions ALTER COLUMN role_id SET DEFAULT nextval('public.permissions_role_id_seq'::regclass);
 B   ALTER TABLE public.permissions ALTER COLUMN role_id DROP DEFAULT;
       public          postgres    false    211    208            h           2604    24818    permissions method_id    DEFAULT     ~   ALTER TABLE ONLY public.permissions ALTER COLUMN method_id SET DEFAULT nextval('public.permissions_method_id_seq'::regclass);
 D   ALTER TABLE public.permissions ALTER COLUMN method_id DROP DEFAULT;
       public          postgres    false    210    208            j           2604    24819    roles id    DEFAULT     d   ALTER TABLE ONLY public.roles ALTER COLUMN id SET DEFAULT nextval('public.roles_id_seq'::regclass);
 7   ALTER TABLE public.roles ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    214    212            k           2604    24820    roles group_id    DEFAULT     p   ALTER TABLE ONLY public.roles ALTER COLUMN group_id SET DEFAULT nextval('public.roles_group_id_seq'::regclass);
 =   ALTER TABLE public.roles ALTER COLUMN group_id DROP DEFAULT;
       public          postgres    false    213    212            l           2604    24821 	   tokens id    DEFAULT     f   ALTER TABLE ONLY public.tokens ALTER COLUMN id SET DEFAULT nextval('public.tokens_id_seq'::regclass);
 8   ALTER TABLE public.tokens ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    216    215            m           2604    24822    tokens user_id    DEFAULT     p   ALTER TABLE ONLY public.tokens ALTER COLUMN user_id SET DEFAULT nextval('public.tokens_user_id_seq'::regclass);
 =   ALTER TABLE public.tokens ALTER COLUMN user_id DROP DEFAULT;
       public          postgres    false    217    215            o           2604    24823    users id    DEFAULT     d   ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);
 7   ALTER TABLE public.users ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    220    218            p           2604    24824    users group_id    DEFAULT     p   ALTER TABLE ONLY public.users ALTER COLUMN group_id SET DEFAULT nextval('public.users_group_id_seq'::regclass);
 =   ALTER TABLE public.users ALTER COLUMN group_id DROP DEFAULT;
       public          postgres    false    219    218                      0    24756    groups 
   TABLE DATA           T   COPY public.groups (id, name, display, code, active, created, modified) FROM stdin;
    public          postgres    false    201   ?V                 0    24762    methods 
   TABLE DATA           q   COPY public.methods (id, module_id, name, display, symbol, sort, is_menu, active, created, modified) FROM stdin;
    public          postgres    false    203   ?V                 0    24771    modules 
   TABLE DATA           ]   COPY public.modules (id, name, display, symbol, sort, active, created, modified) FROM stdin;
    public          postgres    false    206   2Z                 0    24777    permissions 
   TABLE DATA           F   COPY public.permissions (id, role_id, method_id, created) FROM stdin;
    public          postgres    false    208   n[                 0    24786    roles 
   TABLE DATA           W   COPY public.roles (id, group_id, name, display, active, created, modified) FROM stdin;
    public          postgres    false    212   N\                 0    24794    tokens 
   TABLE DATA           G   COPY public.tokens (id, user_id, token, created, modified) FROM stdin;
    public          postgres    false    215   ?\                 0    24801    users 
   TABLE DATA           _   COPY public.users (id, group_id, name, email, password, active, created, modified) FROM stdin;
    public          postgres    false    218   ?]       )           0    0    groups_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.groups_id_seq', 3, true);
          public          postgres    false    202            *           0    0    methods_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.methods_id_seq', 41, true);
          public          postgres    false    204            +           0    0    methods_module_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.methods_module_id_seq', 1, false);
          public          postgres    false    205            ,           0    0    modules_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.modules_id_seq', 10, true);
          public          postgres    false    207            -           0    0    permissions_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.permissions_id_seq', 171, true);
          public          postgres    false    209            .           0    0    permissions_method_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.permissions_method_id_seq', 1, false);
          public          postgres    false    210            /           0    0    permissions_role_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.permissions_role_id_seq', 1, false);
          public          postgres    false    211            0           0    0    roles_group_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.roles_group_id_seq', 1, false);
          public          postgres    false    213            1           0    0    roles_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.roles_id_seq', 2, true);
          public          postgres    false    214            2           0    0    tokens_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.tokens_id_seq', 165, true);
          public          postgres    false    216            3           0    0    tokens_user_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.tokens_user_id_seq', 1, false);
          public          postgres    false    217            4           0    0    users_group_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.users_group_id_seq', 1, false);
          public          postgres    false    219            5           0    0    users_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.users_id_seq', 5, true);
          public          postgres    false    220            r           2606    24826    groups groups_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.groups
    ADD CONSTRAINT groups_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.groups DROP CONSTRAINT groups_pkey;
       public            postgres    false    201            t           2606    24828    methods methods_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.methods
    ADD CONSTRAINT methods_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.methods DROP CONSTRAINT methods_pkey;
       public            postgres    false    203            v           2606    24830    modules modules_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.modules
    ADD CONSTRAINT modules_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.modules DROP CONSTRAINT modules_pkey;
       public            postgres    false    206            x           2606    24832    permissions permissions_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.permissions DROP CONSTRAINT permissions_pkey;
       public            postgres    false    208            z           2606    24834    roles roles_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.roles DROP CONSTRAINT roles_pkey;
       public            postgres    false    212            |           2606    24836    tokens tokens_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.tokens
    ADD CONSTRAINT tokens_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.tokens DROP CONSTRAINT tokens_pkey;
       public            postgres    false    215            ~           2606    24838    users users_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            postgres    false    218               G   x?3?t?O?????N#C]s]#c3+S+clb\F??)??y?? 2???(?$?*F?)1z\\\ W{?         I  x???]o?0??}~?}6?Ň?U?ֵ7?TUʮ&!??@dk????\??\??O???~}?qa$Nr????YdqU}?HE>[?i??u?????????
??$5a.?3?Ϩp?TB*Jm$?$??Jn??幈?q*5*?r}???IZ???1&>??B?a|??????t????m???ixJ?C???~???.??????P\(1?"P???3?)ܕ?v3?oD???1?Qb?a
?`6F?n?t?+lB??%N?2ɀ?D?]x(?m?O?Az? ?QN?A?????0?ß?_????Q?LN???6T????_?d??b???'?t'?@?_Àz?N`?6?0?>
?ɉP?~ajЀ?{'??Ib&??%???)?UL????d?`"?1`????f?g?8	?>ܦ?v?<^u{?:I|͖???.??????r???Lwr?]?v?q?Hd????O?#f.5r?b??I?\a??]?hS?RW?{]?? ????fm?oӴÀ8??{Ѳ?]?Mtnw??o?gd.^?L(?Nz(?(u|??e?u?_Ӫ?ȏ????¶? /}yӂ??(_?<^??Ԍ??A?????#??9D????H,???q:ޣ:???n?????B?S??p?{?'??/|8#??w?x?????a?9?O??_????a?))???????i.???H?7?S2)4E?SL???8>????s?? ?EHV??6?\?U?y????ɝ???#v??9?7???MA?W????9ċV?h[f??u3t?8<m??W`c?M3?v&?????Y????m??*??X?9?o??9??F????/ ?f??         ,  x????K?0??/E?=??k?N???(??m?k3???7Ѻ?5????Gy_????????1Y}??X??v???&ku7?X???{?=0?(&S?Q??PB???T??e+???9??읙[??EƎ???wv8yx?K??y?K1$???p?vc\bsC?????5????&Ƹ? ??R?b(g??_????S??:?P????۪???=?j?_\dmc????3??֣*???S?$?Bq?$C%??k???v^&?mOq?L????0%x?!J??zp?7a`o?????k?-?)?>?B??V?8         ?   x?u???0E?5T???>??Z???:w}G???Ev?Ç?{?{?׸?'??????-??n	m?f?.???"L?!;
?޷??n4???$@??1X#ec?F??c?c@??	0??	8?)?I?M
?@}JȀ}???Uf????S?W?,?r????V_X?ڒ?_Iȁ????=KB?%!???P BI(???s????P?_??9??W?Í         B   x?3?4?L?O?/??I?t?OQ1J8??u?uMͬ?,???b?
V&FV&\1z\\\ Y?B         ?   x????n?@?3<?/?fV?F6D??@,?cb¢?m?m)<}??IåǙ?$p???Kz|?Lf䓂?Y
Y?s??q3 ?F??h??h????\-?'??+4K?Ȳ?3??w9rl?ϝx?E?W7??˃?Y??N??L??D4???????C ?%?O()??u6pς?????3K??K̈9.??P?ƫ?j?n?????#nh???9\Z^???~}?	B?B??u?~j??7?Ii?            x?m??n?@F??St????JYiX??U,J?4??"?A??}դ?M?}9?s?D?]?cT3ƻ낦????p	?y?j?y?Vզ????	??x?ڄ7,???eSF$;?6󓙲G??!???~65?T?GLP??֔??eT????n?W??????#?N ?w?>}???????&??2?)?a????2??w;-Pr??*?*Ě??????7?ElnO?Ef?kU??s$?u?$??J?Nz?[?Y@?Qm?>ݑyR:??h??B?Ԍ??3L??%????mX     