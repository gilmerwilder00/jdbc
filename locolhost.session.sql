--Actividad Creación base de datos Vivero

--1. creaci¿on de base de datos
create database vivero;
show databases;

--2.Creación de tablas
use vivero;
show tables;

--2.1 Creacion de tabla oficina
drop table oficina;

create table oficina(
    id_oficina int primary key,
    codigo_oficina varchar(10) not null,
    ciudad varchar(30) not null,
    pais varchar(50) not null,
    region varchar(50),
    codigo_postal varchar(10) not null,
    telefono varchar(20) not null
);

show tables;
describe oficina;

--2.2 Creacion de tabla emplado

create table empleado(
    id_empleado int primary key,
    codigo_empleado int not null,
    nombre varchar(50) not null,
    apellido varchar(50) not null,
    extension varchar(10) not null,
    email varchar(100) not null,
    id_oficina int not null,
    id_jefe int,
    puesto varchar(50),
    foreign key (id_oficina) references oficina(id_oficina),
    foreign key (id_jefe) references empleado(id_empleado)
);

DESCRIBE empleado;

--2.3 creacion de tabla cliente
create table cliente (
    id_cliente int primary key,
    codigo_cliente int not null,
    nombre_cliente varchar(50) not null,
    nombre_contacto varchar(30),
    apellido_contacto varchar(30),
    telefono varchar(15) not null,
    fax varchar(15) not null,
    ciudad varchar(50) not null,
    region varchar(50),
    pais varchar(50),
    codigo_postal varchar(10),
    id_empleado int,
    limite_credito decimal(15,2),
    foreign key (id_empleado) references empleado(id_empleado)
);

show columns from cliente;

--2.4 creación de tabla pago

create table pago(
    id_pago int  primary key,
    id_cliente int not null,
    forma_pago varchar(40) not null, 
    id_transaccion varchar(50) not null,
    fecha_pago date not null,
    total decimal (15,2),
    foreign key (id_cliente) references cliente(id_cliente)
);

describe pago;

--2.5 creacion de tabla gama_producto

create table gama_producto(
    id_gama int primary key,
    gama varchar(50) not null,
    descripcion_texto text,
    descripcion_html text,
    imagen varchar(256)   
);

describe gama_producto;

--2.6 creacion de tabal producto 

create table producto(
    id_producto int primary key,
    codigo_producto varchar(15) not null,
    nombre varchar(70) not null,
    id_gama int,
    dimensiones varchar(25),
    proveedor varchar(50),
    descripcion text,
    cantidad_en_stock smallint not null,
    precio_venta decimal(15,2) not null,
    precio_proveedor decimal(15,2),   
    foreign key (id_gama) references gama_producto(id_gama)
);

--2.7 creacion de tabla pedido

create table pedido(
    id_pedido int primary key,
    codigo_pedido int not null,
    fecha_pedido date not null,
    fecha_esperada date not null,
    fecha_entrega date,
    estado varchar(15) not null, 
    comentarios text,
    id_cliente int,
    foreign key (id_cliente) references cliente(id_cliente)
);
describe pedido;

--2.8 creacion de tabla detalle pedido

create table detalle_pedido(
    id_detalle_pedido int primary key,
    id_pedido int,
    id_producto int,
    cantidad int not null,
    precio_unidad decimal(15,2) not null,
    numero_linea smallint,
    foreign key(id_pedido) references pedido(id_pedido),
    foreign key(id_producto) references producto(id_producto)
);