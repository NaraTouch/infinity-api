PGDMP     5                    y            infinity-database    13.2    13.2 V    $           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            %           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            &           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            '           1262    16394    infinity-database    DATABASE     w   CREATE DATABASE "infinity-database" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'English_United States.1252';
 #   DROP DATABASE "infinity-database";
                postgres    false                        3079    16447 	   uuid-ossp 	   EXTENSION     ?   CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA public;
    DROP EXTENSION "uuid-ossp";
                   false            (           0    0    EXTENSION "uuid-ossp"    COMMENT     W   COMMENT ON EXTENSION "uuid-ossp" IS 'generate universally unique identifiers (UUIDs)';
                        false    2            ?            1259    24756    groups    TABLE     :  CREATE TABLE public.groups (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    display character varying(180) NOT NULL,
    code character varying(10),
    active boolean DEFAULT true,
    created timestamp without time zone,
    modified timestamp without time zone,
    website_id integer
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
       public          postgres    false    201            )           0    0    groups_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.groups_id_seq OWNED BY public.groups.id;
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
       public          postgres    false    203            *           0    0    methods_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.methods_id_seq OWNED BY public.methods.id;
          public          postgres    false    204            ?            1259    24769    methods_module_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.methods_module_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.methods_module_id_seq;
       public          postgres    false    203            +           0    0    methods_module_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.methods_module_id_seq OWNED BY public.methods.module_id;
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
       public          postgres    false    206            ,           0    0    modules_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.modules_id_seq OWNED BY public.modules.id;
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
       public          postgres    false    208            -           0    0    permissions_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.permissions_id_seq OWNED BY public.permissions.id;
          public          postgres    false    209            ?            1259    24782    permissions_method_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.permissions_method_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.permissions_method_id_seq;
       public          postgres    false    208            .           0    0    permissions_method_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.permissions_method_id_seq OWNED BY public.permissions.method_id;
          public          postgres    false    210            ?            1259    24784    permissions_role_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.permissions_role_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.permissions_role_id_seq;
       public          postgres    false    208            /           0    0    permissions_role_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.permissions_role_id_seq OWNED BY public.permissions.role_id;
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
       public          postgres    false    212            0           0    0    roles_group_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.roles_group_id_seq OWNED BY public.roles.group_id;
          public          postgres    false    213            ?            1259    24792    roles_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.roles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.roles_id_seq;
       public          postgres    false    212            1           0    0    roles_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.roles_id_seq OWNED BY public.roles.id;
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
       public          postgres    false    215            2           0    0    tokens_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.tokens_id_seq OWNED BY public.tokens.id;
          public          postgres    false    216            ?            1259    24799    tokens_user_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.tokens_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.tokens_user_id_seq;
       public          postgres    false    215            3           0    0    tokens_user_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.tokens_user_id_seq OWNED BY public.tokens.user_id;
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
       public          postgres    false    218            4           0    0    users_group_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.users_group_id_seq OWNED BY public.users.group_id;
          public          postgres    false    219            ?            1259    24810    users_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.users_id_seq;
       public          postgres    false    218            5           0    0    users_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;
          public          postgres    false    220            ?            1259    24842    websites    TABLE     Q  CREATE TABLE public.websites (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    domain character varying(255) NOT NULL,
    display character varying(180) NOT NULL,
    code character(10) NOT NULL,
    active boolean DEFAULT true,
    created timestamp without time zone,
    modified timestamp without time zone
);
    DROP TABLE public.websites;
       public         heap    postgres    false            ?            1259    24840    websites_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.websites_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.websites_id_seq;
       public          postgres    false    222            6           0    0    websites_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.websites_id_seq OWNED BY public.websites.id;
          public          postgres    false    221            f           2604    24812 	   groups id    DEFAULT     f   ALTER TABLE ONLY public.groups ALTER COLUMN id SET DEFAULT nextval('public.groups_id_seq'::regclass);
 8   ALTER TABLE public.groups ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    202    201            i           2604    24813 
   methods id    DEFAULT     h   ALTER TABLE ONLY public.methods ALTER COLUMN id SET DEFAULT nextval('public.methods_id_seq'::regclass);
 9   ALTER TABLE public.methods ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    204    203            j           2604    24814    methods module_id    DEFAULT     v   ALTER TABLE ONLY public.methods ALTER COLUMN module_id SET DEFAULT nextval('public.methods_module_id_seq'::regclass);
 @   ALTER TABLE public.methods ALTER COLUMN module_id DROP DEFAULT;
       public          postgres    false    205    203            l           2604    24815 
   modules id    DEFAULT     h   ALTER TABLE ONLY public.modules ALTER COLUMN id SET DEFAULT nextval('public.modules_id_seq'::regclass);
 9   ALTER TABLE public.modules ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    207    206            m           2604    24816    permissions id    DEFAULT     p   ALTER TABLE ONLY public.permissions ALTER COLUMN id SET DEFAULT nextval('public.permissions_id_seq'::regclass);
 =   ALTER TABLE public.permissions ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    209    208            n           2604    24817    permissions role_id    DEFAULT     z   ALTER TABLE ONLY public.permissions ALTER COLUMN role_id SET DEFAULT nextval('public.permissions_role_id_seq'::regclass);
 B   ALTER TABLE public.permissions ALTER COLUMN role_id DROP DEFAULT;
       public          postgres    false    211    208            o           2604    24818    permissions method_id    DEFAULT     ~   ALTER TABLE ONLY public.permissions ALTER COLUMN method_id SET DEFAULT nextval('public.permissions_method_id_seq'::regclass);
 D   ALTER TABLE public.permissions ALTER COLUMN method_id DROP DEFAULT;
       public          postgres    false    210    208            q           2604    24819    roles id    DEFAULT     d   ALTER TABLE ONLY public.roles ALTER COLUMN id SET DEFAULT nextval('public.roles_id_seq'::regclass);
 7   ALTER TABLE public.roles ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    214    212            r           2604    24820    roles group_id    DEFAULT     p   ALTER TABLE ONLY public.roles ALTER COLUMN group_id SET DEFAULT nextval('public.roles_group_id_seq'::regclass);
 =   ALTER TABLE public.roles ALTER COLUMN group_id DROP DEFAULT;
       public          postgres    false    213    212            s           2604    24821 	   tokens id    DEFAULT     f   ALTER TABLE ONLY public.tokens ALTER COLUMN id SET DEFAULT nextval('public.tokens_id_seq'::regclass);
 8   ALTER TABLE public.tokens ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    216    215            t           2604    24822    tokens user_id    DEFAULT     p   ALTER TABLE ONLY public.tokens ALTER COLUMN user_id SET DEFAULT nextval('public.tokens_user_id_seq'::regclass);
 =   ALTER TABLE public.tokens ALTER COLUMN user_id DROP DEFAULT;
       public          postgres    false    217    215            v           2604    24823    users id    DEFAULT     d   ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);
 7   ALTER TABLE public.users ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    220    218            w           2604    24824    users group_id    DEFAULT     p   ALTER TABLE ONLY public.users ALTER COLUMN group_id SET DEFAULT nextval('public.users_group_id_seq'::regclass);
 =   ALTER TABLE public.users ALTER COLUMN group_id DROP DEFAULT;
       public          postgres    false    219    218            x           2604    24845    websites id    DEFAULT     j   ALTER TABLE ONLY public.websites ALTER COLUMN id SET DEFAULT nextval('public.websites_id_seq'::regclass);
 :   ALTER TABLE public.websites ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    221    222    222                      0    24756    groups 
   TABLE DATA           `   COPY public.groups (id, name, display, code, active, created, modified, website_id) FROM stdin;
    public          postgres    false    201   ?^                 0    24762    methods 
   TABLE DATA           q   COPY public.methods (id, module_id, name, display, symbol, sort, is_menu, active, created, modified) FROM stdin;
    public          postgres    false    203   9_                 0    24771    modules 
   TABLE DATA           ]   COPY public.modules (id, name, display, symbol, sort, active, created, modified) FROM stdin;
    public          postgres    false    206   ?b                 0    24777    permissions 
   TABLE DATA           F   COPY public.permissions (id, role_id, method_id, created) FROM stdin;
    public          postgres    false    208   ?c                 0    24786    roles 
   TABLE DATA           W   COPY public.roles (id, group_id, name, display, active, created, modified) FROM stdin;
    public          postgres    false    212   ?d                 0    24794    tokens 
   TABLE DATA           G   COPY public.tokens (id, user_id, token, created, modified) FROM stdin;
    public          postgres    false    215   ?d                 0    24801    users 
   TABLE DATA           _   COPY public.users (id, group_id, name, email, password, active, created, modified) FROM stdin;
    public          postgres    false    218   ?e       !          0    24842    websites 
   TABLE DATA           ^   COPY public.websites (id, name, domain, display, code, active, created, modified) FROM stdin;
    public          postgres    false    222    g       7           0    0    groups_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.groups_id_seq', 3, true);
          public          postgres    false    202            8           0    0    methods_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.methods_id_seq', 41, true);
          public          postgres    false    204            9           0    0    methods_module_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.methods_module_id_seq', 1, false);
          public          postgres    false    205            :           0    0    modules_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.modules_id_seq', 10, true);
          public          postgres    false    207            ;           0    0    permissions_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.permissions_id_seq', 246, true);
          public          postgres    false    209            <           0    0    permissions_method_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.permissions_method_id_seq', 1, false);
          public          postgres    false    210            =           0    0    permissions_role_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.permissions_role_id_seq', 1, false);
          public          postgres    false    211            >           0    0    roles_group_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.roles_group_id_seq', 1, false);
          public          postgres    false    213            ?           0    0    roles_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.roles_id_seq', 2, true);
          public          postgres    false    214            @           0    0    tokens_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.tokens_id_seq', 178, true);
          public          postgres    false    216            A           0    0    tokens_user_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.tokens_user_id_seq', 1, false);
          public          postgres    false    217            B           0    0    users_group_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.users_group_id_seq', 1, false);
          public          postgres    false    219            C           0    0    users_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.users_id_seq', 5, true);
          public          postgres    false    220            D           0    0    websites_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.websites_id_seq', 1, false);
          public          postgres    false    221            {           2606    24826    groups groups_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.groups
    ADD CONSTRAINT groups_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.groups DROP CONSTRAINT groups_pkey;
       public            postgres    false    201            }           2606    24828    methods methods_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.methods
    ADD CONSTRAINT methods_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.methods DROP CONSTRAINT methods_pkey;
       public            postgres    false    203                       2606    24830    modules modules_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.modules
    ADD CONSTRAINT modules_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.modules DROP CONSTRAINT modules_pkey;
       public            postgres    false    206            ?           2606    24832    permissions permissions_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.permissions DROP CONSTRAINT permissions_pkey;
       public            postgres    false    208            ?           2606    24834    roles roles_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.roles DROP CONSTRAINT roles_pkey;
       public            postgres    false    212            ?           2606    24836    tokens tokens_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.tokens
    ADD CONSTRAINT tokens_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.tokens DROP CONSTRAINT tokens_pkey;
       public            postgres    false    215            ?           2606    24838    users users_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            postgres    false    218            ?           2606    24851    websites websites_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.websites
    ADD CONSTRAINT websites_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.websites DROP CONSTRAINT websites_pkey;
       public            postgres    false    222               I   x?3?t?O?????N#C]s]#c3+S+c?b1~\F??)??y?? 2???(?$?*F?A1z\\\ ? A         <  x???_O?0ş}???{??_?X	6@?`BH?i/Q??Hi??????uZ?&6?4}hhN???}r?'?dyN??uZ?i?5ͷ?bZ-'?????.?'?????kq?ߞ?????I$&LR??T????o??%???+1Դa	H??mi[K~???Ð!FlT?3D83R,s?B[7C£?|C?>A!??VI? ???u???!???h??B$?sj$i??}|?*2?i???qbV8????N??ʟK{x*@?X&jt*1?0?N???A$Fx?w0??#%?ઇ4`??oI????G$??f?4?:??'?"	i?b??BX??"9X??#%?1lL?L?d??}5?"R???,EĸbE?ː?~2:??L?!8C?1r@C6?F?pA?:?????6[f??^???????????48??0????Ӵ۝"??????????????(q^???????~????m?i $?`??=>?:??P???hچ?t׏?Hݓ?)??"&i??7`.p?	i \??[?z????my??Ŷ?z??)?y?$7????ǃ?!x?E6?m?ګ??m?s??j/_???w:]}?Z?+?????4?T??"???l?F???f^??x{??a??y???&?Z??<iݮ??!???D??SYe??_??{K???????\?{?OcؒU?vWW??6?.?n????0??ֿ????	?M?-??d?[X`?T%?Y????M???-??Xi?űކ,n"8ݔ?m{g?E?4E??xu?rm[???+????<Ծ??????	M???8?N1????ȫ;?nk?w&?,q???? ?????           x???=o? @??_????4K?N??VݺD6m?lS???KT?MM?X?;??=???S?ZR???6?v==?cC:ӏ???춏vLp?2?%?Bs???j???0?U?e(?Ż?;\҂??m??|??"?+?
