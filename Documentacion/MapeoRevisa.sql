CREATE SCHEMA IF NOT EXISTS WEBPAGEREV;
USE WEBPAGEREV;

CREATE TABLE IF NOT EXISTS PERSONA(
nombreUsuario VARCHAR(50) NOT NULL,
contrasena VARCHAR(50) NOT NULL,
tipo INT NOT NULL,
PRIMARY KEY (nombreUsuario)

);

CREATE TABLE IF NOT EXISTS PERFIL(
nombreUsuario VARCHAR(50) ,
nombrePerfil VARCHAR(50),
temasInteres VARCHAR(50),
descripcion VARCHAR(50),
gustos VARCHAR(20),
PRIMARY KEY (nombreUsuario),
FOREIGN KEY (nombreUsuario) REFERENCES PERSONA(nombreUsuario),
);

CREATE TABLE IF NOT EXISTS REVISTA(
idRevista BIGINT NOT NULL,
NombreAutor VARCHAR(50) NOT NULL,
NombreRevista CHAR NOT NULL,
Descripcion VARCHAR NOT NULL,
Autor CHAR(15) NOT NULL,
CostoPorDia DOUBLE NOT NULL,
CuotaSuscripcion DOUBLE NOT NULL,
BloquearComentarios CHAR NOT NULL,
BloquearMeGusta CHAR NOT NULL,
BloquearSuscripciones CHAR NOT NULL,
FechaCreacion DATE NULL,
PRIMARY KEY (IdRevista),
FOREIGN KEY (NombreUsuarioAutor) REFERENCES Usuario (NombreUsuario),
);


CREATE TABLE IF NOT EXISTS MEGUSTA(
idRevista INT NOT NULL,
nombreUsuario VARCHAR(50) NOT NULL,
fecha DATETIME NOT NULL,
PRIMARY KEY (idRevista, NombreUsuario),
FOREIGN KEY (nombreUsuario) REFERENCES PERSONA(nombreUsuario),
FOREIGN KEY (idRevista) REFERENCES Revista (idRevista)
);

CREATE TABLE IF NOT EXISTS COMENTARIO(
idRevista INT,
idComentario INT,
NombreUsuario VARCHAR(50),
Comentario VARCHAR,
Fecha DATETIME,
PRIMARY KEY (idComentario),
FOREIGN KEY (idRevista) REFERENCES REVISTA(idRevista),
FOREIGN KEY (nombreUsuario) REFERENCES PERSONA(nombreUsuario)
);

CREATE TABLE IF NOT EXISTS CATEGORIA(
idRevista INT NOT NULL,
Contenido VARCHAR(100) NOT NULL,
tipo INT NOT NULL,
PRIMARY KEY (idRevista),
FOREIGN KEY (idRevista) REFERENCES REVISTA(idRevista)
);

CREATE TABLE IF NOT EXISTS CUOTASISTEMA(
idCosto DOUBLE NOT NULL,
PorcentaCosto DOUBLE NOT NULL,
costoSis DOUBLE NOT NULL,
PRIMARY KEY (idRevista),
);

CREATE TABLE IF NOT EXISTS PUBLICAR(
idPublicacion INT NOT NULL,
idRevista INT NOT NULL,
nombrePublicacion CHAR NULL,
nombreUsuario VARCHAR(50) NOT NULL,
fecha DATETIME NOT NULL,
cuotaSuscripcion DOUBLE NOT NULL,
PRIMARY KEY (idPublicacion,IdRevista),
FOREIGN KEY (nombreUsuario) REFERENCES PERSONA(nombreUsuario),
FOREIGN KEY (idRevista) REFERENCES REVISTA(idRevista)
);

CREATE TABLE IF NOT EXISTS SUSCRIBIR(
IdSuscripcion INT NOT NULL,
IdPublicacion INT NOT NULL,
NombreUsuario VARCHAR(50) NOT NULL,
FechaInicio DATE NOT NULL,
FechaFin DATE NOT NULL,
Activa TINYINT NOT NULL,
FechaSuscripcion DATE NOT NULL,
PRIMARY KEY (idSuscripcion),
FOREIGN KEY (idPublicacion) REFERENCES PUBLICAR(idPublicacion),
FOREIGN KEY (nombreUsuario) REFERENCES PERSONA(nombreUsuario)
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
fecha DATETIME NOT NULL,
PRIMARY KEY (idCosto),
FOREIGN KEY (idRevista) REFERENCES REVISTA(idRevista)
);

CREATE TABLE IF NOT EXISTS ANUNCIOS(
idanunciante INT NOT NULL,
categoria VARCHAR NOT NULL,
descripcion VARCHAR NOT NULL,
PRIMARY KEY (idanunciante),
);

CREATE TABLE IF NOT EXISTS PAGOANUNCIO(
idpagoanun INT NOT NULL,
nombreAnunciante CHAR NOT NULL,
cantidad INT NOT NULL,
FechaPago VARCHAR NOT NULL,
PRIMARY KEY (idpagoanun),
FOREIGN KEY (cantidad) REFERENCES ANUNCIOS(idanunciante)
);
