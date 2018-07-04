	CREATE SCHEMA pedidovenda
	       AUTHORIZATION postgres;


	 CREATE SEQUENCE pedidovenda.pedido_id_seq
	     INCREMENT 1
	     MINVALUE 1
	     MAXVALUE 9223372036854775807
	     START 1
	     CACHE 1;

	 ALTER SEQUENCE pedidovenda.pedido_id_seq RESTART WITH 1;
	 --ALTER TABLE pedidovenda.pedido ALTER COLUMN id SET DEFAULT NEXTVAL('pedido_id_seq'::regclass);

	 CREATE SEQUENCE pedidovenda.categoria_id_seq
	     INCREMENT 1
	     MINVALUE 1
	     MAXVALUE 9223372036854775807
	     START 1
	     CACHE 1;
	 ALTER SEQUENCE pedidovenda.categoria_id_seq RESTART WITH 1;
	 --ALTER TABLE pedidovenda.categoria ALTER COLUMN id SET DEFAULT NEXTVAL('categoria_id_seq'::regclass);

	 CREATE SEQUENCE pedidovenda.cliente_id_seq
	     INCREMENT 1
	     MINVALUE 1
	     MAXVALUE 9223372036854775807
	     START 1
	     CACHE 1;
	 ALTER SEQUENCE pedidovenda.cliente_id_seq RESTART WITH 3;
	 --ALTER TABLE pedidovenda.cliente ALTER COLUMN id SET DEFAULT NEXTVAL('cliente_id_seq'::regclass);

	 CREATE SEQUENCE pedidovenda.endereco_id_seq
	     INCREMENT 1
	     MINVALUE 1
	     MAXVALUE 9223372036854775807
	     START 1
	     CACHE 1;
	 ALTER SEQUENCE pedidovenda.endereco_id_seq RESTART WITH 1;
	 --ALTER TABLE pedidovenda.endereco ALTER COLUMN id SET DEFAULT NEXTVAL('endereco_id_seq'::regclass);

	 CREATE SEQUENCE pedidovenda.grupo_id_seq
	     INCREMENT 1
	     MINVALUE 1
	     MAXVALUE 9223372036854775807
	     START 1
	     CACHE 1;
	 ALTER SEQUENCE pedidovenda.grupo_id_seq RESTART WITH 2;
	 --ALTER TABLE pedidovenda.grupo ALTER COLUMN id SET DEFAULT NEXTVAL('grupo_id_seq'::regclass);

	 CREATE SEQUENCE pedidovenda.item_pedido_id_seq
	     INCREMENT 1
	     MINVALUE 1
	     MAXVALUE 9223372036854775807
	     START 1
	     CACHE 1;
	 ALTER SEQUENCE pedidovenda.item_pedido_id_seq RESTART WITH 1;
	 --ALTER TABLE pedidovenda.item_pedido ALTER COLUMN id SET DEFAULT NEXTVAL('item_pedido_id_seq'::regclass);

	 
	 CREATE SEQUENCE pedidovenda.produto_id_seq
	     INCREMENT 1
	     MINVALUE 1
	     MAXVALUE 9223372036854775807
	     START 1
	     CACHE 1;
	 ALTER SEQUENCE pedidovenda.produto_id_seq RESTART WITH 1;
	 --ALTER TABLE pedidovenda.produto ALTER COLUMN id SET DEFAULT NEXTVAL('produto_id_seq'::regclass);


	 CREATE SEQUENCE pedidovenda.usuario_id_seq
	     INCREMENT 1
	     MINVALUE 1
	     MAXVALUE 9223372036854775807
	     START 1
	     CACHE 1;
	 ALTER SEQUENCE pedidovenda.usuario_id_seq RESTART WITH 3;
	 --ALTER TABLE pedidovenda.usuario ALTER COLUMN id SET DEFAULT NEXTVAL('usuario_id_seq'::regclass);

	  CREATE SEQUENCE pedidovenda.vendedor_id_seq
	     INCREMENT 1
	     MINVALUE 1
	     MAXVALUE 9223372036854775807
	     START 1
	     CACHE 1;
	 ALTER SEQUENCE pedidovenda.vendedor_id_seq RESTART WITH 1;

	-- Table: pedidovenda.pedido

	-- DROP TABLE pedidovenda.pedido;
	-- Table: pedidovenda.produto

	-- DROP TABLE pedidovenda.produto;
	CREATE TABLE pedidovenda.usuario
	(
	  id bigint NOT NULL DEFAULT nextval('pedidovenda.usuario_id_seq'::regclass),
	  email character varying(255) NOT NULL,
	  nome character varying(80) NOT NULL,
	  senha character varying(20) NOT NULL,
	  CONSTRAINT usuario_pkey PRIMARY KEY (id),
	  CONSTRAINT uk_5171l57faosmj8myawaucatdw UNIQUE (email)
	)
	WITH (
	  OIDS=FALSE
	);
	ALTER TABLE pedidovenda.usuario
	  OWNER TO postgres;

	CREATE TABLE pedidovenda.categoria
	(
	  id bigint NOT NULL DEFAULT nextval('pedidovenda.categoria_id_seq'::regclass),
	  descricao character varying(60) NOT NULL,
	  categoria_pai_id bigint,
	  CONSTRAINT categoria_pkey PRIMARY KEY (id),
	  CONSTRAINT fk9gdokxfvkvnakuki35japqxdk FOREIGN KEY (categoria_pai_id)
	      REFERENCES pedidovenda.categoria (id) MATCH SIMPLE
	      ON UPDATE NO ACTION ON DELETE NO ACTION
	)
	WITH (
	  OIDS=FALSE
	);
	ALTER TABLE pedidovenda.categoria
	  OWNER TO postgres;	  

	CREATE TABLE pedidovenda.produto
	(
	  id bigint NOT NULL DEFAULT nextval('pedidovenda.produto_id_seq'::regclass),
	  nome character varying(80) NOT NULL,
	  quantidade_estoque integer NOT NULL,
	  sku character varying(20) NOT NULL,
	  valor_unitario numeric(10,2) NOT NULL,
	  categoria_id bigint NOT NULL,
	  CONSTRAINT produto_pkey PRIMARY KEY (id),
	  CONSTRAINT fkopu9jggwnamfv0c8k2ri3kx0a FOREIGN KEY (categoria_id)
	      REFERENCES pedidovenda.categoria (id) MATCH SIMPLE
	      ON UPDATE NO ACTION ON DELETE NO ACTION,
	  CONSTRAINT uk_j6npst3feop938l4x5h675kyv UNIQUE (sku),
	  CONSTRAINT produto_quantidade_estoque_check CHECK (quantidade_estoque >= 0 AND quantidade_estoque <= 9999)
	)
	WITH (
	  OIDS=FALSE
	);
	ALTER TABLE pedidovenda.produto
	  OWNER TO postgres;

	CREATE TABLE pedidovenda.cliente
	(
	  id bigint NOT NULL DEFAULT nextval('pedidovenda.cliente_id_seq'::regclass),
	  doc_receita_federal character varying(14) NOT NULL,
	  email character varying(255) NOT NULL,
	  nome character varying(100) NOT NULL,
	  numerocartaofidelidade character varying(20),
	  tipo character varying(10) NOT NULL,
	  CONSTRAINT cliente_pkey PRIMARY KEY (id)
	)
	WITH (
	  OIDS=FALSE
	);
	ALTER TABLE pedidovenda.cliente
	  OWNER TO postgres;

	CREATE TABLE pedidovenda.vendedor
	(
	  id bigint NOT NULL DEFAULT nextval('pedidovenda.vendedor_id_seq'::regclass),
	  nome character varying(100) NOT NULL,
	  CONSTRAINT vendedor_pkey PRIMARY KEY (id)
	)
	WITH (
	  OIDS=FALSE
	);
	ALTER TABLE pedidovenda.vendedor
	  OWNER TO postgres;


	  	  

	CREATE TABLE pedidovenda.pedido
	(
	  id bigint NOT NULL DEFAULT nextval('pedidovenda.pedido_id_seq'::regclass),
	  data_criacao timestamp without time zone NOT NULL,
	  data_entrega date NOT NULL,
	  entrega_cep character varying(9) NOT NULL,
	  entrega_cidade character varying(60) NOT NULL,
	  entrega_complemento character varying(150),
	  entrega_logradouro character varying(150) NOT NULL,
	  entrega_numero character varying(20) NOT NULL,
	  entrega_uf character varying(60) NOT NULL,
	  forma_pagamento character varying(20) NOT NULL,
	  observacao text,
	  status character varying(20) NOT NULL,
	  valor_desconto numeric(10,2) NOT NULL,
	  valor_frete numeric(10,2) NOT NULL,
	  valor_total numeric(10,2) NOT NULL,
	  cliente_id bigint NOT NULL,
	  vendedor_id bigint NOT NULL,
	  CONSTRAINT pedido_pkey PRIMARY KEY (id),
	  CONSTRAINT fk30s8j2ktpay6of18lbyqn3632 FOREIGN KEY (cliente_id)
	      REFERENCES pedidovenda.cliente (id) MATCH SIMPLE
	      ON UPDATE NO ACTION ON DELETE NO ACTION,
	  CONSTRAINT fkglnyw47m2ldiu2m73a6e283j3 FOREIGN KEY (vendedor_id)
	      REFERENCES pedidovenda.usuario (id) MATCH SIMPLE
	      ON UPDATE NO ACTION ON DELETE NO ACTION
	)
	WITH (
	  OIDS=FALSE
	);
	ALTER TABLE pedidovenda.pedido
	  OWNER TO postgres;

	CREATE TABLE pedidovenda.item_pedido
	(
	  id bigint NOT NULL DEFAULT nextval('pedidovenda.item_pedido_id_seq'::regclass),
	  quantidade integer NOT NULL,
	  valor_unitario numeric(10,2) NOT NULL,
	  pedido_id bigint NOT NULL,
	  produto_id bigint NOT NULL,
	  CONSTRAINT item_pedido_pkey PRIMARY KEY (id),
	  CONSTRAINT fk60ym08cfoysa17wrn1swyiuda FOREIGN KEY (pedido_id)
	      REFERENCES pedidovenda.pedido (id) MATCH SIMPLE
	      ON UPDATE NO ACTION ON DELETE NO ACTION,
	  CONSTRAINT fktk55mn6d6bvl5h0no5uagi3sf FOREIGN KEY (produto_id)
	      REFERENCES pedidovenda.produto (id) MATCH SIMPLE
	      ON UPDATE NO ACTION ON DELETE NO ACTION
	)
	WITH (
	  OIDS=FALSE
	);
	ALTER TABLE pedidovenda.item_pedido
	  OWNER TO postgres;

	CREATE TABLE pedidovenda.grupo
	(
	  id bigint NOT NULL DEFAULT nextval('pedidovenda.grupo_id_seq'::regclass),
	  descricao character varying(80) NOT NULL,
	  nome character varying(40) NOT NULL,
	  CONSTRAINT grupo_pkey PRIMARY KEY (id)
	)
	WITH (
	  OIDS=FALSE
	);
	ALTER TABLE pedidovenda.grupo
	  OWNER TO postgres;


	CREATE TABLE pedidovenda.endereco
	(
	  id bigint NOT NULL DEFAULT nextval('pedidovenda.endereco_id_seq'::regclass),
	  cep character varying(9) NOT NULL,
	  cidade character varying(60) NOT NULL,
	  complemento character varying(150),
	  logradouro character varying(150) NOT NULL,
	  numero character varying(20) NOT NULL,
	  uf character varying(60) NOT NULL,
	  cliente_id bigint NOT NULL,
	  CONSTRAINT endereco_pkey PRIMARY KEY (id),
	  CONSTRAINT fk8s7ivtl4foyhrfam9xqom73n9 FOREIGN KEY (cliente_id)
	      REFERENCES pedidovenda.cliente (id) MATCH SIMPLE
	      ON UPDATE NO ACTION ON DELETE NO ACTION
	)
	WITH (
	  OIDS=FALSE
	);
	ALTER TABLE pedidovenda.endereco
	  OWNER TO postgres;

	CREATE TABLE pedidovenda.usuario_grupo
	(
	  usuario_id bigint NOT NULL,
	  grupo_id bigint NOT NULL,
	  CONSTRAINT fkdofo9es0esuiahyw2q467crxw FOREIGN KEY (usuario_id)
	      REFERENCES pedidovenda.usuario (id) MATCH SIMPLE
	      ON UPDATE NO ACTION ON DELETE NO ACTION,
	  CONSTRAINT fkk30suuy31cq5u36m9am4om9ju FOREIGN KEY (grupo_id)
	      REFERENCES pedidovenda.grupo (id) MATCH SIMPLE
	      ON UPDATE NO ACTION ON DELETE NO ACTION
	)
	WITH (
	  OIDS=FALSE
	);
	ALTER TABLE pedidovenda.usuario_grupo
	  OWNER TO postgres;