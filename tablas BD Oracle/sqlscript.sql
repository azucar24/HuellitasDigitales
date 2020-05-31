REM   Script: Proyecto_creacion_tablas
REM   Creacion de todas las tablas para el proyecto

CREATE TABLE presentaciones( 
   presentaciones_id            VARCHAR(20) not null constraint presentacion_pk primary key, 
   presentacion_nombre          VARCHAR(25), 
   presentacion_tipo_proyeccion VARCHAR(25), 
   presentacion_estado          VARCHAR(3) 
);

drop table "PRESENTACIONES" cascade constraints;

CREATE TABLE presentaciones( 
   presentaciones_id            VARCHAR(20) not null constraint presentacion_pk primary key, 
   presentacion_nombre          VARCHAR(25), 
   presentacion_tipo_proyeccion VARCHAR(25), 
   presentacion_estado          VARCHAR(3) 
);

CREATE TABLE salas( 
   sala_capacidad NUMBER(11), 
   sala_nombre    VARCHAR(50) not null constraint salas_pk primary key 
);

CREATE TABLE cartelera( 
   cartelera_id            VARCHAR(75) not null constraint cartelera_pk  primary key, 
   nombre_presentacion_id  VARCHAR(20), 
   hora_exhibicion         VARCHAR(15), 
   fecha_exhibicion        VARCHAR(15), 
   sala_exhibicion_id      VARCHAR(50), 
   sala_capacidad_restante NUMBER(11), 
   cartelera_estado        VARCHAR(3) 
);

alter table cartelera add constraint cart_exhibi_fk foreign key (nombre_presentacion_id) references presentaciones (presentaciones_id);

alter table cartelera add constraint cart_sala_fk foreign key (sala_exhibicion_id) references salas (sala_nombre);

CREATE TABLE roles_clientes( 
   rol_code VARCHAR(5) not null constraint rol_clientes_pk primary key, 
   rol_name VARCHAR(75)  
);

CREATE TABLE clientes( 
   cliente_clave    VARCHAR(15), 
   cliente_correo   VARCHAR(50), 
   cliente_nombre   VARCHAR(50), 
   cliente_sexo     CHAR(1), 
   cliente_telefono NUMBER(8), 
   cliente_user     VARCHAR(15), 
   cliente_rol_id   VARCHAR(5), 
   cliente_estado   VARCHAR(3), 
   cliente_dui      VARCHAR(9) not null constraint clientes_pk primary key 
);

alter table clientes add constraint clientes_rol_fk foreign key (cliente_rol_id) references roles_clientes(rol_code);

CREATE TABLE recursos_fisicos( 
   recursosf_id   NUMBER(11) not null constraint recursos_fisicos_pk primary key, 
   recurso_name   VARCHAR(50), 
   sala_asignada  VARCHAR(50), 
   recurso_codigo VARCHAR(20), 
   recurso_estado VARCHAR(3) 
);

alter table recursos_fisicos add constraint recursos_fisicos_fk foreign key (sala_asignada) references salas (sala_nombre);

CREATE TABLE reservaciones( 
   reservacion_id            VARCHAR(100) not null constraint reservaciones_pk primary key, 
   reservacion_cant_personas NUMBER(11), 
   reservacion_estado        VARCHAR(3), 
   reservacion_dui_cliente   VARCHAR(9), 
   reservacion_cartelera_id  VARCHAR(75) 
);

alter table reservaciones add constraint reservaciones_clientes_fk foreign key (reservacion_dui_cliente) references clientes (cliente_dui);

alter table reservaciones add constraint reservaciones_carte_fk foreign key (reservacion_cartelera_id) references cartelera(cartelera_id);

CREATE TABLE usuarios( 
   usuario_clave    VARCHAR(15), 
   usuario_correo   VARCHAR(50), 
   usuario_nombre   VARCHAR(50), 
   usuario_rol      VARCHAR(15), 
   usuario_sexo     CHAR(1), 
   usuario_telefono NUMBER(8), 
   usuario_user     VARCHAR(15), 
   usuario_estado   VARCHAR(3), 
   usuario_dui      VARCHAR(11) not null constraint usuarios_pk primary key 
);