??[??? SC?%_?fs؛???0?5?*͒7??xu????5??]?)?WX???Ά`]???L]cI??Ӷ?ޘ?SΞ?,?W???G????z?v??W???*??v?FX???ucl?%??W?%aY?M7?Q????"? ???t         ?   x?u???0ѳ]Ep .?o-鿎hy???GY?^bѢ??Fm??????ɱ*?l	-f+hZ\?[?܀X?tr???v?vB;g??]???,?@#??!O0????N ???`.???<A'?t?@??P {???Q??`)?B???~Y-$???k-$?Z	?B?k???9?B??T?A???PBY(???(?B?ϲP?????????         B   x?3?4?L?O?/??I?t?OQ1J8??u?uMͬ?,???b?
V&FV&\1z\\\ Y?B         ?   x????n?0?3~?? ?l?2ib???)??¢` 邔R?}?c#.9?hF???0???}??O;xV1M?(?2?j???:??W?????%?N?yS?Au?dߪ<?C????KƮ?????.?????&Q?fq?]???ʡ???}????3,l???????????u??ߚ?܄$?2[[???dX?:o???QH??Is`g[p?DGM?>?>?Nu?m??G?j
            x?m??n?@F??St????JYiX??U,J?4??"?A??}դ?M?}9?s?D?]?cT3ƻ낦????p	?y?j?y?Vզ????	??x?ڄ7,???eSF$;?6󓙲G??!???~65?T?GLP??֔??eT????n?W??????#?N ?w?>}???????&??2?)?a????2??w;-Pr??*?*Ě??????7?ElnO?Ef?kU??s$?u?$??J?Nz?[?Y@?Qm?>ݑyR:??h??B?Ԍ??3L??%????mX      !      x?????? ? ?     