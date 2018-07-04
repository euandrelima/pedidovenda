-- CREATE SEQUENCE pedido_id_seq
--     INCREMENT 1
--     MINVALUE 1
--     MAXVALUE 9223372036854775807
--     START 1
--     CACHE 1;
--commit;
-- ALTER SEQUENCE pedido_id_seq RESTART WITH 1;
-- ALTER TABLE pedidovenda.pedido ALTER COLUMN id SET DEFAULT NEXTVAL('pedido_id_seq'::regclass);

-- CREATE SEQUENCE categoria_id_seq
--     INCREMENT 1
--     MINVALUE 1
--     MAXVALUE 9223372036854775807
--     START 1
--     CACHE 1;
-- ALTER SEQUENCE categoria_id_seq RESTART WITH 1;
-- ALTER TABLE pedidovenda.categoria ALTER COLUMN id SET DEFAULT NEXTVAL('categoria_id_seq'::regclass);

-- CREATE SEQUENCE cliente_id_seq
--     INCREMENT 1
--     MINVALUE 1
--     MAXVALUE 9223372036854775807
--     START 1
--     CACHE 1;
-- ALTER SEQUENCE cliente_id_seq RESTART WITH 3;
-- ALTER TABLE pedidovenda.cliente ALTER COLUMN id SET DEFAULT NEXTVAL('cliente_id_seq'::regclass);

-- CREATE SEQUENCE endereco_id_seq
--     INCREMENT 1
--     MINVALUE 1
--     MAXVALUE 9223372036854775807
--     START 1
--     CACHE 1;
-- ALTER SEQUENCE endereco_id_seq RESTART WITH 1;
-- ALTER TABLE pedidovenda.endereco ALTER COLUMN id SET DEFAULT NEXTVAL('endereco_id_seq'::regclass);

-- CREATE SEQUENCE grupo_id_seq
--     INCREMENT 1
--     MINVALUE 1
--     MAXVALUE 9223372036854775807
--     START 1
--     CACHE 1;
-- ALTER SEQUENCE grupo_id_seq RESTART WITH 2;
-- ALTER TABLE pedidovenda.grupo ALTER COLUMN id SET DEFAULT NEXTVAL('grupo_id_seq'::regclass);

-- CREATE SEQUENCE item_pedido_id_seq
--     INCREMENT 1
--     MINVALUE 1
--     MAXVALUE 9223372036854775807
--     START 1
--     CACHE 1;
-- ALTER SEQUENCE item_pedido_id_seq RESTART WITH 1;
-- ALTER TABLE pedidovenda.item_pedido ALTER COLUMN id SET DEFAULT NEXTVAL('item_pedido_id_seq'::regclass);

-- 
-- CREATE SEQUENCE produto_id_seq
--     INCREMENT 1
--     MINVALUE 1
--     MAXVALUE 9223372036854775807
--     START 1
--     CACHE 1;
-- ALTER SEQUENCE produto_id_seq RESTART WITH 1;
-- ALTER TABLE pedidovenda.produto ALTER COLUMN id SET DEFAULT NEXTVAL('produto_id_seq'::regclass);


-- CREATE SEQUENCE usuario_id_seq
--     INCREMENT 1
--     MINVALUE 1
--     MAXVALUE 9223372036854775807
--     START 1
--     CACHE 1;
-- ALTER SEQUENCE usuario_id_seq RESTART WITH 3;
-- ALTER TABLE pedidovenda.usuario ALTER COLUMN id SET DEFAULT NEXTVAL('usuario_id_seq'::regclass);

--insert into pedidovenda.usuario_grupo values (2,2);
--commit;