CREATE TABLE bitacora( 
   bitacora_id             NUMBER(11) not null constraint bitacora_pk primary key, 
   accion                  VARCHAR(25), 
   tabla_afectada          VARCHAR(25), 
   responsable             VARCHAR(50), 
   fecha_accion            DATE default sysdate, 
   registro_anterior       VARCHAR(300), 
   llave_registro_afectado VARCHAR(75) 
);

alter table bitacora add constraint bitacora_usuarios_fk foreign key (responsable) references usuarios(usuario_dui);

create or replace PROCEDURE "UDP_USUARIOS"( 
   U_clave usuarios.usuario_clave%type, 
   U_correo usuarios.usuario_correo%type, 
   U_nombre usuarios.usuario_nombre%type, 
   U_sexo usuarios.usuario_sexo%type, 
   U_telefono usuarios.usuario_telefono%type, 
   U_user usuarios.usuario_user%type, 
   U_estado usuarios.usuario_estado 
   U_dui usuarios.usuario_dui%type, 
   MENSAJE OUT varchar) 
AS 
    --VALIDANDO REQUISITOS 
    validation_usuario usuarios%ROWTYPE; 
BEGIN 
   --Sentenses 
   if LENGTH(C_dui) = 9 then 
        SELECT * INTO validation_usuario FROM usuarios WHERE usuario_dui=U_dui; 
        --Validando parametros 
        UPDATE usuarios SET usuario_clave=NVL(U_clave, usuario_clave), usuario_correo=NVL(U_correo, usuario_correo), usuario_nombre=NVL(U_nombre, usuario_nombre), 
        usuario_sexo=NVL(U_sexo, usuario_sexo), usuario_telefono=NVL(U_telefono, usuario_telefono), usuario_user=NVL(U_user, usuario_user),  
        usuario_estado=NVL(U_estado, usuario_estado) WHERE cliente_dui = validation_usuario.usuario_dui; 
        IF SQL%ROWCOUNT = 0 THEN 
            MENSAJE := 'Error en el proceso de update'; 
            DBMS_OUTPUT.PUT_LINE(MENSAJE); 
        ELSE 
            MENSAJE := 'Actualizacion del usuario exitoso'; 
             DBMS_OUTPUT.PUT_LINE(MENSAJE); 
        END IF; 
        COMMIT; 
   end if; 
EXCEPTION 
    WHEN NO_DATA_FOUND THEN 
        MENSAJE := 'No señor, ese dui de usuario no existe'; 
        DBMS_OUTPUT.PUT_LINE(MENSAJE); 
    ROLLBACK; 
END UDP_USUARIOS;
/

create or replace PROCEDURE "UDP_USUARIOS"( 
   U_clave usuarios.usuario_clave%type, 
   U_correo usuarios.usuario_correo%type, 
   U_nombre usuarios.usuario_nombre%type, 
   U_sexo usuarios.usuario_sexo%type, 
   U_telefono usuarios.usuario_telefono%type, 
   U_user usuarios.usuario_user%type, 
   U_estado usuarios.usuario_estado 
   U_dui usuarios.usuario_dui%type, 
   MENSAJE OUT varchar) 
AS 
    --VALIDANDO REQUISITOS 
    validation_usuario usuarios%ROWTYPE; 
BEGIN 
   --Sentenses 
   if LENGTH(C_dui) = 9 then 
        SELECT * INTO validation_usuario FROM usuarios WHERE usuario_dui=U_dui; 
        --Validando parametros 
        UPDATE usuarios SET usuario_clave=NVL(U_clave, usuario_clave), usuario_correo=NVL(U_correo, usuario_correo), usuario_nombre=NVL(U_nombre, usuario_nombre), 
        usuario_sexo=NVL(U_sexo, usuario_sexo), usuario_telefono=NVL(U_telefono, usuario_telefono), usuario_user=NVL(U_user, usuario_user),  
        usuario_estado=NVL(U_estado, usuario_estado) WHERE usuario_dui = validation_usuario.usuario_dui; 
        IF SQL%ROWCOUNT = 0 THEN 
            MENSAJE := 'Error en el proceso de update'; 
            DBMS_OUTPUT.PUT_LINE(MENSAJE); 
        ELSE 
            MENSAJE := 'Actualizacion del usuario exitoso'; 
             DBMS_OUTPUT.PUT_LINE(MENSAJE); 
        END IF; 
        COMMIT; 
   end if; 
