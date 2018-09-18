CREATE DATABASE seguridad_bd;

USE seguridad_bd;

CREATE TABLE usuario
(
    usu_codigo int PRIMARY KEY AUTO_INCREMENT,
    usu_nickname VARCHAR(45),
    usu_password VARCHAR(45),
    usu_estado TINYINT(1)
);
CREATE UNIQUE INDEX usuario_usu_nickname_uindex ON usuario (usu_nickname);

CREATE TABLE relacion_usuario_perfil
(
    usu_codigo int,
    perf_codigo int,
    CONSTRAINT relacion_usuario_perfil_usuario_usu_codigo_fk FOREIGN KEY (usu_codigo) REFERENCES usuario (usu_codigo)
);

CREATE TABLE perfil_encabezado
(
    perf_cod_encabezado int PRIMARY KEY,
    perf_nombre VARCHAR(45)
);

ALTER TABLE relacion_usuario_perfil
ADD CONSTRAINT relacion_usuario_perfil_perfil_encabezado_perf_cod_encabezado_fk
FOREIGN KEY (perf_codigo) REFERENCES perfil_encabezado (perf_cod_encabezado);

CREATE TABLE perfil_detalle
(
    perf_cod_encabezado int,
    api_codigo int,
    ingresar TINYINT(1),
    editar TINYINT(1),
    guardar TINYINT(1),
    borrar TINYINT(1),
    buscar TINYINT(1),
    consultar TINYINT(1),
    imprimir TINYINT(1)
);

ALTER TABLE perfil_detalle
ADD CONSTRAINT perfil_detalle_perfil_encabezado_perf_cod_encabezado_fk
FOREIGN KEY (perf_cod_encabezado) REFERENCES perfil_encabezado (perf_cod_encabezado);

CREATE TABLE aplicacion
(
    api_codigo int PRIMARY KEY,
    api_descripcion VARCHAR(45),
    codigo_modulo int
);

ALTER TABLE perfil_detalle
ADD CONSTRAINT perfil_detalle_aplicacion_api_codigo_fk
FOREIGN KEY (api_codigo) REFERENCES aplicacion (api_codigo);

CREATE TABLE modulo
(
    modulo_codigo int PRIMARY KEY,
    modulo_nombre VARCHAR(45)
);

ALTER TABLE aplicacion
ADD CONSTRAINT aplicacion_modulo_modulo_codigo_fk
FOREIGN KEY (codigo_modulo) REFERENCES modulo (modulo_codigo);

CREATE TABLE bitacora
(
    bitacora_correlativo int PRIMARY KEY AUTO_INCREMENT,
    usuario_codigo int
);


















