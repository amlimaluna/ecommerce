--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.8
-- Dumped by pg_dump version 9.6.8

-- Started on 2018-09-18 19:45:12

--
-- TOC entry 188 (class 1259 OID 25406)
-- Name: categoria; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.categoria (
    id integer NOT NULL,
    descricao character varying NOT NULL
);



ALTER TABLE public.categoria OWNER TO postgres;

--
-- TOC entry 187 (class 1259 OID 25404)
-- Name: categoria_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.categoria_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.categoria_id_seq OWNER TO postgres;

--
-- TOC entry 2156 (class 0 OID 0)
-- Dependencies: 187
-- Name: categoria_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.categoria_id_seq OWNED BY public.categoria.id;


--
-- TOC entry 186 (class 1259 OID 25396)
-- Name: funcionario; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.funcionario (
    login character varying NOT NULL,
    nome character varying NOT NULL,
    senha character varying NOT NULL,
    salario numeric NOT NULL
);


ALTER TABLE public.funcionario OWNER TO postgres;

--
-- TOC entry 190 (class 1259 OID 25417)
-- Name: produto; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.produto (
    id integer NOT NULL,
    descricao character varying NOT NULL,
    preco numeric NOT NULL,
    categoria_id integer NOT NULL
);


ALTER TABLE public.produto OWNER TO postgres;

--
-- TOC entry 189 (class 1259 OID 25415)
-- Name: produto_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.produto_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.produto_id_seq OWNER TO postgres;

--
-- TOC entry 2157 (class 0 OID 0)
-- Dependencies: 189
-- Name: produto_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.produto_id_seq OWNED BY public.produto.id;


--
-- TOC entry 185 (class 1259 OID 25388)
-- Name: usuario; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.usuario (
    login character varying NOT NULL,
    nome character varying NOT NULL,
    senha character varying NOT NULL
);


ALTER TABLE public.usuario OWNER TO postgres;

--
-- TOC entry 2019 (class 2604 OID 25409)
-- Name: categoria id; Type: DEFAULT; Schema: public; Owner: postgres
--

CREATE TABLE public.venda (
id integer NOT NULL,
usuario_login character varying NOT NULL
);

ALTER TABLE public.venda OWNER TO postgres;

CREATE SEQUENCE public.venda_id_seq
	START WITH 1
	INCREMENT BY 1
	NO MINVALUE
	NO MAXVALUE
	CACHE 1;

ALTER TABLE public.venda_id_seq OWNER TO postgres;

ALTER SEQUENCE public.venda_id_seq OWNED BY public.venda.id;

CREATE TABLE public.venda_produto (
venda_id integer NOT NULL,
produto_id integer NOT NULL,
quantidade integer NOT NULL
);



ALTER TABLE ONLY public.categoria ALTER COLUMN id SET DEFAULT nextval('public.categoria_id_seq'::regclass);


--
-- TOC entry 2020 (class 2604 OID 25420)
-- Name: produto id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.produto ALTER COLUMN id SET DEFAULT nextval('public.produto_id_seq'::regclass);


ALTER TABLE ONLY public.venda ALTER COLUMN id SET DEFAULT nextval('public.venda_id_seq'::regclass);

--
-- TOC entry 2026 (class 2606 OID 25414)
-- Name: categoria categoria_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categoria
    ADD CONSTRAINT categoria_pk PRIMARY KEY (id);


--
-- TOC entry 2024 (class 2606 OID 25403)
-- Name: funcionario funcionario_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.funcionario
    ADD CONSTRAINT funcionario_pk PRIMARY KEY (login);


--
-- TOC entry 2029 (class 2606 OID 25431)
-- Name: produto produto_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.produto
    ADD CONSTRAINT produto_pk PRIMARY KEY (id);

ALTER TABLE ONLY public.venda
    ADD CONSTRAINT venda_pk PRIMARY KEY (id);
--
-- TOC entry 2022 (class 2606 OID 25395)
-- Name: usuario usuario_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.venda_produto
    ADD CONSTRAINT venda_produto_pk PRIMARY KEY (venda_id,produto_id);

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_pk PRIMARY KEY (login);


--
-- TOC entry 2027 (class 1259 OID 25429)
-- Name: fki_produto_categoria_id_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_produto_categoria_id_fk ON public.produto USING btree (categoria_id);

CREATE INDEX fki_venda_usuario_login_fk ON public.venda USING btree (usuario_login);

--
-- TOC entry 2030 (class 2606 OID 25424)
-- Name: produto produto_categoria_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.produto
    ADD CONSTRAINT produto_categoria_id_fk FOREIGN KEY (categoria_id) REFERENCES public.categoria(id) ON UPDATE RESTRICT ON DELETE RESTRICT;

ALTER TABLE ONLY public.venda
    ADD CONSTRAINT venda_usuario_login_fk FOREIGN KEY (usuario_login) REFERENCES public.usuario(login) ON UPDATE RESTRICT ON DELETE RESTRICT;

ALTER TABLE ONLY public.venda_produto
    ADD CONSTRAINT venda_produto_produto_id_fk FOREIGN KEY (produto_id) REFERENCES public.produto(id) ON UPDATE RESTRICT ON DELETE RESTRICT;
-- Completed on 2018-09-18 19:45:14

ALTER TABLE ONLY public.venda_produto
    ADD CONSTRAINT venda_produto_venda_id_fk FOREIGN KEY (venda_id) REFERENCES public.venda(id) ON UPDATE RESTRICT ON DELETE RESTRICT;

--
-- PostgreSQL database dump complete
--