EXCEPTION 
    WHEN NO_DATA_FOUND THEN 
        MENSAJE := 'No señor, ese dui de usuario no existe'; 
        DBMS_OUTPUT.PUT_LINE(MENSAJE); 
    ROLLBACK; 
END UDP_USUARIOS;
/

create or replace PROCEDURE "UDP_USUARIOS"( 
   U_clave usuarios.usuario_clave%type, 
   U_correo usuarios.usuario_correo%type, 
   U_nombre usuarios.usuario_nombre%type, 
   U_sexo usuarios.usuario_sexo%type, 
   U_telefono usuarios.usuario_telefono%type, 
   U_user usuarios.usuario_user%type, 
   U_estado usuarios.usuario_estado, 
   U_dui usuarios.usuario_dui%type, 
   MENSAJE OUT varchar) 
AS 
    --VALIDANDO REQUISITOS 
    validation_usuario usuarios%ROWTYPE; 
BEGIN 
   --Sentenses 
   if LENGTH(C_dui) = 9 then 
        SELECT * INTO validation_usuario FROM usuarios WHERE usuario_dui=U_dui; 
        --Validando parametros 
        UPDATE usuarios SET usuario_clave=NVL(U_clave, usuario_clave), usuario_correo=NVL(U_correo, usuario_correo), usuario_nombre=NVL(U_nombre, usuario_nombre), 
        usuario_sexo=NVL(U_sexo, usuario_sexo), usuario_telefono=NVL(U_telefono, usuario_telefono), usuario_user=NVL(U_user, usuario_user),  
        usuario_estado=NVL(U_estado, usuario_estado) WHERE usuario_dui = validation_usuario.usuario_dui; 
        IF SQL%ROWCOUNT = 0 THEN 
            MENSAJE := 'Error en el proceso de update'; 
            DBMS_OUTPUT.PUT_LINE(MENSAJE); 
        ELSE 
            MENSAJE := 'Actualizacion del usuario exitoso'; 
             DBMS_OUTPUT.PUT_LINE(MENSAJE); 
        END IF; 
        COMMIT; 
   end if; 
EXCEPTION 
    WHEN NO_DATA_FOUND THEN 
        MENSAJE := 'No señor, ese dui de usuario no existe'; 
        DBMS_OUTPUT.PUT_LINE(MENSAJE); 
    ROLLBACK; 
END UDP_USUARIOS;
/

create or replace PROCEDURE "UDP_USUARIOS"( 
   U_clave usuarios.usuario_clave%type, 
   U_correo usuarios.usuario_correo%type, 
   U_nombre usuarios.usuario_nombre%type, 
   U_sexo usuarios.usuario_sexo%type, 
   U_telefono usuarios.usuario_telefono%type, 
   U_user usuarios.usuario_user%type, 
   U_estado usuarios.usuario_estado%type, 
   U_dui usuarios.usuario_dui%type, 
   MENSAJE OUT varchar) 
AS 
    --VALIDANDO REQUISITOS 
    validation_usuario usuarios%ROWTYPE; 
BEGIN 
   --Sentenses 
   if LENGTH(C_dui) = 9 then 
        SELECT * INTO validation_usuario FROM usuarios WHERE usuario_dui=U_dui; 
        --Validando parametros 
        UPDATE usuarios SET usuario_clave=NVL(U_clave, usuario_clave), usuario_correo=NVL(U_correo, usuario_correo), usuario_nombre=NVL(U_nombre, usuario_nombre), 
        usuario_sexo=NVL(U_sexo, usuario_sexo), usuario_telefono=NVL(U_telefono, usuario_telefono), usuario_user=NVL(U_user, usuario_user),  
        usuario_estado=NVL(U_estado, usuario_estado) WHERE usuario_dui = validation_usuario.usuario_dui; 
        IF SQL%ROWCOUNT = 0 THEN 
            MENSAJE := 'Error en el proceso de update'; 
            DBMS_OUTPUT.PUT_LINE(MENSAJE); 
        ELSE 
            MENSAJE := 'Actualizacion del usuario exitoso'; 
             DBMS_OUTPUT.PUT_LINE(MENSAJE); 
        END IF; 
        COMMIT; 
   end if; 
