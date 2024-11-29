PGDMP                  
    |            postgres    17.2    17.2 .               0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                           false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                           false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                           false                       1262    5    postgres    DATABASE        CREATE DATABASE postgres WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Portuguese_Brazil.1252';
    DROP DATABASE postgres;
                     postgres    false                       0    0    DATABASE postgres    COMMENT     N   COMMENT ON DATABASE postgres IS 'default administrative connection database';
                        postgres    false    4894                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
                     pg_database_owner    false                        0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                        pg_database_owner    false    4            �            1259    16632    clientes    TABLE     �   CREATE TABLE public.clientes (
    id integer NOT NULL,
    nome character varying(100),
    email character varying(100),
    endereco character varying(255),
    cpf character varying(14)
);
    DROP TABLE public.clientes;
       public         heap r       postgres    false    4            �            1259    16631    clientes_id_seq    SEQUENCE     �   CREATE SEQUENCE public.clientes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.clientes_id_seq;
       public               postgres    false    222    4            !           0    0    clientes_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.clientes_id_seq OWNED BY public.clientes.id;
          public               postgres    false    221            �            1259    16610    colaboradores    TABLE     �   CREATE TABLE public.colaboradores (
    id integer NOT NULL,
    nome character varying(100),
    tipo_colaborador character varying(50),
    cpf character varying(14),
    cnpj character varying(18),
    parceria character varying(50)
);
 !   DROP TABLE public.colaboradores;
       public         heap r       postgres    false    4            �            1259    16609    colaboradores_id_seq    SEQUENCE     �   CREATE SEQUENCE public.colaboradores_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.colaboradores_id_seq;
       public               postgres    false    218    4            "           0    0    colaboradores_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.colaboradores_id_seq OWNED BY public.colaboradores.id;
          public               postgres    false    217            �            1259    16625    funcionario    TABLE     �   CREATE TABLE public.funcionario (
    id integer NOT NULL,
    cpf character varying(14),
    cnpj character varying(18),
    nome character varying(100),
    email character varying(100)
);
    DROP TABLE public.funcionario;
       public         heap r       postgres    false    4            �            1259    16624    funcionario_id_seq    SEQUENCE     �   CREATE SEQUENCE public.funcionario_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.funcionario_id_seq;
       public               postgres    false    220    4            #           0    0    funcionario_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.funcionario_id_seq OWNED BY public.funcionario.id;
          public               postgres    false    219            �            1259    16652    produto    TABLE     �   CREATE TABLE public.produto (
    id integer NOT NULL,
    isbn character varying(20),
    titulo character varying(100),
    autor character varying(100),
    id_clientes integer,
    id_colaboradores integer,
    id_funcionario integer
);
    DROP TABLE public.produto;
       public         heap r       postgres    false    4            �            1259    16651    produto_id_seq    SEQUENCE     �   CREATE SEQUENCE public.produto_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.produto_id_seq;
       public               postgres    false    226    4            $           0    0    produto_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.produto_id_seq OWNED BY public.produto.id;
          public               postgres    false    225            �            1259    16640    servicos    TABLE        CREATE TABLE public.servicos (
    id integer NOT NULL,
    id_funcionario integer,
    tipo_servico character varying(255)
);
    DROP TABLE public.servicos;
       public         heap r       postgres    false    4            �            1259    16639    servicos_id_seq    SEQUENCE     �   CREATE SEQUENCE public.servicos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.servicos_id_seq;
       public               postgres    false    224    4            %           0    0    servicos_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.servicos_id_seq OWNED BY public.servicos.id;
          public               postgres    false    223            m           2604    16635    clientes id    DEFAULT     j   ALTER TABLE ONLY public.clientes ALTER COLUMN id SET DEFAULT nextval('public.clientes_id_seq'::regclass);
 :   ALTER TABLE public.clientes ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    222    221    222            k           2604    16613    colaboradores id    DEFAULT     t   ALTER TABLE ONLY public.colaboradores ALTER COLUMN id SET DEFAULT nextval('public.colaboradores_id_seq'::regclass);
 ?   ALTER TABLE public.colaboradores ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    218    217    218            l           2604    16628    funcionario id    DEFAULT     p   ALTER TABLE ONLY public.funcionario ALTER COLUMN id SET DEFAULT nextval('public.funcionario_id_seq'::regclass);
 =   ALTER TABLE public.funcionario ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    219    220    220            o           2604    16655 
   produto id    DEFAULT     h   ALTER TABLE ONLY public.produto ALTER COLUMN id SET DEFAULT nextval('public.produto_id_seq'::regclass);
 9   ALTER TABLE public.produto ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    225    226    226            n           2604    16643    servicos id    DEFAULT     j   ALTER TABLE ONLY public.servicos ALTER COLUMN id SET DEFAULT nextval('public.servicos_id_seq'::regclass);
 :   ALTER TABLE public.servicos ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    224    223    224                      0    16632    clientes 
   TABLE DATA           B   COPY public.clientes (id, nome, email, endereco, cpf) FROM stdin;
    public               postgres    false    222   �3                 0    16610    colaboradores 
   TABLE DATA           X   COPY public.colaboradores (id, nome, tipo_colaborador, cpf, cnpj, parceria) FROM stdin;
    public               postgres    false    218   O5                 0    16625    funcionario 
   TABLE DATA           A   COPY public.funcionario (id, cpf, cnpj, nome, email) FROM stdin;
    public               postgres    false    220   T6                 0    16652    produto 
   TABLE DATA           i   COPY public.produto (id, isbn, titulo, autor, id_clientes, id_colaboradores, id_funcionario) FROM stdin;
    public               postgres    false    226   B7                 0    16640    servicos 
   TABLE DATA           D   COPY public.servicos (id, id_funcionario, tipo_servico) FROM stdin;
    public               postgres    false    224   :8       &           0    0    clientes_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.clientes_id_seq', 5, true);
          public               postgres    false    221            '           0    0    colaboradores_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.colaboradores_id_seq', 5, true);
          public               postgres    false    217            (           0    0    funcionario_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.funcionario_id_seq', 5, true);
          public               postgres    false    219            )           0    0    produto_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.produto_id_seq', 5, true);
          public               postgres    false    225            *           0    0    servicos_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.servicos_id_seq', 5, true);
          public               postgres    false    223            u           2606    16637    clientes clientes_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.clientes
    ADD CONSTRAINT clientes_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.clientes DROP CONSTRAINT clientes_pkey;
       public                 postgres    false    222            q           2606    16615     colaboradores colaboradores_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.colaboradores
    ADD CONSTRAINT colaboradores_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.colaboradores DROP CONSTRAINT colaboradores_pkey;
       public                 postgres    false    218            s           2606    16630    funcionario funcionario_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.funcionario
    ADD CONSTRAINT funcionario_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.funcionario DROP CONSTRAINT funcionario_pkey;
       public                 postgres    false    220            y           2606    16657    produto produto_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.produto
    ADD CONSTRAINT produto_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.produto DROP CONSTRAINT produto_pkey;
       public                 postgres    false    226            w           2606    16645    servicos servicos_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.servicos
    ADD CONSTRAINT servicos_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.servicos DROP CONSTRAINT servicos_pkey;
       public                 postgres    false    224            {           2606    16658     produto produto_id_clientes_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.produto
    ADD CONSTRAINT produto_id_clientes_fkey FOREIGN KEY (id_clientes) REFERENCES public.clientes(id) ON DELETE CASCADE;
 J   ALTER TABLE ONLY public.produto DROP CONSTRAINT produto_id_clientes_fkey;
       public               postgres    false    222    226    4725            |           2606    16663 %   produto produto_id_colaboradores_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.produto
    ADD CONSTRAINT produto_id_colaboradores_fkey FOREIGN KEY (id_colaboradores) REFERENCES public.colaboradores(id) ON DELETE CASCADE;
 O   ALTER TABLE ONLY public.produto DROP CONSTRAINT produto_id_colaboradores_fkey;
       public               postgres    false    4721    218    226            }           2606    16668 #   produto produto_id_funcionario_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.produto
    ADD CONSTRAINT produto_id_funcionario_fkey FOREIGN KEY (id_funcionario) REFERENCES public.funcionario(id) ON DELETE CASCADE;
 M   ALTER TABLE ONLY public.produto DROP CONSTRAINT produto_id_funcionario_fkey;
       public               postgres    false    220    226    4723            z           2606    16646 %   servicos servicos_id_funcionario_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.servicos
    ADD CONSTRAINT servicos_id_funcionario_fkey FOREIGN KEY (id_funcionario) REFERENCES public.funcionario(id) ON DELETE CASCADE;
 O   ALTER TABLE ONLY public.servicos DROP CONSTRAINT servicos_id_funcionario_fkey;
       public               postgres    false    4723    224    220               @  x�M�An�0E��)� Ī'8;�P�t��@,����NXp�]���uj��5�����/�&�v�5�Cv}��%�ŹE��)���������Gh0�څh�d^�RB�J�\e��9[z��u7d�1���=�,q�l�'�b-o����x��>�&��u�j�DI�j�3��Ƣő�;Y0�a[d�������ӫ>��qby��56b���dI��S�.�b+g�&	u֧=֓3�,v!v�Μ��C��q�!�/$(�BjFG�*�.U�J^��q�jh�l4��A�pB��*}�$��X��>��M1E�T�E.3)�����6��         �   x�]�=N1F��)��;��UR  (���,-1�.\��s�bvQ$�����{����t���\#��T�1J�4K�|�B���X$範����N��6��]y���T�)��"x�dj%�c��Ȣ�jF4�z��Eh�c����f1�k�@i��� �Tp1�J�j���r<�\�͐���x-1X�$��IQ@gEK�b�iȯ���8��\ttH��� h�PZz���b����yX�         �   x�Uнj�0����*t>տ��%���Ь]�
�*R�!W_92���I��
����sQ�J�nxᜋ�s8Q�Ra�8�	�O`Y���
�5͝?8�F�����5��l�?���2;��G��+5Ri4���y/$�W��T�A���4�8�O"5j�7�oӽ�jJ���b�S���	���6j�K��N�v�i_�~Ԙ�%��	˪C�����m         �   x�-�=N�0F��)����)Y� !�VP��x�E����I��<܁6#�V��7���K�xM\Y�+����.#v�f������p� ����q�5oYSSm�}ڴ��̮s����1|y�s�T@��Td�d��Ió�s:���gx1wƇp,����U��!a�hH@���އ	����.�[Ǐs��*0}m���j%��-qL�a�1��p����9Ƶt���0���eO�         b   x�3�4�J-�,>�8_!��$?���´��D.#N#N����������Aҩ
0�\ƜƜ�9��%E9.NN�ĒĜ�t��)�)g@iR�,�@� ]�*     