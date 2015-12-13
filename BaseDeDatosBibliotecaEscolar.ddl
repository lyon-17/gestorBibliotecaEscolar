CREATE TABLE Administradores
  (
    usuario     VARCHAR(120) NOT NULL ,
    password    VARCHAR(120) NOT NULL ,
    usuarios_id INTEGER NOT NULL PRIMARY KEY
  );

CREATE TABLE Ejemplares
  (
    cod_ejemplar    VARCHAR(120) NOT NULL,
    estado          VARCHAR(120) NOT NULL ,
    libros_ISBN     VARCHAR(120) NOT NULL ,
    PRIMARY KEY (cod_ejemplar,libros_ISBN)
  );

CREATE TABLE Incidencias
  (
    id           INTEGER NOT NULL ,
    asunto       VARCHAR(120) ,
    descripcion  VARCHAR(250) ,
    index(prestamos_id),
    prestamos_id INTEGER NOT NULL PRIMARY KEY
  ) ;

CREATE TABLE Libros
  (
    ISBN            VARCHAR(120) NOT NULL PRIMARY KEY ,
    titulo          VARCHAR(120) NOT NULL ,
    autor           VARCHAR(120) NOT NULL ,
    paginas         INTEGER ,
    codigo          VARCHAR(120) ,
    fecha_publicacion INTEGER
  ) ;



CREATE TABLE Prestamos
  (
    id         INTEGER NOT NULL PRIMARY KEY,
    finalizado BOOLEAN NOT NULL,
    gratuito   BOOLEAN NOT NULL
  ) ;

CREATE TABLE HISTORIAL
(
  id INTEGER NOT NULL PRIMARY KEY,
  fecha TIMESTAMP NOT NULL,
  detalles VARCHAR(240) NOT NULL
)


CREATE  TABLE Usuarios
  (
    id         INTEGER NOT NULL PRIMARY KEY,
    DNI        VARCHAR(9) NOT NULL ,
    nombre     VARCHAR(120) NOT NULL,
    apellidos  VARCHAR(120) NOT NULL,
    domicilio  VARCHAR(255) NOT NULL,
    curso      VARCHAR(120) NOT NULL,
    n_contacto INTEGER NOT NULL,
    correo     VARCHAR(120) NOT NULL
  ) ;



CREATE TABLE ejemplares_prestamos
  (
    ejemplares_libros_ISBN VARCHAR(120) NOT NULL,
    ejemplares_cod_ejemplar VARCHAR(120) NOT NULL,
    fecha_inicio DATE,
    fecha_fin DATE,
    prestamos_id INTEGER NOT NULL,
    PRIMARY KEY(ejemplares_cod_ejemplar, prestamos_id)
  );


CREATE TABLE usuarios_prestamos
  (
    usuarios_id  INTEGER NOT NULL ,
    prestamos_id INTEGER NOT NULL ,
    PRIMARY KEY (usuarios_id,prestamos_id)
  );


ALTER TABLE Administradores ADD CONSTRAINT Administradores_Usuarios_FK FOREIGN
KEY ( usuarios_id ) REFERENCES Usuarios ( id ) ON
DELETE CASCADE ;

ALTER TABLE Ejemplares ADD CONSTRAINT Ejemplares_Libros_FK FOREIGN KEY (
libros_ISBN ) REFERENCES Libros ( ISBN ) ON
DELETE CASCADE ;

ALTER TABLE ejemplares_prestamos ADD CONSTRAINT FK_ASS_4 FOREIGN KEY (
ejemplares_cod_ejemplar ) REFERENCES Ejemplares ( cod_ejemplar ) ON
DELETE CASCADE ;

ALTER TABLE ejemplares_prestamos ADD CONSTRAINT FK_ASS_5 FOREIGN KEY (
prestamos_id ) REFERENCES Prestamos ( id ) ON
DELETE CASCADE ;

ALTER TABLE usuarios_prestamos ADD CONSTRAINT FK_ASS_7 FOREIGN KEY (
usuarios_id ) REFERENCES Usuarios ( id ) ON
DELETE CASCADE ;

ALTER TABLE usuarios_prestamos ADD CONSTRAINT FK_ASS_8 FOREIGN KEY (
prestamos_id ) REFERENCES Prestamos ( id ) ON
DELETE CASCADE ;

ALTER TABLE Incidencias ADD CONSTRAINT Incidencias_Prestamos_FK FOREIGN KEY (
prestamos_id ) REFERENCES Prestamos ( id ) ON
DELETE CASCADE ;