EXCEPTION 
    WHEN NO_DATA_FOUND THEN 
        MENSAJE := 'No señor, ese dui de usuario no existe'; 
        DBMS_OUTPUT.PUT_LINE(MENSAJE); 
    ROLLBACK; 
END UDP_USUARIOS;
/

create or replace PROCEDURE "UDP_USUARIOS"( 
   U_clave usuarios.usuario_clave%type, 
   U_correo usuarios.usuario_correo%type, 
   U_nombre usuarios.usuario_nombre%type, 
   U_sexo usuarios.usuario_sexo%type, 
   U_telefono usuarios.usuario_telefono%type, 
   U_user usuarios.usuario_user%type, 
   U_estado usuarios.usuario_estado%type, 
   U_dui usuarios.usuario_dui%type, 
   MENSAJE OUT varchar) 
AS 
    --VALIDANDO REQUISITOS 
    validation_usuario usuarios%ROWTYPE; 
BEGIN 
   --Sentenses 
   if LENGTH(U_dui) = 9 then 
        SELECT * INTO validation_usuario FROM usuarios WHERE usuario_dui=U_dui; 
        --Validando parametros 
        UPDATE usuarios SET usuario_clave=NVL(U_clave, usuario_clave), usuario_correo=NVL(U_correo, usuario_correo), usuario_nombre=NVL(U_nombre, usuario_nombre), 
        usuario_sexo=NVL(U_sexo, usuario_sexo), usuario_telefono=NVL(U_telefono, usuario_telefono), usuario_user=NVL(U_user, usuario_user),  
        usuario_estado=NVL(U_estado, usuario_estado) WHERE usuario_dui = validation_usuario.usuario_dui; 
        IF SQL%ROWCOUNT = 0 THEN 
            MENSAJE := 'Error en el proceso de update'; 
            DBMS_OUTPUT.PUT_LINE(MENSAJE); 
        ELSE 
            MENSAJE := 'Actualizacion del usuario exitoso'; 
             DBMS_OUTPUT.PUT_LINE(MENSAJE); 
        END IF; 
        COMMIT; 
   end if; 
EXCEPTION 
    WHEN NO_DATA_FOUND THEN 
        MENSAJE := 'No señor, ese dui de usuario no existe'; 
        DBMS_OUTPUT.PUT_LINE(MENSAJE); 
    ROLLBACK; 
END UDP_USUARIOS;
/

create or replace PROCEDURE "CREAR_USUARIO"( 
    U_clave usuarios.usuario_clave%type, 
    U_correo usuarios.usuario_correo%type, 
    U_nombre usuarios.usuario_nombre%type, 
    U_sexo usuarios.usuario_sexo%type, 
    U_telefono usuarios.usuario_telefono%type, 
    U_user usuarios.usuario_user%type, 
    U_dui usuarios.usuario_dui%type, 
    MENSAJE OUT varchar) 
AS 
BEGIN 
    --DBMS_OUTPUT.PUT_LINE(usuario_dui); 
    --Sentenses 
    INSERT INTO usuarios VALUES(U_clave, U_correo, U_nombre, U_sexo, U_telefono,  U_user, 'on' , U_dui); 
    MENSAJE := 'Agregado exitosamente'; 
    DBMS_OUTPUT.PUT_LINE(MENSAJE); 
    COMMIT; 
EXCEPTION 
    WHEN OTHERS THEN 
        MENSAJE := 'El # de DUi ya existe ';	 
        DBMS_OUTPUT.PUT_LINE(MENSAJE); 
        ROLLBACK; 
