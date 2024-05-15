PGDMP  4                    |            db_sis    16.3    16.3 -               0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    24647    db_sis    DATABASE     y   CREATE DATABASE db_sis WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Spanish_Spain.1252';
    DROP DATABASE db_sis;
                postgres    false            �            1259    24682    Permissions    TABLE     j   CREATE TABLE public."Permissions" (
    id integer NOT NULL,
    nombre_permiso character varying(255)
);
 !   DROP TABLE public."Permissions";
       public         heap    postgres    false            �            1259    24681    Permissions_id_seq    SEQUENCE     �   CREATE SEQUENCE public."Permissions_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public."Permissions_id_seq";
       public          postgres    false    222                       0    0    Permissions_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public."Permissions_id_seq" OWNED BY public."Permissions".id;
          public          postgres    false    221            �            1259    24689    RolePermissions    TABLE     s   CREATE TABLE public."RolePermissions" (
    id integer NOT NULL,
    role_id integer,
    permission_id integer
);
 %   DROP TABLE public."RolePermissions";
       public         heap    postgres    false            �            1259    24688    RolePermissions_id_seq    SEQUENCE     �   CREATE SEQUENCE public."RolePermissions_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public."RolePermissions_id_seq";
       public          postgres    false    224                       0    0    RolePermissions_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public."RolePermissions_id_seq" OWNED BY public."RolePermissions".id;
          public          postgres    false    223            �            1259    24675    Roles    TABLE     _   CREATE TABLE public."Roles" (
    id integer NOT NULL,
    role_name character varying(255)
);
    DROP TABLE public."Roles";
       public         heap    postgres    false            �            1259    24674    Roles_id_seq    SEQUENCE     �   CREATE SEQUENCE public."Roles_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public."Roles_id_seq";
       public          postgres    false    220                       0    0    Roles_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public."Roles_id_seq" OWNED BY public."Roles".id;
          public          postgres    false    219            �            1259    24659    User    TABLE     �  CREATE TABLE public."User" (
    id integer NOT NULL,
    auth character varying(255),
    confirmed boolean,
    username character varying(255),
    password character varying(255),
    email character varying(255),
    first_name character varying(255),
    last_name character varying(255),
    created_at date,
    updated_at date,
    role_id integer,
    permission_id integer
);
    DROP TABLE public."User";
       public         heap    postgres    false            �            1259    24658    User_id_seq    SEQUENCE     �   CREATE SEQUENCE public."User_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public."User_id_seq";
       public          postgres    false    216                       0    0    User_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public."User_id_seq" OWNED BY public."User".id;
          public          postgres    false    215            �            1259    24668    Users_Roles    TABLE     i   CREATE TABLE public."Users_Roles" (
    id integer NOT NULL,
    user_id integer,
    role_id integer
);
 !   DROP TABLE public."Users_Roles";
       public         heap    postgres    false            �            1259    24667    Users_Roles_id_seq    SEQUENCE     �   CREATE SEQUENCE public."Users_Roles_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public."Users_Roles_id_seq";
       public          postgres    false    218                       0    0    Users_Roles_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public."Users_Roles_id_seq" OWNED BY public."Users_Roles".id;
          public          postgres    false    217            g           2604    24685    Permissions id    DEFAULT     t   ALTER TABLE ONLY public."Permissions" ALTER COLUMN id SET DEFAULT nextval('public."Permissions_id_seq"'::regclass);
 ?   ALTER TABLE public."Permissions" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    222    221    222            h           2604    24692    RolePermissions id    DEFAULT     |   ALTER TABLE ONLY public."RolePermissions" ALTER COLUMN id SET DEFAULT nextval('public."RolePermissions_id_seq"'::regclass);
 C   ALTER TABLE public."RolePermissions" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    223    224    224            f           2604    24678    Roles id    DEFAULT     h   ALTER TABLE ONLY public."Roles" ALTER COLUMN id SET DEFAULT nextval('public."Roles_id_seq"'::regclass);
 9   ALTER TABLE public."Roles" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    219    220    220            d           2604    24662    User id    DEFAULT     f   ALTER TABLE ONLY public."User" ALTER COLUMN id SET DEFAULT nextval('public."User_id_seq"'::regclass);
 8   ALTER TABLE public."User" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    216    215    216            e           2604    24671    Users_Roles id    DEFAULT     t   ALTER TABLE ONLY public."Users_Roles" ALTER COLUMN id SET DEFAULT nextval('public."Users_Roles_id_seq"'::regclass);
 ?   ALTER TABLE public."Users_Roles" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    217    218    218                      0    24682    Permissions 
   TABLE DATA           ;   COPY public."Permissions" (id, nombre_permiso) FROM stdin;
    public          postgres    false    222   K3                 0    24689    RolePermissions 
   TABLE DATA           G   COPY public."RolePermissions" (id, role_id, permission_id) FROM stdin;
    public          postgres    false    224   h3                 0    24675    Roles 
   TABLE DATA           0   COPY public."Roles" (id, role_name) FROM stdin;
    public          postgres    false    220   �3       	          0    24659    User 
   TABLE DATA           �   COPY public."User" (id, auth, confirmed, username, password, email, first_name, last_name, created_at, updated_at, role_id, permission_id) FROM stdin;
    public          postgres    false    216   �3                 0    24668    Users_Roles 
   TABLE DATA           =   COPY public."Users_Roles" (id, user_id, role_id) FROM stdin;
    public          postgres    false    218   �3                  0    0    Permissions_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public."Permissions_id_seq"', 1, false);
          public          postgres    false    221                       0    0    RolePermissions_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public."RolePermissions_id_seq"', 1, false);
          public          postgres    false    223                       0    0    Roles_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public."Roles_id_seq"', 1, false);
          public          postgres    false    219                        0    0    User_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public."User_id_seq"', 1, false);
          public          postgres    false    215            !           0    0    Users_Roles_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public."Users_Roles_id_seq"', 1, false);
          public          postgres    false    217            p           2606    24687    Permissions Permissions_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public."Permissions"
    ADD CONSTRAINT "Permissions_pkey" PRIMARY KEY (id);
 J   ALTER TABLE ONLY public."Permissions" DROP CONSTRAINT "Permissions_pkey";
       public            postgres    false    222            r           2606    24694 $   RolePermissions RolePermissions_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public."RolePermissions"
    ADD CONSTRAINT "RolePermissions_pkey" PRIMARY KEY (id);
 R   ALTER TABLE ONLY public."RolePermissions" DROP CONSTRAINT "RolePermissions_pkey";
       public            postgres    false    224            n           2606    24680    Roles Roles_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public."Roles"
    ADD CONSTRAINT "Roles_pkey" PRIMARY KEY (id);
 >   ALTER TABLE ONLY public."Roles" DROP CONSTRAINT "Roles_pkey";
       public            postgres    false    220            j           2606    24666    User User_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public."User"
    ADD CONSTRAINT "User_pkey" PRIMARY KEY (id);
 <   ALTER TABLE ONLY public."User" DROP CONSTRAINT "User_pkey";
       public            postgres    false    216            l           2606    24673    Users_Roles Users_Roles_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public."Users_Roles"
    ADD CONSTRAINT "Users_Roles_pkey" PRIMARY KEY (id);
 J   ALTER TABLE ONLY public."Users_Roles" DROP CONSTRAINT "Users_Roles_pkey";
       public            postgres    false    218            w           2606    24720 2   RolePermissions RolePermissions_permission_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."RolePermissions"
    ADD CONSTRAINT "RolePermissions_permission_id_fkey" FOREIGN KEY (permission_id) REFERENCES public."Permissions"(id);
 `   ALTER TABLE ONLY public."RolePermissions" DROP CONSTRAINT "RolePermissions_permission_id_fkey";
       public          postgres    false    4720    224    222            x           2606    24715 ,   RolePermissions RolePermissions_role_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."RolePermissions"
    ADD CONSTRAINT "RolePermissions_role_id_fkey" FOREIGN KEY (role_id) REFERENCES public."Roles"(id);
 Z   ALTER TABLE ONLY public."RolePermissions" DROP CONSTRAINT "RolePermissions_role_id_fkey";
       public          postgres    false    4718    224    220            s           2606    24700    User User_permission_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."User"
    ADD CONSTRAINT "User_permission_id_fkey" FOREIGN KEY (permission_id) REFERENCES public."Permissions"(id);
 J   ALTER TABLE ONLY public."User" DROP CONSTRAINT "User_permission_id_fkey";
       public          postgres    false    222    216    4720            t           2606    24695    User User_role_id_fkey    FK CONSTRAINT     {   ALTER TABLE ONLY public."User"
    ADD CONSTRAINT "User_role_id_fkey" FOREIGN KEY (role_id) REFERENCES public."Roles"(id);
 D   ALTER TABLE ONLY public."User" DROP CONSTRAINT "User_role_id_fkey";
       public          postgres    false    216    4718    220            u           2606    24710 $   Users_Roles Users_Roles_role_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Users_Roles"
    ADD CONSTRAINT "Users_Roles_role_id_fkey" FOREIGN KEY (role_id) REFERENCES public."Roles"(id);
 R   ALTER TABLE ONLY public."Users_Roles" DROP CONSTRAINT "Users_Roles_role_id_fkey";
       public          postgres    false    4718    218    220            v           2606    24705 $   Users_Roles Users_Roles_user_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Users_Roles"
    ADD CONSTRAINT "Users_Roles_user_id_fkey" FOREIGN KEY (user_id) REFERENCES public."User"(id);
 R   ALTER TABLE ONLY public."Users_Roles" DROP CONSTRAINT "Users_Roles_user_id_fkey";
       public          postgres    false    4714    218    216                  x������ � �            x������ � �            x������ � �      	      x������ � �            x������ � �     