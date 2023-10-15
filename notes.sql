/*COMANDOS */

CREATE DATABASE ventas_jugos;

CREATE SCHEMA IF NOT EXISTS ventas_jugos2;

DROP DATABASE ventas_jugos2;

CREATE SCHEMA IF NOT EXISTS ventas_jugos2 DEFAULT
CHARSET utf32;

USE ventas_jugos;

CREATE TABLE tb_vendedor(
MATRICULA VARCHAR(5) NOT NULL,
NOMBRE VARCHAR(100) NULL,
BARRIO VARCHAR(50) NULL,
COMISION FLOAT NULL,
FECHA_ADMISION DATE NULL,
DE_VACACIONES BIT(1) NULL,
PRIMARY KEY(MATRICULA)
);

CREATE TABLE tb_producto(
CODIGO VARCHAR(10) NOT NULL,
DESCRIPCION VARCHAR(100) NULL,
SABOR VARCHAR(50) NULL,
TAMANO VARCHAR(50) NULL,
ENVASE VARCHAR(50) NULL,
PRECIO_LISTA FLOAT NULL,
PRIMARY KEY (CODIGO)
);

USE ventas_jugos;

CREATE TABLE tb_venta(
NUMERO VARCHAR(5) NOT NULL,
FECHA DATE NULL,
DNI VARCHAR(11) NOT NULL,
MATRICULA VARCHAR(5) NOT NULL,
IMPUESTO FLOAT,
PRIMARY KEY(NUMERO)
);

ALTER TABLE tb_venta ADD CONSTRAINT FK_CLIENTE
FOREIGN KEY (DNI) REFERENCES tb_cliente(DNI);

ALTER TABLE tb_venta ADD CONSTRAINT FK_VENDEDOR
FOREIGN KEY (MATRICULA) REFERENCES tb_vendedor(MATRICULA);

USE ventas_jugos;

ALTER TABLE tb_venta RENAME tb_factura;

USE ventas_jugos;

CREATE TABLE tb_items_facturas(
NUMERO VARCHAR(5) NOT NULL,
CODIGO VARCHAR(10) NOT NULL,
CANTIDAD INT,
PRECIO FLOAT,
PRIMARY KEY (NUMERO,CODIGO)
);

ALTER TABLE tb_items_facturas ADD CONSTRAINT FK_FACTURA
FOREIGN KEY (NUMERO) REFERENCES tb_factura(NUMERO);

ALTER TABLE tb_items_facturas ADD CONSTRAINT FK_PRODUCTO
FOREIGN KEY (CODIGO) REFERENCES tb_producto(CODIGO);

-- MySQL Script generated by MySQL Workbench
-- Thu May 27 06:29:18 2021
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema ventas_jugos
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema ventas_jugos
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `ventas_jugos` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `ventas_jugos` ;

