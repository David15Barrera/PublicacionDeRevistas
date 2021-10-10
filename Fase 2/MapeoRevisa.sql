
CREATE SCHEMA IF NOT EXISTS WEBPAGEREV;
USE WEBPAGEREV;

CREATE TABLE IF NOT EXISTS PERSONA(
nombreUsuario VARCHAR(50) NOT NULL,
contrasena VARCHAR(50) NOT NULL,
tipo INT NOT NULL,
PRIMARY KEY (nombreUsuario)
);

CREATE TABLE IF NOT EXISTS PERFIL(
nomUsuario VARCHAR(50),
nombrePerfil VARCHAR(50),
temasInteres VARCHAR(50),
descripcion VARCHAR(50),
gustos VARCHAR(20),
PRIMARY KEY (nomUsuario),
FOREIGN KEY (nomUsuario) REFERENCES PERSONA(nombreUsuario)
);

CREATE TABLE IF NOT EXISTS REVISTA(
idRevista INT NOT NULL,
nombreAutor VARCHAR(50) NOT NULL,
nombreRevista CHAR(20) NOT NULL,
pdfrevista BLOB NOT NULL,
descripcion VARCHAR(60) NOT NULL,
autor CHAR(15) NOT NULL,
costoPorDia DOUBLE NOT NULL,
cuotaSuscripcion DOUBLE NOT NULL,
bloquearComentarios CHAR NOT NULL,
bloquearMeGusta CHAR NOT NULL,
bloquearSuscripciones CHAR NOT NULL,
fechaCreacion DATE NULL,
PRIMARY KEY (idRevista),
FOREIGN KEY (nombreAutor) REFERENCES PERSONA(NombreUsuario)
);


CREATE TABLE IF NOT EXISTS MEGUSTA(
idMegusta INT NOT NULL,
idRevista INT,
nombreUsuariolike VARCHAR(50) NOT NULL,
fecha DATETIME NOT NULL,
PRIMARY KEY (idMegusta),
FOREIGN KEY (nombreUsuariolike) REFERENCES PERSONA(nombreUsuario),
FOREIGN KEY (idRevista) REFERENCES REVISTA(idRevista)
);

CREATE TABLE IF NOT EXISTS COMENTARIO(
idComentario INT NOT NULL AUTO_INCREMENT,
idrevista INT NOT NULL,
nomUsuario VARCHAR(50) NOT NULL,
comentario VARCHAR(50) NOT NULL,
fechacomen DATETIME NOT NULL,
PRIMARY KEY (idComentario),
FOREIGN KEY (idrevista) REFERENCES REVISTA(idRevista),
FOREIGN KEY (nomUsuario) REFERENCES PERSONA(nombreUsuario)
);

CREATE TABLE IF NOT EXISTS CATEGORIA(
tipo VARCHAR(15) NOT NULL,
idRevista INT NOT NULL,
Contenido VARCHAR(100) NOT NULL,
PRIMARY KEY (tipo),
FOREIGN KEY (idRevista) REFERENCES REVISTA(idRevista)
);

CREATE TABLE IF NOT EXISTS CUOTASISTEMA(
idCosto DOUBLE NOT NULL,
PorcentaCosto DOUBLE NOT NULL,
costoSis DOUBLE NOT NULL,
PRIMARY KEY (idCosto)
);

CREATE TABLE IF NOT EXISTS PUBLICAR(
idPublicacion INT NOT NULL,
idRevista INT NOT NULL,
nombrePublicacion CHAR NULL,
nomUsuario VARCHAR(50) NOT NULL,
fecha DATETIME NOT NULL,
cuotaSuscripcion DOUBLE NOT NULL,
PRIMARY KEY (idPublicacion,IdRevista),
FOREIGN KEY (nomUsuario) REFERENCES PERSONA(nombreUsuario),
FOREIGN KEY (idRevista) REFERENCES REVISTA(idRevista)
);

CREATE TABLE IF NOT EXISTS SUSCRIBIR(
idSuscripcion INT NOT NULL,
idPublicacion INT NOT NULL,
nomUsuario VARCHAR(50) NOT NULL,
fechaInicio DATE NOT NULL,
fechaFin DATE NOT NULL,
activa TINYINT NOT NULL,
fechaSuscripcion DATE NOT NULL,
PRIMARY KEY (idSuscripcion),
FOREIGN KEY (idPublicacion) REFERENCES PUBLICAR(idPublicacion),
FOREIGN KEY (nomUsuario) REFERENCES PERSONA(nombreUsuario)
);

CREATE TABLE IF NOT EXISTS PAGO(
idPago INT NOT NULL,
idSuscripcion INT NOT NULL,
monto DOUBLE NOT NULL,
fechaPago DATE NOT NULL,
PRIMARY KEY (idPago),
FOREIGN KEY (idSuscripcion) REFERENCES SUSCRIBIR(idSuscripcion)
);

CREATE TABLE IF NOT EXISTS COSTO(
idCosto INT NOT NULL,
idRevista INT NOT NULL,
costo DOUBLE NOT NULL,
fecha DATE NOT NULL,
PRIMARY KEY (idCosto),
FOREIGN KEY (idRevista) REFERENCES REVISTA(idRevista)
);

CREATE TABLE IF NOT EXISTS ANUNCIOS(
idanunciante INT NOT NULL,
categoria VARCHAR(50) NOT NULL,
descripcion VARCHAR(50) NOT NULL,
url VARCHAR(30) NOT NULL,
PRIMARY KEY (idanunciante)
);

CREATE TABLE IF NOT EXISTS PAGOANUNCIO(
idpagoanun INT NOT NULL AUTO_INCREMENT,
idanu INT NOT NULL,
nombreAnunciante VARCHAR(20) NOT NULL,
cantidad INT NOT NULL,
FechaPago DATE NOT NULL,
PRIMARY KEY (idpagoanun),
FOREIGN KEY (idanu) REFERENCES ANUNCIOS(idanunciante)
);