END CREAR_USUARIO;
/

drop table "USUARIOS" cascade constraints;

CREATE TABLE presentaciones( 
   presentaciones_id            VARCHAR(20) not null constraint presentacion_pk primary key, 
   presentacion_nombre          VARCHAR(25), 
   presentacion_tipo_proyeccion VARCHAR(25), 
   presentacion_estado          VARCHAR(3) 
);

CREATE TABLE salas( 
   sala_capacidad NUMBER(11), 
   sala_nombre    VARCHAR(50) not null constraint salas_pk primary key 
);

CREATE TABLE cartelera( 
   cartelera_id            VARCHAR(75) not null constraint cartelera_pk  primary key, 
   nombre_presentacion_id  VARCHAR(20), 
   hora_exhibicion         VARCHAR(15), 
   fecha_exhibicion        VARCHAR(15), 
   sala_exhibicion_id      VARCHAR(50), 
   sala_capacidad_restante NUMBER(11), 
   cartelera_estado        VARCHAR(3) 
);

alter table cartelera add constraint cart_exhibi_fk foreign key (nombre_presentacion_id) references presentaciones (presentaciones_id);

alter table cartelera add constraint cart_sala_fk foreign key (sala_exhibicion_id) references salas (sala_nombre);

CREATE TABLE roles_clientes( 
   rol_code VARCHAR(5) not null constraint rol_clientes_pk primary key, 
   rol_name VARCHAR(75)  
);

CREATE TABLE clientes( 
   cliente_clave    VARCHAR(15), 
   cliente_correo   VARCHAR(50), 
   cliente_nombre   VARCHAR(50), 
   cliente_sexo     CHAR(1), 
   cliente_telefono NUMBER(8), 
   cliente_user     VARCHAR(15), 
   cliente_rol_id   VARCHAR(5), 
   cliente_estado   VARCHAR(3), 
   cliente_dui      VARCHAR(9) not null constraint clientes_pk primary key 
);

alter table clientes add constraint clientes_rol_fk foreign key (cliente_rol_id) references roles_clientes(rol_code);

CREATE TABLE recursos_fisicos( 
   recursosf_id   NUMBER(11) not null constraint recursos_fisicos_pk primary key, 
   recurso_name   VARCHAR(50), 
   sala_asignada  VARCHAR(50), 
   recurso_codigo VARCHAR(20), 
   recurso_estado VARCHAR(3) 
);

alter table recursos_fisicos add constraint recursos_fisicos_fk foreign key (sala_asignada) references salas (sala_nombre);

CREATE TABLE reservaciones( 
   reservacion_id            VARCHAR(100) not null constraint reservaciones_pk primary key, 
   reservacion_cant_personas NUMBER(11), 
   reservacion_estado        VARCHAR(3), 
   reservacion_dui_cliente   VARCHAR(9), 
   reservacion_cartelera_id  VARCHAR(75) 
);

alter table reservaciones add constraint reservaciones_clientes_fk foreign key (reservacion_dui_cliente) references clientes (cliente_dui);

alter table reservaciones add constraint reservaciones_carte_fk foreign key (reservacion_cartelera_id) references cartelera(cartelera_id);

CREATE TABLE usuarios( 
   usuario_clave    VARCHAR(15), 
   usuario_correo   VARCHAR(50), 
   usuario_nombre   VARCHAR(50), 
   usuario_sexo     CHAR(1), 
   usuario_telefono NUMBER(8), 
   usuario_user     VARCHAR(15), 
   usuario_estado   VARCHAR(3), 
   usuario_dui      VARCHAR(11) not null constraint usuarios_pk primary key 
);

CREATE TABLE bitacora( 
   bitacora_id             NUMBER(11) not null constraint bitacora_pk primary key, 
   accion                  VARCHAR(25), 
   tabla_afectada          VARCHAR(25), 
   responsable             VARCHAR(50), 
   fecha_accion            DATE default sysdate, 
   registro_anterior       VARCHAR(300), 
   llave_registro_afectado VARCHAR(75) 
);

alter table bitacora add constraint bitacora_usuarios_fk foreign key (responsable) references usuarios(usuario_dui);