-- -----------------------------------------------------
-- Table `ventas_jugos`.`tb_cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ventas_jugos`.`tb_cliente` (
  `DNI` VARCHAR(11) NOT NULL,
  `NOMBRE` VARCHAR(100) NULL DEFAULT NULL,
  `DIRECCION` VARCHAR(150) NULL DEFAULT NULL,
  `BARRIO` VARCHAR(50) NULL DEFAULT NULL,
  `CIUDAD` VARCHAR(50) NULL DEFAULT NULL,
  `ESTADO` VARCHAR(10) NULL DEFAULT NULL,
  `CP` VARCHAR(10) NULL DEFAULT NULL,
  `FECHA_NACIMIENTO` DATE NULL DEFAULT NULL,
  `EDAD` SMALLINT NULL DEFAULT NULL,
  `SEXO` VARCHAR(1) NULL DEFAULT NULL,
  `LIMITE_CREDITO` FLOAT NULL DEFAULT NULL,
  `VOLUMEN_COMPRA` FLOAT NULL DEFAULT NULL,
  `PRIMERA_COMPRA` BIT(1) NULL DEFAULT NULL,
  PRIMARY KEY (`DNI`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `ventas_jugos`.`tb_vendedor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ventas_jugos`.`tb_vendedor` (
  `MATRICULA` VARCHAR(5) NOT NULL,
  `NOMBRE` VARCHAR(100) NULL DEFAULT NULL,
  `BARRIO` VARCHAR(50) NULL DEFAULT NULL,
  `COMISION` FLOAT NULL DEFAULT NULL,
  `FECHA_ADMISION` DATE NULL DEFAULT NULL,
  `DE_VACACIONES` BIT(1) NULL DEFAULT NULL,
  PRIMARY KEY (`MATRICULA`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `ventas_jugos`.`tb_factura`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ventas_jugos`.`tb_factura` (
  `NUMERO` VARCHAR(5) NOT NULL,
  `FECHA` DATE NULL DEFAULT NULL,
  `DNI` VARCHAR(11) NOT NULL,
  `MATRICULA` VARCHAR(5) NOT NULL,
  `IMPUESTO` FLOAT NULL DEFAULT NULL,
  PRIMARY KEY (`NUMERO`),
  INDEX `FK_CLIENTE` (`DNI` ASC) VISIBLE,
  INDEX `FK_VENDEDOR` (`MATRICULA` ASC) VISIBLE,
  CONSTRAINT `FK_CLIENTE`
    FOREIGN KEY (`DNI`)
    REFERENCES `ventas_jugos`.`tb_cliente` (`DNI`),
  CONSTRAINT `FK_VENDEDOR`
    FOREIGN KEY (`MATRICULA`)
    REFERENCES `ventas_jugos`.`tb_vendedor` (`MATRICULA`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `ventas_jugos`.`tb_producto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ventas_jugos`.`tb_producto` (
  `CODIGO` VARCHAR(10) NOT NULL,
  `DESCRIPCION` VARCHAR(100) NULL DEFAULT NULL,
  `SABOR` VARCHAR(50) NULL DEFAULT NULL,
  `TAMANO` VARCHAR(50) NULL DEFAULT NULL,
  `ENVASE` VARCHAR(50) NULL DEFAULT NULL,
  `PRECIO_LISTA` FLOAT NULL DEFAULT NULL,
  PRIMARY KEY (`CODIGO`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `ventas_jugos`.`tb_items_facturas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ventas_jugos`.`tb_items_facturas` (
  `NUMERO` VARCHAR(5) NOT NULL,
  `CODIGO` VARCHAR(10) NOT NULL,
  `CANTIDAD` INT NULL DEFAULT NULL,
  `PRECIO` FLOAT NULL DEFAULT NULL,
  PRIMARY KEY (`NUMERO`, `CODIGO`),
  INDEX `FK_PRODUCTO` (`CODIGO` ASC) VISIBLE,
  CONSTRAINT `FK_FACTURA`
    FOREIGN KEY (`NUMERO`)
    REFERENCES `ventas_jugos`.`tb_factura` (`NUMERO`),
  CONSTRAINT `FK_PRODUCTO`
    FOREIGN KEY (`CODIGO`)
    REFERENCES `ventas_jugos`.`tb_producto` (`CODIGO`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;







USE ventas_jugos;

INSERT INTO tb_producto (CODIGO, DESCRIPCION, SABOR, TAMANO, ENVASE,
PRECIO_LISTA) VALUES (
'1040107', 'Light', 'Sandía', '350 ml', 'Lata', 4.56
);

SELECT * FROM tb_producto;

INSERT INTO tb_producto (CODIGO, SABOR, DESCRIPCION, TAMANO, ENVASE,
PRECIO_LISTA) VALUES (
'1040108', 'Guanábana', 'Light', '350 ml', 'Lata', 4.00
);

INSERT INTO tb_producto VALUES 
('1040109', 'Light', 'Asaí', '350 ml', 'Lata', 5.60), 
('1040110', 'Light', 'Manzana', '350 ml', 'Lata', 6.00),
('1040111', 'Light', 'Mango', '350 ml', 'Lata', 3.50);

USE ventas_jugos;

SELECT * FROM jugos_ventas.tabla_de_productos;

SELECT CODIGO_DEL_PRODUCTO AS CODIGO, NOMBRE_DEL_PRODUCTO AS DESCRIPCION,
SABOR, TAMANO, ENVASE, PRECIO_DE_LISTA AS PRECIO_LISTA 
FROM jugos_ventas.tabla_de_productos
WHERE CODIGO_DEL_PRODUCTO NOT IN (SELECT CODIGO FROM tb_producto);

INSERT INTO tb_producto
SELECT CODIGO_DEL_PRODUCTO AS CODIGO, NOMBRE_DEL_PRODUCTO AS DESCRIPCION,
SABOR, TAMANO, ENVASE, PRECIO_DE_LISTA AS PRECIO_LISTA 
FROM jugos_ventas.tabla_de_productos
WHERE CODIGO_DEL_PRODUCTO NOT IN (SELECT CODIGO FROM tb_producto);

SELECT * FROM tb_producto;

USE ventas_jugos;

SELECT * FROM tb_cliente;

SELECT * FROM jugos_ventas.tabla_de_clientes;

SELECT DNI, NOMBRE, DIRECCION_1 AS DIRECCION,
BARRIO, CIUDAD, ESTADO, CP, FECHA_DE_NACIMIENTO 
AS FECHA_NACIMIENTO, EDAD, SEXO, LIMITE_DE_CREDITO
AS LIMITE_CREDITO, VOLUMEN_DE_COMPRA AS VOLUMEN_COMPRA,
PRIMERA_COMPRA FROM jugos_ventas.tabla_de_clientes
WHERE DNI NOT IN (SELECT DNI FROM tb_cliente);

INSERT INTO tb_cliente
SELECT DNI, NOMBRE, DIRECCION_1 AS DIRECCION,
BARRIO, CIUDAD, ESTADO, CP, FECHA_DE_NACIMIENTO 
AS FECHA_NACIMIENTO, EDAD, SEXO, LIMITE_DE_CREDITO
AS LIMITE_CREDITO, VOLUMEN_DE_COMPRA AS VOLUMEN_COMPRA,
PRIMERA_COMPRA FROM jugos_ventas.tabla_de_clientes
WHERE DNI NOT IN (SELECT DNI FROM tb_cliente);





SELECT * FROM tb_producto;

UPDATE tb_producto SET PRECIO_LISTA= 5 WHERE CODIGO = '1000889';

UPDATE tb_producto SET DESCRIPCION= 'Sabor de la Montaña',
TAMANO= '1 Litro', ENVASE = 'Botella PET' WHERE 
CODIGO = '1000889';

SELECT * FROM tb_cliente;

UPDATE tb_cliente SET VOLUMEN_COMPRA = VOLUMEN_COMPRA/10;

SELECT * FROM tb_vendedor;

SELECT * FROM jugos_ventas.tabla_de_vendedores;

SELECT * FROM tb_vendedor A
INNER JOIN
jugos_ventas.tabla_de_vendedores B
ON A.MATRICULA = SUBSTRING(B.MATRICULA,3,3);

UPDATE tb_vendedor A
INNER JOIN
jugos_ventas.tabla_de_vendedores B
ON A.MATRICULA = SUBSTRING(B.MATRICULA,3,3)
SET A.DE_VACACIONES = B.VACACIONES;

INSERT INTO tb_producto (CODIGO,DESCRIPCION,SABOR,TAMANO,ENVASE,PRECIO_LISTA) 
  VALUES ('1001001','Sabor Alpino','Mango','700 ml','Botella',7.50),
         ('1001000','Sabor Alpino','Melón','700 ml','Botella',7.50),
         ('1001002','Sabor Alpino','Guanábana','700 ml','Botella',7.50),
         ('1001003','Sabor Alpino','Mandarina','700 ml','Botella',7.50),
         ('1001004','Sabor Alpino','Banana','700 ml','Botella',7.50),
         ('1001005','Sabor Alpino','Asaí','700 ml','Botella',7.50),
         ('1001006','Sabor Alpino','Mango','1 Litro','Botella',7.50),
         ('1001007','Sabor Alpino','Melón','1 Litro','Botella',7.50),
         ('1001008','Sabor Alpino','Guanábana','1 Litro','Botella',7.50),
         ('1001009','Sabor Alpino','Mandarina','1 Litro','Botella',7.50),
         ('1001010','Sabor Alpino','Banana','1 Litro','Botella',7.50),
         ('1001011','Sabor Alpino','Asaí','1 Litro','Botella',7.50);
         
SELECT * FROM tb_producto WHERE DESCRIPCION = 'Sabor Alpino';
         
DELETE FROM tb_producto WHERE CODIGO = '1001000';

DELETE FROM tb_producto WHERE TAMANO = '1 Litro';

SELECT CODIGO_DEL_PRODUCTO FROM jugos_ventas.tabla_de_productos;

SELECT CODIGO FROM tb_producto
WHERE CODIGO NOT IN (SELECT CODIGO_DEL_PRODUCTO 
FROM jugos_ventas.tabla_de_productos);

DELETE FROM tb_producto
WHERE CODIGO NOT IN (SELECT CODIGO_DEL_PRODUCTO 
FROM jugos_ventas.tabla_de_productos);

CREATE TABLE `tb_producto2` (
  `CODIGO` varchar(10) NOT NULL,
  `DESCRIPCION` varchar(100) DEFAULT NULL,
  `SABOR` varchar(50) DEFAULT NULL,
  `TAMANO` varchar(50) DEFAULT NULL,
  `ENVASE` varchar(50) DEFAULT NULL,
  `PRECIO_LISTA` float DEFAULT NULL,
  PRIMARY KEY (`CODIGO`)
);

SELECT * FROM tb_producto2;

INSERT INTO tb_producto2
SELECT * FROM tb_producto;

UPDATE tb_producto2 SET PRECIO_LISTA = PRECIO_LISTA* 1.15;

DELETE FROM tb_producto2;

INSERT INTO `ventas_jugos`.`tb_vendedor`
(`MATRICULA`,
`NOMBRE`,
`BARRIO`,
`COMISION`,
`FECHA_ADMISION`,
`DE_VACACIONES`)
VALUES
('256',
'Fernando Ruiz',
'Oblatos',
0.1,
'2015-06-14',
0);

SELECT * FROM tb_vendedor;

START TRANSACTION;

INSERT INTO `ventas_jugos`.`tb_vendedor`
(`MATRICULA`,
`NOMBRE`,
`BARRIO`,
`COMISION`,
`FECHA_ADMISION`,
`DE_VACACIONES`)
VALUES
('257',
'Fernando Rojas',
'Oblatos',
0.1,
'2015-06-14',
0);

INSERT INTO `ventas_jugos`.`tb_vendedor`
(`MATRICULA`,
`NOMBRE`,
`BARRIO`,
`COMISION`,
`FECHA_ADMISION`,
`DE_VACACIONES`)
VALUES
('258',
'David Rojas',
'Del Valle',
0.15,
'2015-06-14',
0);

UPDATE tb_vendedor SET COMISION = COMISION * 1.05;

ROLLBACK;

COMMIT;






CREATE TABLE tb_identificacion(
ID INT AUTO_INCREMENT NOT NULL,
DESCRIPCION VARCHAR(50) NULL,
PRIMARY KEY(ID)
);

SELECT * FROM tb_identificacion;

INSERT INTO tb_identificacion(DESCRIPCION)
VALUES ('Cliente A');
INSERT INTO tb_identificacion(DESCRIPCION)
VALUES ('Cliente B');
INSERT INTO tb_identificacion(DESCRIPCION)
VALUES ('Cliente C');
INSERT INTO tb_identificacion(DESCRIPCION)
VALUES ('Cliente D');
INSERT INTO tb_identificacion(DESCRIPCION)
VALUES ('Cliente E');

DELETE FROM tb_identificacion WHERE ID= 6;

INSERT INTO tb_identificacion(DESCRIPCION)
VALUES ('Cliente G');
INSERT INTO tb_identificacion(ID, DESCRIPCION)
VALUES (100, 'Cliente G');
INSERT INTO tb_identificacion(DESCRIPCION)
VALUES ('Cliente H');
INSERT INTO tb_identificacion(ID, DESCRIPCION)
VALUES (NULL, 'Cliente I');

CREATE TABLE tb_default(
ID INT AUTO_INCREMENT,
DESCRIPCION VARCHAR(50) NOT NULL,
DIRECCION VARCHAR(100) NULL,
CIUDAD VARCHAR(50) DEFAULT 'Monterrey',
FECHA_CREACION TIMESTAMP DEFAULT CURRENT_TIMESTAMP(),
PRIMARY KEY(ID)
);

INSERT INTO tb_default 
(DESCRIPCION, DIRECCION, CIUDAD, FECHA_CREACION)
VALUES ('Cliente X', 'Calle Sol, 525', 'Cancún', '2021-01-01');

SELECT * FROM tb_default;

INSERT INTO tb_default 
(DESCRIPCION)
VALUES ('Cliente Y');

CREATE TABLE tb_facturacion(
FECHA DATE NULL,
VENTA_TOTAL FLOAT
);

SELECT * FROM tb_facturacion;

CREATE TABLE `tb_items_facturas1` (
  `NUMERO` varchar(5) NOT NULL,
  `CODIGO` varchar(10) NOT NULL,
  `CANTIDAD` int DEFAULT NULL,
  `PRECIO` float DEFAULT NULL,
  PRIMARY KEY (`NUMERO`,`CODIGO`),
  KEY `FK_PRODUCTO1` (`CODIGO`),
  CONSTRAINT `FK_FACTURA1` FOREIGN KEY (`NUMERO`) REFERENCES `tb_factura` (`NUMERO`),
  CONSTRAINT `FK_PRODUCTO1` FOREIGN KEY (`CODIGO`) REFERENCES `tb_producto` (`CODIGO`)
) ;

SELECT * FROM tb_items_facturas1;
SELECT * FROM tb_factura1;
SELECT * FROM tb_cliente;
SELECT * FROM tb_vendedor;
SELECT * FROM tb_producto;

INSERT INTO tb_factura1 
VALUES('0100', '2021-01-01', '1471156710', '235', 0.10 );
INSERT INTO tb_items_facturas1
VALUES('0100', '1002767', 100, 25),
('0100', '1004327', 200, 25),
('0100', '1013793', 300, 25);

SELECT A.FECHA, SUM(B.CANTIDAD * B.PRECIO) AS VENTA_TOTAL
FROM tb_factura1 A
INNER JOIN
tb_items_facturas1 B
ON A.NUMERO = B.NUMERO
GROUP BY A.FECHA;

INSERT INTO tb_factura1 
VALUES('0101', '2021-01-01', '1471156710', '235', 0.10 );
INSERT INTO tb_items_facturas1
VALUES('0101', '1002767', 100, 25),
('0101', '1004327', 200, 25),
('0101', '1013793', 300, 25);

INSERT INTO tb_factura1 
VALUES('0102', '2021-01-01', '1471156710', '235', 0.10 );
INSERT INTO tb_items_facturas1
VALUES('0102', '1002767', 200, 25),
('0102', '1004327', 300, 25),
('0102', '1013793', 400, 25);


DELIMITER //
CREATE TRIGGER TG_FACTURACION_INSERT 
AFTER INSERT ON tb_items_facturas1
FOR EACH ROW BEGIN
  DELETE FROM tb_facturacion;
  INSERT INTO tb_facturacion
  SELECT A.FECHA, SUM(B.CANTIDAD * B.PRECIO) AS VENTA_TOTAL
  FROM tb_factura1 A
  INNER JOIN
  tb_items_facturas1 B
  ON A.NUMERO = B.NUMERO
  GROUP BY A.FECHA;
END //

INSERT INTO tb_factura1 
VALUES('0103', '2021-01-01', '1471156710', '235', 0.10 );
INSERT INTO tb_items_facturas1
VALUES('0103', '1002767', 200, 25),
('0103', '1004327', 300, 25),
('0103', '1013793', 400, 25);

SELECT * FROM tb_facturacion;

INSERT INTO tb_factura1 
VALUES('0104', '2021-01-01', '1471156710', '235', 0.10 );
INSERT INTO tb_items_facturas1
VALUES('0104', '1002767', 200, 25),
('0104', '1004327', 400, 30),
('0104', '1013793', 500, 25);

SELECT * FROM tb_facturacion;
SELECT * FROM tb_factura1;
SELECT * FROM tb_items_facturas1;

UPDATE tb_items_facturas1 SET CANTIDAD = 600
WHERE NUMERO = '0101' AND CODIGO = '1002767';

DELETE FROM tb_items_facturas1
WHERE NUMERO = '0104' AND CODIGO = '1004327';

DELIMITER //
CREATE TRIGGER TG_FACTURACION_DELETE
AFTER DELETE ON tb_items_facturas1
FOR EACH ROW BEGIN
  DELETE FROM tb_facturacion;
  INSERT INTO tb_facturacion
  SELECT A.FECHA, SUM(B.CANTIDAD * B.PRECIO) AS VENTA_TOTAL
  FROM tb_factura1 A
  INNER JOIN
  tb_items_facturas1 B
  ON A.NUMERO = B.NUMERO
  GROUP BY A.FECHA;
END //

DELIMITER //
CREATE TRIGGER TG_FACTURACION_UPDATE
AFTER UPDATE ON tb_items_facturas1
FOR EACH ROW BEGIN
  DELETE FROM tb_facturacion;
  INSERT INTO tb_facturacion
  SELECT A.FECHA, SUM(B.CANTIDAD * B.PRECIO) AS VENTA_TOTAL
  FROM tb_factura1 A
  INNER JOIN
  tb_items_facturas1 B
  ON A.NUMERO = B.NUMERO
  GROUP BY A.FECHA;
END //


UPDATE tb_items_facturas1 SET CANTIDAD = 800
WHERE NUMERO = '0101' AND CODIGO = '1002767';

DELETE FROM tb_items_facturas1
WHERE NUMERO = '0104' AND CODIGO = '1013793';