CREATE TABLE presentaciones( 
   presentaciones_id            VARCHAR(20) not null constraint presentacion_pk primary key, 
   presentacion_nombre          VARCHAR(25), 
   presentacion_tipo_proyeccion VARCHAR(25), 
   presentacion_estado          VARCHAR(3) 
);

CREATE TABLE salas( 
   sala_capacidad NUMBER(11), 
   sala_nombre    VARCHAR(50) not null constraint salas_pk primary key 
);

CREATE TABLE cartelera( 
   cartelera_id            VARCHAR(75) not null constraint cartelera_pk  primary key, 
   nombre_presentacion_id  VARCHAR(20), 
   hora_exhibicion         VARCHAR(15), 
   fecha_exhibicion        VARCHAR(15), 
   sala_exhibicion_id      VARCHAR(50), 
   sala_capacidad_restante NUMBER(11), 
   cartelera_estado        VARCHAR(3) 
);

alter table cartelera add constraint cart_exhibi_fk foreign key (nombre_presentacion_id) references presentaciones (presentaciones_id);

alter table cartelera add constraint cart_sala_fk foreign key (sala_exhibicion_id) references salas (sala_nombre);

CREATE TABLE roles_clientes( 
   rol_code VARCHAR(5) not null constraint rol_clientes_pk primary key, 
   rol_name VARCHAR(75)  
);

CREATE TABLE clientes( 
   cliente_clave    VARCHAR(15), 
   cliente_correo   VARCHAR(50), 
   cliente_nombre   VARCHAR(50), 
   cliente_sexo     CHAR(1), 
   cliente_telefono NUMBER(8), 
   cliente_user     VARCHAR(15), 
   cliente_rol_id   VARCHAR(5), 
   cliente_estado   VARCHAR(3), 
   cliente_dui      VARCHAR(9) not null constraint clientes_pk primary key 
);

alter table clientes add constraint clientes_rol_fk foreign key (cliente_rol_id) references roles_clientes(rol_code);

CREATE TABLE recursos_fisicos( 
   recursosf_id   NUMBER(11) not null constraint recursos_fisicos_pk primary key, 
   recurso_name   VARCHAR(50), 
   sala_asignada  VARCHAR(50), 
   recurso_codigo VARCHAR(20), 
   recurso_estado VARCHAR(3) 
);

alter table recursos_fisicos add constraint recursos_fisicos_fk foreign key (sala_asignada) references salas (sala_nombre);

CREATE TABLE reservaciones( 
   reservacion_id            VARCHAR(100) not null constraint reservaciones_pk primary key, 
   reservacion_cant_personas NUMBER(11), 
   reservacion_estado        VARCHAR(3), 
   reservacion_dui_cliente   VARCHAR(9), 
   reservacion_cartelera_id  VARCHAR(75) 
);

alter table reservaciones add constraint reservaciones_clientes_fk foreign key (reservacion_dui_cliente) references clientes (cliente_dui);

alter table reservaciones add constraint reservaciones_carte_fk foreign key (reservacion_cartelera_id) references cartelera(cartelera_id);

CREATE TABLE usuarios( 
   usuario_clave    VARCHAR(15), 
   usuario_correo   VARCHAR(50), 
   usuario_nombre   VARCHAR(50), 
   usuario_sexo     CHAR(1), 
   usuario_telefono NUMBER(8), 
   usuario_user     VARCHAR(15), 
   usuario_estado   VARCHAR(3), 
   usuario_dui      VARCHAR(11) not null constraint usuarios_pk primary key 
);

CREATE TABLE bitacora( 
   bitacora_id             NUMBER(11) not null constraint bitacora_pk primary key, 
   accion                  VARCHAR(25), 
   tabla_afectada          VARCHAR(25), 
   responsable             VARCHAR(50), 
   fecha_accion            DATE default sysdate, 
   registro_anterior       VARCHAR(300), 
   llave_registro_afectado VARCHAR(75) 
);

alter table bitacora add constraint bitacora_usuarios_fk foreign key (responsable) references usuarios(usuario_dui);

