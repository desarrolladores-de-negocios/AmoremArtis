USE tempdb
GO

-- Se crea la DB
IF NOT EXISTS (SELECT * FROM sys.databases WHERE [name]='Amorem Artis')
	BEGIN
		CREATE DATABASE AmoremArtis
	END
GO

USE AmoremArtis
GO

-- Se crea el esquema Alumnos
CREATE SCHEMA Alumnos
GO

-- Se crea el esquema Informacion
CREATE SCHEMA Informacion
GO

--Se crea el esquema de Matriculas y Mensualidades
CREATE SCHEMA MatriculaMensualidad
GO

-- Se crea el esquema Planilla
CREATE SCHEMA Planilla
GO

-- Se crea el esquema Contabilidad
CREATE SCHEMA Contabilidad
GO

-- Se crea el esquema Seguridad
CREATE SCHEMA Seguridad
GO

-- Creacion de las tablas del esquema Informacion
CREATE TABLE Informacion.Nombre
(
	id INT NOT NULL IDENTITY (100000, 1),
		CONSTRAINT PK_Informacion_Nombre_id
		PRIMARY KEY CLUSTERED (id),
	Nombre NVARCHAR (50) NOT NULL,
	idAlumno INT,
	idPadre INT,
	idMaestro INT
)
GO

CREATE TABLE Informacion.Apellido
(
	id INT NOT NULL IDENTITY (100000, 1),
		CONSTRAINT PK_Informacion_Apellido_id
		PRIMARY KEY CLUSTERED (id),
	Apellido NVARCHAR (50) NOT NULL,
	idAlumno INT,
	idPadre INT,
	idMaestro INT
)
GO

CREATE TABLE Informacion.Telefono
(
	id INT NOT NULL IDENTITY (100000, 1),
		CONSTRAINT PK_Informacion_Telefono_id
		PRIMARY KEY CLUSTERED (id),
	Telefono NVARCHAR (50) NOT NULL,
		CONSTRAINT CHK_Alumno_Telefono
		CHECK (Telefono LIKE '[0-9][0-9][0-9][0-9]-[0-9][0-9][0-9][0-9]'),
		CONSTRAINT UC_TelefonoAlumno
		UNIQUE (Telefono),
	idAlumno INT,
	idPadre INT,
	idMaestro INT
)
GO

CREATE TABLE Informacion.Estados
(
	id INT IDENTITY (1, 1),
		CONSTRAINT PK_Estados_id
		PRIMARY KEY CLUSTERED (id),
	Estado NVARCHAR (20) NOT NULL
)
GO

-- Creacion de las tablas del esquema Alumnos
CREATE TABLE Alumnos.Alumno
(
	id INT IDENTITY(1000, 1) NOT NULL,
		CONSTRAINT PK_Alumno_id
		PRIMARY KEY CLUSTERED (id),
	Identidad NVARCHAR (15) NOT NULL,
		CONSTRAINT CHK_Alumno_Identidad_Formato
		CHECK (Identidad LIKE '[0-9][0-9][0-9][0-9]-[0-9][0-9][0-9][0-9]-[0-9][0-9][0-9][0-9][0-9]'),
		CONSTRAINT UC_Identidad
		UNIQUE (Identidad),
	Edad INT NOT NULL,
	idTipoAlumno INT NOT NULL,
	Estado INT NOT NULL,
	Usuario INT NOT NULL,
	Fecha DATETIME NOT NULL,
	Descuento DECIMAL NULL
)
GO

CREATE TABLE Alumnos.Padre
(
	id INT IDENTITY(2000, 1) NOT NULL,
		CONSTRAINT PK_Padre_id
		PRIMARY KEY CLUSTERED (id),
	idAlumno INT NOT NULL,
	Edad INT NOT NULL,
	Estado INT NOT NULL,
	Fecha DATETIME NOT NULL,
	Usuario INT NOT NULL
)
GO

CREATE TABLE Alumnos.DetalleAlumno
(
	id INT IDENTITY(10000, 1) NOT NULL,
		CONSTRAINT PK_DetalleAlumno_id
		PRIMARY KEY CLUSTERED (id),
	idAlumno INT NOT NULL,
	idCategoria INT NOT NULL,
	idInstrumento INT NULL,
	idSeccionInstrumento INT NULL,
	Fecha DATETIME NOT NULL,
	Usuario INT NOT NULL,
	Estado INT NOT NULL
)
GO

CREATE TABLE Alumnos.Categoria
(
	id INT IDENTITY(1, 1) NOT NULL,
		CONSTRAINT PK_Categoria_id
		PRIMARY KEY CLUSTERED (id),
	Categoria NVARCHAR(50) NOT NULL,
		CONSTRAINT UC_Categoria
		UNIQUE (Categoria),
	Estado INT NOT NULL,
	Precio DECIMAL NOT NULL
)
GO

CREATE TABLE Alumnos.Instrumento
(
	id INT IDENTITY(3000, 1) NOT NULL,
		CONSTRAINT PK_Instrumento_id
		PRIMARY KEY CLUSTERED (id),
	Instrumento NVARCHAR (50) NOT NULL,
		CONSTRAINT UC_Instrumento
		UNIQUE (Instrumento),
	Estado INT NOT NULL,
	Fecha DATETIME NOT NULL,
	Usuario INT NOT NULL
)
GO

CREATE TABLE Alumnos.SeccionInstrumento
(
	id INT IDENTITY(30000, 1) NOT NULL,
		CONSTRAINT PK_Seccion_id
		PRIMARY KEY CLUSTERED (id),
	Seccion NVARCHAR (2) NOT NULL,
		CONSTRAINT UC_SeccionInstrumento
		UNIQUE (Seccion),
	idInstrumento INT NOT NULL,
	Estado INT NOT NULL,
	Fecha DATETIME NOT NULL,
	Usuario INT NOT NULL
)
GO

CREATE TABLE Alumnos.Solfeo
(
	id INT IDENTITY(4000, 1) NOT NULL,
		CONSTRAINT PK_Solfeo_id
		PRIMARY KEY CLUSTERED (id),
	Seccion NVARCHAR(15) NOT NULL,
		CONSTRAINT UC_SeccionSolfeo
		UNIQUE (Seccion),
	Estado INT NOT NULL,
	Fecha DATETIME NOT NULL,
	Usuario INT NOT NULL
)
GO

CREATE TABLE Alumnos.SolfeoAlumno
(
	id INT IDENTITY(40000, 1) NOT NULL,
		CONSTRAINT PK_PSolfeoAlumno_id
		PRIMARY KEY CLUSTERED (id),
	idAlumno INT NOT NULL,
	idSolfeo INT NOT NULL,
	Fecha DATETIME NOT NULL,
	Usuario INT NOT NULL,
	Estado INT NOT NULL
)
GO

CREATE TABLE Alumnos.TipoAlumno
(
	id INT IDENTITY(1, 1) NOT NULL,
		CONSTRAINT PK_TipoAlumno_id
		PRIMARY KEY CLUSTERED (id),
	Tipo NVARCHAR(15) NOT NULL,
		CONSTRAINT CHK_Formato_Tipo
		CHECK (Tipo LIKE 'Becado' OR Tipo LIKE 'Normal'),
		CONSTRAINT UC_TipoAlumno
		UNIQUE (Tipo),
)
GO

-- Creacion de las tablas del esquema Matriculas y Mensualidades
CREATE TABLE MatriculaMensualidad.Matricula
(
	id INT IDENTITY(10000, 1),
		CONSTRAINT PK_Matricula_id
		PRIMARY KEY CLUSTERED (id),
	idAlumno INT NOT NULL,
	Matricula DECIMAL NOT NULL,
	idEstado INT NOT NULL,
	Fecha DATETIME NOT NULL,
	Usuario INT NOT NULL
)
GO

CREATE TABLE MatriculaMensualidad.Mensualidad
(
	id INT IDENTITY(100000, 1),
		CONSTRAINT PK_Mensualidad_id
		PRIMARY KEY CLUSTERED (id),
	idAlumno INT NOT NULL,
	Mensualidad DECIMAL NOT NULL,
	idEstado INT NOT NULL,
	Fecha DATETIME NOT NULL,
	Usuario INT NOT NULL
)
GO

-- Creacion de las tablas del esquema Planilla
CREATE TABLE Planilla.Maestro
(
	id INT IDENTITY (5000, 1) NOT NULL,
		CONSTRAINT PK_Maestro_id
		PRIMARY KEY CLUSTERED (id),
	Identidad NVARCHAR (15) NOT NULL,
		CONSTRAINT CHK_Maestro_Identidad_Formato
		CHECK (Identidad LIKE '[0-9][0-9][0-9][0-9]-[0-9][0-9][0-9][0-9]-[0-9][0-9][0-9][0-9][0-9]'),
		CONSTRAINT UC_IdentidadMaestro
		UNIQUE (Identidad),
	Estado INT NOT NULL,
	Fecha DATETIME NOT NULL,
	Usuario INT NOT NULL
)
GO

CREATE TABLE Planilla.DetalleMaestro
(
	id INT IDENTITY (50000, 1) NOT NULL,
		CONSTRAINT PK_DetalleMaestro_id
		PRIMARY KEY CLUSTERED (id),
	idMaestro INT NOT NULL,
	idCategoria INT NOT NULL,
	idInstrumento INT NOT NULL,
	idSeccionInstrumento INT NOT NULL,
	Fecha DATETIME NOT NULL,
	Usuario INT NOT NULL,
	Estado INT NOT NULL
)
GO

CREATE TABLE Planilla.SolfeoMaestro
(
	id INT IDENTITY (50, 1) NOT NULL,
		CONSTRAINT PK_SolfeoMaestro_id
		PRIMARY KEY CLUSTERED (id),
	idMaestro INT NOT NULL,
	idSolfeo INT NOT NULL,
	Fecha DATETIME NOT NULL,
	Usuario INT NOT NULL,
	Estado INT NOT NULL
)
GO

CREATE TABLE Planilla.HorasTrabajadasDia
(
	id INT IDENTITY (500000, 1) NOT NULL,
		CONSTRAINT PK_HorasTrabajadasDia_id
		PRIMARY KEY CLUSTERED (id),
	idMaestro INT NOT NULL,
	Horas INT NOT NULL,
	Fecha DATETIME NOT NULL,
	Estado INT NOT NULL,
	Usuario INT NOT NULL
)
GO

CREATE TABLE Planilla.PagoMensualMaestro
(
	id INT IDENTITY (50000, 1) NOT NULL,
		CONSTRAINT PK_PagoMensualMaestro_id
		PRIMARY KEY CLUSTERED (id),
	idMaestro INT NOT NULL,
	Sueldo DECIMAL NOT NULL,
	Fecha DATETIME NOT NULL,
	Usuario INT NOT NULL,
	Estado INT NOT NULL
)
GO

-- Creacion de las tablas del esquema Contabilidad
--CREATE TABLE Contabilidad.Cuentas
--(
--	id INT IDENTITY (6000, 1) NOT NULL,
--		CONSTRAINT PK_Cuentas_id
--		PRIMARY KEY CLUSTERED (id),
--	Cuenta NVARCHAR (50) NOT NULL,
--		CONSTRAINT UC_Cuenta
--		UNIQUE (Cuenta),
--	TipoCuenta NVARCHAR (6) NOT NULL,
--		CONSTRAINT CHK_Formato_Cuentas_TipoCuenta
--		CHECK (TipoCuenta LIKE 'Activo' OR TipoCuenta LIKE 'Pasivo'),
--	Estado INT NOT NULL,
--	Fecha DATETIME NOT NULL,
--	Usuario INT NOT NULL
--)
--GO

--CREATE TABLE Contabilidad.Ingreso
--(
--	id INT IDENTITY (6000000, 1) NOT NULL,
--		CONSTRAINT PK_Ingreso_id
--		PRIMARY KEY NONCLUSTERED (id),
--	Descripcion NVARCHAR (100) NOT NULL,
--	idCuentas INT NOT NULL,
--	Costo DECIMAL NOT NULL
--)
--GO

--CREATE TABLE Contabilidad.Salida
--(
--	id INT IDENTITY (7000000, 1) NOT NULL,
--		CONSTRAINT PK_Salida_id
--		PRIMARY KEY CLUSTERED (id),
--	Descripcion NVARCHAR (100) NOT NULL,
--	idCuentas INT NOT NULL,
--	Costo DECIMAL NOT NULL
--)
--GO

--CREATE TABLE Contabilidad.Inventario
--(
--	id INT IDENTITY (70000, 1) NOT NULL,
--		CONSTRAINT PK_Inventario_id
--		PRIMARY KEY CLUSTERED (id),
--	Articulo NVARCHAR (50) NOT NULL,
--		CONSTRAINT UC_Articulo
--		UNIQUE (Articulo),
--	Cantidad INT NOT NULL,
--	idTipoArticulo INT NOT NULL,
--	Estado INT NOT NULL,
--	Fecha DATETIME NOT NULL,
--	Usuario INT NOT NULL
--)
--GO

--CREATE TABLE Contabilidad.TipoArticulo
--(
--	id INT IDENTITY (1, 1) NOT NULL,
--		CONSTRAINT PK_TipoArticulo_id
--		PRIMARY KEY CLUSTERED (id),
--	Tipo NVARCHAR (50) NOT NULL,
--		CONSTRAINT UC_TipoArticulo
--		UNIQUE (Tipo),
--	Estado INT NOT NULL
--)
--GO

--CREATE TABLE Contabilidad.Compra
--(
--	id INT IDENTITY (8000000, 1) NOT NULL,
--		CONSTRAINT PK_Compra_id
--		PRIMARY KEY CLUSTERED (id),
--	Descripcion NVARCHAR (50) NOT NULL,
--	Costo DECIMAL NOT NULL,
--	Fecha DATETIME NOT NULL,
--	Usuario INT NOT NULL,
--	Estado INT NOT NULL,
--	idProveedor INT NULL,
--	OtroProveedor NVARCHAR (50) NULL
--)
--GO

--CREATE TABLE Contabilidad.Venta
--(
--	id INT IDENTITY (8500000, 1) NOT NULL,
--		CONSTRAINT PK_Venta_id
--		PRIMARY KEY CLUSTERED (id),
--	Descripcion NVARCHAR (50) NOT NULL,
--	Costo DECIMAL NOT NULL,
--	Fecha DATETIME NOT NULL,
--	Usuario INT NOT NULL,
--	Estado INT NOT NULL
--)
--GO

--CREATE TABLE Contabilidad.Proveedor
--(
--	id INT IDENTITY (9000, 1) NOT NULL,
--		CONSTRAINT PK_Proveedor_id
--		PRIMARY KEY CLUSTERED (id),
--	Nombre NVARCHAR (100) NOT NULL,
--		CONSTRAINT UC_NombreProveedor
--		UNIQUE (Nombre),
--	Telefono NVARCHAR (9) NOT NULL,
--		CONSTRAINT UC_TelefonoProveedor
--		UNIQUE (Telefono),
--	Direccion NVARCHAR (300) NOT NULL,
--	Correo NVARCHAR (75) NULL,
--		CONSTRAINT CHK_Proveedor_Correo_Formato
--		CHECK (Correo LIKE '%@%.com'),
--		CONSTRAINT UC_CorreoProveedor
--		UNIQUE (Correo),
--	Estado INT NOT NULL,
--	Fecha DATETIME NOT NULL,
--	Usuario NVARCHAR (20) NOT NULL
--)
--GO

--CREATE TABLE Contabilidad.DetalleProveedor
--(
--	id INT IDENTITY (90000, 1) NOT NULL,
--		CONSTRAINT PK_DetalleProveedor_id
--		PRIMARY KEY CLUSTERED (id),
--	idProveedor INT NOT NULL,
--	idTipoAlquilerProveedor INT NOT NULL,
--	MuebleInmueble NVARCHAR (50) NOT NULL,
--		CONSTRAINT UC_MuebleInmueble
--		UNIQUE (MuebleInmueble),
--	Fecha DATETIME NOT NULL,
--	Usuario INT NOT NULL,
--	idTipoAsignadoProveedor INT NOT NULL,
--	Estado INT NOT NULL
--)
--GO

--CREATE TABLE Contabilidad.TipoProveedor
--(
--	id INT IDENTITY (1, 1) NOT NULL,
--		CONSTRAINT PK_TipoProveedor_id
--		PRIMARY KEY CLUSTERED (id),
--	Tipo NVARCHAR (8) NOT NULL,
--		CONSTRAINT CHK_Formato_TipoProveedor
--		CHECK (Tipo LIKE 'Alquiler' OR Tipo LIKE 'Compras')
--)
--GO

--CREATE TABLE Contabilidad.TipoAsignadoProveedor
--(
--	id INT IDENTITY (1, 1) NOT NULL,
--		CONSTRAINT PK_TipoAsignadoProveedor_id
--		PRIMARY KEY CLUSTERED (id),
--	idProveedor INT NOT NULL,
--	idTipoProveedor INT NOT NULL,
--	Estado INT NOT NULL
--)
--GO

--CREATE TABLE Contabilidad.TipoAlquilerProveedor
--(
--	id INT IDENTITY (90000, 1) NOT NULL,
--		CONSTRAINT PK_TipoAlquilerProveedor_id
--		PRIMARY KEY CLUSTERED (id),
--	Tipo NVARCHAR (10) NOT NULL,
--		CONSTRAINT UC_TipoAlquilerProveedor
--		UNIQUE (Tipo)
--)
--GO

--CREATE TABLE Contabilidad.Alquiler
--(
--	id INT IDENTITY (900000, 1) NOT NULL,
--		CONSTRAINT PK_Alquiler_id
--		PRIMARY KEY CLUSTERED (id),
--	idProveedor INT NOT NULL,
--	Costo DECIMAL NOT NULL,
--	Fecha DATETIME NOT NULL,
--	Usuario INT NOT NULL,
--	Estado INT NOT NULL
--)
--GO

--CREATE TABLE Contabilidad.GastosVarios
--(
--	id INT IDENTITY (9000000, 1) NOT NULL,
--		CONSTRAINT PK_GastosVarios_id
--		PRIMARY KEY CLUSTERED (id),
--	Descripcion NVARCHAR (100) NOT NULL,
--	Costo DECIMAL NOT NULL,
--	Fecha DATETIME NOT NULL,
--	Usuario INT NOT NULL,
--	idProveedor INT NULL,
--	OtroProveedor NVARCHAR (50) NULL,
--	Estado INT NOT NULL
--)
--GO

-- Creacion de las tablas del esquema Seguridad
CREATE TABLE Seguridad.Usuario
(
	id INT IDENTITY (9000, 1) NOT NULL,
		CONSTRAINT PK_Usuario_id
		PRIMARY KEY CLUSTERED (id),
	Usuario NVARCHAR (20) NOT NULL,
		CONSTRAINT UNQ_Usuario_Usuario
		UNIQUE (Usuario),
	Pass NVARCHAR (256) NOT NULL,
	Fecha DATETIME NOT NULL,
	Estado INT NOT NULL,
	idCargo INT NOT NULL,
	idMaestro INT NOT NULL
)
GO

CREATE TABLE Seguridad.Cargo
(
	id INT IDENTITY(10, 1) NOT NULL,
		CONSTRAINT PK_Cargo_id
		PRIMARY KEY CLUSTERED (id),
	Cargo NVARCHAR (50) NOT NULL,
		CONSTRAINT UC_Cargo
		UNIQUE (Cargo),
	Estado INT NOT NULL,
	Fecha DATETIME NOT NULL
)
GO

-- Llaves foraneas
ALTER TABLE Informacion.Nombre
	ADD CONSTRAINT FK_Alumno$TieneUnOMuchos$Nombres
	FOREIGN KEY (idAlumno) REFERENCES Alumnos.Alumno (id)
	ON UPDATE CASCADE
	ON DELETE NO ACTION
GO

ALTER TABLE Informacion.Nombre
	ADD CONSTRAINT FK_Padre$TieneUnOMuchos$Nombres
	FOREIGN KEY (idPadre) REFERENCES Alumnos.Padre (id)
	ON UPDATE CASCADE
	ON DELETE NO ACTION
GO

ALTER TABLE Informacion.Nombre
	ADD CONSTRAINT FK_Maestro$TieneUnOMuchos$Nombres
	FOREIGN KEY (idMaestro) REFERENCES Planilla.Maestro (id)
	ON UPDATE CASCADE
	ON DELETE NO ACTION
GO

ALTER TABLE Informacion.Apellido
	ADD CONSTRAINT FK_Alumno$TieneUnOMuchos$Apellidos
	FOREIGN KEY (idAlumno) REFERENCES Alumnos.Alumno (id)
	ON UPDATE CASCADE
	ON DELETE NO ACTION
GO

ALTER TABLE Informacion.Apellido
	ADD CONSTRAINT FK_Padre$TieneUnOMuchos$Apellidos
	FOREIGN KEY (idPadre) REFERENCES Alumnos.Padre (id)
	ON UPDATE CASCADE
	ON DELETE NO ACTION
GO

ALTER TABLE Informacion.Apellido
	ADD CONSTRAINT FK_Maestro$TieneUnOMuchos$Apellidos
	FOREIGN KEY (idMaestro) REFERENCES Planilla.Maestro (id)
	ON UPDATE CASCADE
	ON DELETE NO ACTION
GO

ALTER TABLE Informacion.Telefono
	ADD CONSTRAINT FK_Alumno$TieneUnOMuchos$Telefonos
	FOREIGN KEY (idAlumno) REFERENCES Alumnos.Alumno (id)
	ON UPDATE CASCADE
	ON DELETE NO ACTION
GO

ALTER TABLE Informacion.Telefono
	ADD CONSTRAINT FK_Padre$TieneUnOMuchos$Telefonos
	FOREIGN KEY (idPadre) REFERENCES Alumnos.Padre (id)
	ON UPDATE CASCADE
	ON DELETE NO ACTION
GO

ALTER TABLE Informacion.Telefono
	ADD CONSTRAINT FK_Maestro$TieneUnOMuchos$Telefonos
	FOREIGN KEY (idMaestro) REFERENCES Planilla.Maestro (id)
	ON UPDATE CASCADE
	ON DELETE NO ACTION
GO

ALTER TABLE Alumnos.Categoria
	ADD CONSTRAINT FK_Categoria$TieneUn$Estado
	FOREIGN KEY (Estado) REFERENCES Informacion.Estados (id)
	ON UPDATE CASCADE
	ON DELETE NO ACTION
GO

ALTER TABLE Alumnos.Alumno
	ADD CONSTRAINT FK_Alumno$TieneUn$Estado
	FOREIGN KEY (Estado) REFERENCES Informacion.Estados (id)
	ON UPDATE CASCADE
	ON DELETE NO ACTION
GO

ALTER TABLE Alumnos.DetalleAlumno
	ADD CONSTRAINT FK_Alumno$Tiene$DetalleAlumno
	FOREIGN KEY (idAlumno) REFERENCES Alumnos.Alumno (id)
	ON UPDATE CASCADE
	ON DELETE NO ACTION
GO

ALTER TABLE Alumnos.DetalleAlumno
	ADD CONSTRAINT FK_Categoria$Tiene$Alumnos
	FOREIGN KEY (idCategoria) REFERENCES Alumnos.Categoria (id)
	ON UPDATE CASCADE
	ON DELETE NO ACTION
GO

ALTER TABLE Alumnos.DetalleAlumno
	ADD CONSTRAINT FK_Instrumento$Tiene$Alumnos
	FOREIGN KEY (idInstrumento) REFERENCES Alumnos.Instrumento (id)
	ON UPDATE CASCADE
	ON DELETE NO ACTION
GO

ALTER TABLE Alumnos.DetalleAlumno
	ADD CONSTRAINT FK_SeccionInstrumento$Tiene$Alumnos
	FOREIGN KEY (idSeccionInstrumento) REFERENCES Alumnos.SeccionInstrumento (id)
	ON UPDATE CASCADE
	ON DELETE NO ACTION
GO

ALTER TABLE Alumnos.DetalleAlumno
	ADD CONSTRAINT FK_DetalleAlumno$TieneUn$Estado
	FOREIGN KEY (Estado) REFERENCES Informacion.Estados (id)
	ON UPDATE CASCADE
	ON DELETE NO ACTION
GO

ALTER TABLE Alumnos.Padre
	ADD CONSTRAINT FK_Alumno$Tiene$Padre
	FOREIGN KEY (idAlumno) REFERENCES Alumnos.Alumno (id)
	ON UPDATE CASCADE
	ON DELETE NO ACTION
GO

ALTER TABLE Alumnos.Padre
	ADD CONSTRAINT FK_Padre$TieneUn$Estado
	FOREIGN KEY (Estado) REFERENCES Informacion.Estados (id)
	ON UPDATE CASCADE
	ON DELETE NO ACTION
GO

ALTER TABLE Alumnos.SolfeoAlumno
	ADD CONSTRAINT FK_Alumno$EstaEn$Solfeo
	FOREIGN KEY (idAlumno) REFERENCES Alumnos.Alumno (id)
	ON UPDATE CASCADE
	ON DELETE NO ACTION
GO

ALTER TABLE Alumnos.SolfeoAlumno
	ADD CONSTRAINT FK_SolfeoAlumno$TieneUn$Estado
	FOREIGN KEY (Estado) REFERENCES Informacion.Estados (id)
	ON UPDATE CASCADE
	ON DELETE NO ACTION
GO

ALTER TABLE Alumnos.SolfeoAlumno
	ADD CONSTRAINT FK_SolfeoAlumno$EstaEn$SeccionSolfeo
	FOREIGN KEY (idSolfeo) REFERENCES Alumnos.Solfeo (id)
	ON UPDATE CASCADE
	ON DELETE NO ACTION
GO

ALTER TABLE Alumnos.Instrumento
	ADD CONSTRAINT FK_Instrumento$TieneUn$Estado
	FOREIGN KEY (Estado) REFERENCES Informacion.Estados (id)
	ON UPDATE CASCADE
	ON DELETE NO ACTION
GO

ALTER TABLE Alumnos.Solfeo
	ADD CONSTRAINT FK_Solfeo$TieneUn$Estado
	FOREIGN KEY (Estado) REFERENCES Informacion.Estados (id)
	ON UPDATE CASCADE
	ON DELETE NO ACTION
GO

ALTER TABLE Alumnos.SeccionInstrumento
	ADD CONSTRAINT FK_Instrumento$Tiene$SeccionInstrumento
	FOREIGN KEY (idInstrumento) REFERENCES Alumnos.Instrumento (id)
	ON UPDATE CASCADE
	ON DELETE NO ACTION
GO

ALTER TABLE Alumnos.SeccionInstrumento
	ADD CONSTRAINT FK_SeccionInstrumento$TieneUn$Estado
	FOREIGN KEY (Estado) REFERENCES Informacion.Estados (id)
	ON UPDATE CASCADE
	ON DELETE NO ACTION
GO

ALTER TABLE Alumnos.Alumno
	ADD CONSTRAINT FK_Alumno$TieneUn$Tipo
	FOREIGN KEY (idTipoAlumno) REFERENCES Alumnos.TipoAlumno (id)
	ON UPDATE CASCADE
	ON DELETE NO ACTION
GO

ALTER TABLE MatriculaMensualidad.Matricula
	ADD CONSTRAINT FK_Alumno$TieneUna$Matricula
	FOREIGN KEY (idAlumno) REFERENCES Alumnos.Alumno (id)
	ON UPDATE CASCADE
	ON DELETE NO ACTION
GO

ALTER TABLE MatriculaMensualidad.Matricula
	ADD CONSTRAINT FK_Matricula$TieneUn$Estado
	FOREIGN KEY (idEstado) REFERENCES Informacion.Estados (id)
	ON UPDATE CASCADE
	ON DELETE NO ACTION
GO

ALTER TABLE MatriculaMensualidad.Mensualidad
	ADD CONSTRAINT FK_Alumno$Tiene$Mensualidades
	FOREIGN KEY (idAlumno) REFERENCES Alumnos.Alumno (id)
	ON UPDATE CASCADE
	ON DELETE NO ACTION
GO

ALTER TABLE MatriculaMensualidad.Mensualidad
	ADD CONSTRAINT FK_Mensualidad$TieneUn$Estado
	FOREIGN KEY (idEstado) REFERENCES Informacion.Estados (id)
	ON UPDATE CASCADE
	ON DELETE NO ACTION
GO

ALTER TABLE Planilla.Maestro
	ADD CONSTRAINT FK_Maestro$TieneUn$Estado
	FOREIGN KEY (Estado) REFERENCES Informacion.Estados (id)
	ON UPDATE CASCADE
	ON DELETE NO ACTION
GO

ALTER TABLE Planilla.DetalleMaestro
	ADD CONSTRAINT FK_Maestro$TieneUn$DetalleMaestro
	FOREIGN KEY (idMaestro) REFERENCES Planilla.Maestro (id)
	ON UPDATE CASCADE
	ON DELETE NO ACTION
GO

ALTER TABLE Planilla.DetalleMaestro
	ADD CONSTRAINT FK_Categoria$Tiene$Maestros
	FOREIGN KEY (idCategoria) REFERENCES Alumnos.Categoria (id)
	ON UPDATE CASCADE
	ON DELETE NO ACTION
GO

ALTER TABLE Planilla.DetalleMaestro
	ADD CONSTRAINT FK_Instrumento$Tiene$Maestros
	FOREIGN KEY (idInstrumento) REFERENCES Alumnos.Instrumento (id)
	ON UPDATE CASCADE
	ON DELETE NO ACTION
GO

ALTER TABLE Planilla.DetalleMaestro
	ADD CONSTRAINT FK_SeccionInstrumento$Tiene$Maestros
	FOREIGN KEY (idSeccionInstrumento) REFERENCES Alumnos.SeccionInstrumento (id)
	ON UPDATE CASCADE
	ON DELETE NO ACTION
GO

ALTER TABLE Planilla.DetalleMaestro
	ADD CONSTRAINT FK_DetalleMaestro$TieneUn$Estado
	FOREIGN KEY (Estado) REFERENCES Informacion.Estados (id)
	ON UPDATE CASCADE
	ON DELETE NO ACTION
GO

ALTER TABLE Planilla.SolfeoMaestro
	ADD CONSTRAINT FK_SolfeoMaestro$EstaEn$SeccionSolfeo
	FOREIGN KEY (idSolfeo) REFERENCES Alumno.Solfeo (id)
	ON UPDATE CASCADE
	ON DELETE NO ACTION
GO

ALTER TABLE Planilla.SolfeoMaestro
	ADD CONSTRAINT FK_SolfeoMaestro$TieneUn$Maestro
	FOREIGN KEY (idMaestro) REFERENCES Planilla.Maestro (id)
	ON UPDATE CASCADE
	ON DELETE NO ACTION
GO

ALTER TABLE Planilla.SolfeoMaestro
	ADD CONSTRAINT FK_SolfeoMaestro$TieneUn$Estado
	FOREIGN KEY (Estado) REFERENCES Informacion.Estados (id)
	ON UPDATE CASCADE
	ON DELETE NO ACTION
GO

ALTER TABLE Planilla.HorasTrabajadasDia
	ADD CONSTRAINT FK_Maestro$Tiene$HorasTrabajdas
	FOREIGN KEY (idMaestro) REFERENCES Planilla.Maestro (id)
	ON UPDATE CASCADE
	ON DELETE NO ACTION
GO

ALTER TABLE Planilla.HorasTrabajadasDia
	ADD CONSTRAINT FK_Maestro$Tiene$PagosMensuales
	FOREIGN KEY (idMaestro) REFERENCES Planilla.Maestro (id)
	ON UPDATE CASCADE
	ON DELETE NO ACTION
GO

ALTER TABLE Planilla.HorasTrabajadasDia
	ADD CONSTRAINT FK_HorasTrabajadasDia$TieneUn$Estado
	FOREIGN KEY (Estado) REFERENCES Informacion.Estados (id)
	ON UPDATE CASCADE
	ON DELETE NO ACTION
GO

ALTER TABLE Planilla.PagoMensualMaestro
	ADD CONSTRAINT FK_Maestro$TieneUn$PagoMensual
	FOREIGN KEY (idMaestro) REFERENCES Planilla.Maestro (id)
	ON UPDATE CASCADE
	ON DELETE NO ACTION
GO

ALTER TABLE Planilla.PagoMensualMaestro
	ADD CONSTRAINT FK_PagoMensualMaestro$TieneUn$Estado
	FOREIGN KEY (Estado) REFERENCES Informacion.Estados (id)
	ON UPDATE CASCADE
	ON DELETE NO ACTION
GO

ALTER TABLE Seguridad.Usuario
	ADD CONSTRAINT FK_Maestro$TieneUn$Usuario
	FOREIGN KEY (idMaestro) REFERENCES Planilla.Maestro (id)
	ON UPDATE CASCADE
	ON DELETE NO ACTION
GO

ALTER TABLE Seguridad.Usuario
	ADD CONSTRAINT FK_Usuario$TieneUn$Estado
	FOREIGN KEY (Estado) REFERENCES Informacion.Estados (id)
	ON UPDATE CASCADE
	ON DELETE NO ACTION
GO

ALTER TABLE Seguridad.Usuario
	ADD CONSTRAINT FK_UsuarioMaestro$TieneUn$Cargo
	FOREIGN KEY (idCargo) REFERENCES Seguridad.Cargo (id)
	ON UPDATE CASCADE
	ON DELETE NO ACTION
GO

ALTER TABLE Seguridad.Cargo
	ADD CONSTRAINT FK_Cargo$TieneUn$Estado
	FOREIGN KEY (Estado) REFERENCES Informacion.Estados (id)
	ON UPDATE CASCADE
	ON DELETE NO ACTION
GO

ALTER TABLE Contabilidad.Ingreso
	ADD CONSTRAINT FK_Ingreso$TieneUna$Cuenta
	FOREIGN KEY (idCuentas) REFERENCES Contabilidad.Cuentas (id)
	ON UPDATE CASCADE
	ON DELETE NO ACTION
GO

ALTER TABLE Contabilidad.Salida
	ADD CONSTRAINT FK_Salida$TieneUna$Cuenta
	FOREIGN KEY (idCuentas) REFERENCES Contabilidad.Cuentas (id)
	ON UPDATE CASCADE
	ON DELETE NO ACTION
GO

ALTER TABLE Contabilidad.Inventario
	ADD CONSTRAINT FK_Articulo$TieneUn$Tipo
	FOREIGN KEY (idTipoArticulo) REFERENCES Contabilidad.TipoArticulo (id)
	ON UPDATE CASCADE
	ON DELETE NO ACTION
GO

ALTER TABLE Contabilidad.Inventario
	ADD CONSTRAINT FK_Inventario$TieneUn$Estado
	FOREIGN KEY (Estado) REFERENCES Informacion.Estados (id)
	ON UPDATE CASCADE
	ON DELETE NO ACTION
GO

ALTER TABLE Contabilidad.DetalleProveedor
	ADD CONSTRAINT FK_DetalleProveedor$TieneUn$Estado
	FOREIGN KEY (Estado) REFERENCES Informacion.Estados (id)
	ON UPDATE CASCADE
	ON DELETE NO ACTION
GO

ALTER TABLE Contabilidad.DetalleProveedor
	ADD CONSTRAINT FK_Proveedor$TieneUn$Detalle
	FOREIGN KEY (idProveedor) REFERENCES Contabilidad.Proveedor (id)
	ON UPDATE CASCADE
	ON DELETE NO ACTION
GO

ALTER TABLE Contabilidad.DetalleProveedor
	ADD CONSTRAINT FK_DetalleProveedor$TieneUn$TipoAlquilerProveedor
	FOREIGN KEY (idTipoAlquilerProveedor) REFERENCES Contabilidad.TipoAlquilerProveedor (id)
	ON UPDATE CASCADE
	ON DELETE NO ACTION
GO

ALTER TABLE Contabilidad.DetalleProveedor
	ADD CONSTRAINT FK_DetalleProveedor$TieneUn$TipoAsignado
	FOREIGN KEY (idTipoAsignadoProveedor) REFERENCES Contabilidad.TipoAsignadoProveedor (id)
	ON UPDATE CASCADE
	ON DELETE NO ACTION
GO

ALTER TABLE Contabilidad.TipoAsignadoProveedor
	ADD CONSTRAINT FK_TipoAsignado$TieneUn$Proveedor
	FOREIGN KEY (idProveedor) REFERENCES Contabilidad.Proveedor (id)
	ON UPDATE CASCADE
	ON DELETE NO ACTION
GO

ALTER TABLE Contabilidad.TipoAsignadoProveedor
	ADD CONSTRAINT FK_TipoAsignado$TieneUn$TipoProveedor
	FOREIGN KEY (idTipoProveedor) REFERENCES Contabilidad.TipoProveedor (id)
	ON UPDATE CASCADE
	ON DELETE NO ACTION
GO

ALTER TABLE Contabilidad.Alquiler
	ADD CONSTRAINT FK_Alquiler$TieneUn$Proveedor
	FOREIGN KEY (idProveedor) REFERENCES Contabilidad.DetalleProveedor (id)
	ON UPDATE CASCADE
	ON DELETE NO ACTION
GO

ALTER TABLE Contabilidad.Alquiler
	ADD CONSTRAINT FK_Alquiler$TieneUn$Estado
	FOREIGN KEY (Estado) REFERENCES Informacion.Estados (id)
	ON UPDATE CASCADE
	ON DELETE NO ACTION
GO

ALTER TABLE Contabilidad.Compra
	ADD CONSTRAINT FK_Compra$TieneUn$Proveedor
	FOREIGN KEY (idProveedor) REFERENCES Contabilidad.Proveedor (id)
	ON UPDATE CASCADE
	ON DELETE NO ACTION
GO

ALTER TABLE Contabilidad.Compra
	ADD CONSTRAINT FK_Compra$TieneUn$Estado
	FOREIGN KEY (Estado) REFERENCES Informacion.Estados (id)
	ON UPDATE CASCADE
	ON DELETE NO ACTION
GO

ALTER TABLE Contabilidad.GastosVarios
	ADD CONSTRAINT FK_GastosVarios$TieneUn$Proveedor
	FOREIGN KEY (idProveedor) REFERENCES Contabilidad.Proveedor (id)
	ON UPDATE CASCADE
	ON DELETE NO ACTION
GO

ALTER TABLE Contabilidad.GastosVarios
	ADD CONSTRAINT FK_GastosVarios$TieneUn$Estado
	FOREIGN KEY (Estado) REFERENCES Informacion.Estados (id)
	ON UPDATE CASCADE
	ON DELETE NO ACTION
GO

ALTER TABLE Contabilidad.Venta
	ADD CONSTRAINT FK_Ventas$TieneUn$Estado
	FOREIGN KEY (Estado) REFERENCES Informacion.Estados (id)
	ON UPDATE CASCADE
	ON DELETE NO ACTION
GO
	
-- Consultas
Select Alumnos.Instrumento.Instrumento,
	   Alumnos.SeccionInstrumento.Seccion,
	   Alumnos.SeccionInstrumento.id
from Alumnos.SeccionInstrumento
INNER JOIN Alumnos.Instrumento
ON Alumnos.Instrumento.id = Alumnos.SeccionInstrumento.idInstrumento
ORDER BY Instrumento
GO

select * from Contabilidad.DetalleProveedor
select * from Contabilidad.Proveedor
select * from Contabilidad.TipoAlquilerProveedor
select * from Planilla.Maestro
select * from Alumnos.Solfeo
select * from Alumnos.Alumno
select * from Alumnos.DetalleAlumno
select * from Alumnos.Categoria
select * from Alumnos.Instrumento
select * from Alumnos.SeccionInstrumento
select * from Alumnos.TipoAlumno
SELECT * FROM Informacion.Estados
GO

SELECT Informacion.Nombre.Nombre			AS 'Primer Nombre',
	   Informacion.Apellido.Apellido		AS 'Primer Apellido',
	   Alumnos.Categoria.Categoria			AS Categoria,
	   Alumnos.Instrumento.Instrumento		AS Instrumento,
	   Alumnos.SeccionInstrumento.Seccion	AS Seccion
	   --Alumnos.Solfeo.Seccion				AS Solfeo
FROM Alumnos.Alumno
INNER JOIN Alumnos.DetalleAlumno
ON Alumnos.DetalleAlumno.idAlumno = Alumnos.Alumno.id
INNER JOIN Alumnos.Categoria
ON Alumnos.Categoria.id = Alumnos.DetalleAlumno.idCategoria
INNER JOIN Alumnos.Instrumento
ON Alumnos.Instrumento.id = Alumnos.DetalleAlumno.idInstrumento
INNER JOIN Alumnos.SeccionInstrumento
ON Alumnos.SeccionInstrumento.id = Alumnos.DetalleAlumno.idSeccionInstrumento
INNER JOIN Alumnos.SolfeoAlumno
ON Alumnos.SolfeoAlumno.idAlumno = Alumnos.Alumno.id
--INNER JOIN Alumnos.Solfeo
--ON Alumnos.Solfeo.id = Alumnos.SolfeoAlumno.idSolfeo
INNER JOIN Informacion.Nombre
ON Informacion.Nombre.idAlumno = Alumnos.Alumno.id
INNER JOIN Informacion.Apellido
ON Informacion.Apellido.idAlumno = Alumnos.Alumno.id
GO


SELECT Alumnos.Alumno.Nombre						AS Nombre,
	   MatriculaMensualidad.Matricula.Matricula		AS Matricula,
	   MatriculaMensualidad.Mensualidad.Mensualidad	AS Mensualidad
FROM Alumnos.Alumno
INNER JOIN MatriculaMensualidad.Matricula
ON MatriculaMensualidad.Matricula.idAlumno = Alumnos.Alumno.id
INNER JOIN MatriculaMensualidad.Mensualidad
ON MatriculaMensualidad.Matricula.idAlumno = Alumnos.Alumno.id

SELECT Planilla.Maestro.Nombre				AS Maestro,
	   Planilla.HorasTrabajadasDia.Horas	AS Horas,
	   Planilla.PagoMensualMaestro.Sueldo	AS Sueldo
FROM Planilla.Maestro
INNER JOIN Planilla.HorasTrabajadasDia
ON Planilla.HorasTrabajadasDia.idMaestro = Planilla.Maestro.id
INNER JOIN Planilla.PagoMensualMaestro
ON Planilla.PagoMensualMaestro.idMaestro = Planilla.Maestro.id
GO

--SELECT Contabilidad.Proveedor.Nombre					AS Proveedor,
--	   Contabilidad.DetalleProveedor.MuebleInmueble		AS CosaAlquilada,
--	   Contabilidad.Alquiler.Costo						AS Precio,
--	   Contabilidad.Alquiler.Fecha						AS Fecha
--FROM Contabilidad.Proveedor
--INNER JOIN Contabilidad.DetalleProveedor
--ON Contabilidad.DetalleProveedor.idProveedor = Contabilidad.Proveedor.id
--INNER JOIN Contabilidad.Alquiler
--ON Contabilidad.Alquiler.idProveedor = Contabilidad.DetalleProveedor.id
--GO

select Alumnos.Alumno.id,
	   Alumnos.Alumno.Identidad,
	   Informacion.Nombre.Nombre,
	   Informacion.Apellido.Apellido,
	   Informacion.Telefono.Telefono,
	   Alumnos.Alumno.Descuento
from Alumnos.Alumno
INNER JOIN Informacion.Nombre
ON Informacion.Nombre.idAlumno = Alumnos.Alumno.id
INNER JOIN Informacion.Apellido
ON Informacion.Apellido.idAlumno = Alumnos.Alumno.id
INNER JOIN Informacion.Telefono
ON Informacion.Telefono.idAlumno = Alumnos.Alumno.id
GO
-- Stored Procedures
CREATE PROCEDURE spInsercionCategoria
(
	@Categoria NVARCHAR(20),
	@Precio DECIMAL,
	@Estado NVARCHAR (8)
)
AS
BEGIN
	BEGIN TRY
		DECLARE @EstadoIngresa INT

		SET @EstadoIngresa = (SELECT id FROM Informacion.Estados WHERE Estado = @Estado)

		INSERT INTO Alumnos.Categoria (Categoria, Precio, Estado)
				VALUES (@Categoria, @Precio, @EstadoIngresa)
	END TRY
	BEGIN CATCH
		PRINT ERROR_MESSAGE()
		PRINT ERROR_NUMBER()
		PRINT ERROR_LINE()
	END CATCH
END
GO

CREATE PROCEDURE spModificarCategoria
(
	@Categoria NVARCHAR(20),
	@NuevaCategoria NVARCHAR(20) = NULL,
	@Precio DECIMAL = NULL,
	@Estado NVARCHAR(20) = NULL
)
AS
BEGIN
	BEGIN TRY
		DECLARE @SeleccionCategoria INT
		DECLARE @EstadoIngresa INT

		SET @EstadoIngresa = (SELECT id FROM Informacion.Estados WHERE Estado = @Estado)
		SET @SeleccionCategoria = (SELECT id FROM Alumnos.Categoria WHERE Categoria = @Categoria)

		IF EXISTS (SELECT * FROM Alumnos.Categoria WHERE Categoria = @Categoria)
		BEGIN
			IF @NuevaCategoria IS NOT NULL AND @Precio IS NOT NULL AND @Estado IS NOT NULL
				UPDATE Alumnos.Categoria
				SET Categoria = @NuevaCategoria, Precio = @Precio, Estado = @EstadoIngresa
				WHERE id = @SeleccionCategoria
			ELSE IF @NuevaCategoria IS NOT NULL AND @Precio IS NOT NULL AND @Estado IS NULL
				UPDATE Alumnos.Categoria
				SET Categoria = @NuevaCategoria, Precio = @Precio
				WHERE id = @SeleccionCategoria
			ELSE IF @NuevaCategoria IS NOT NULL AND @Precio IS NULL AND @Estado IS NOT NULL
				UPDATE Alumnos.Categoria
				SET Categoria = @NuevaCategoria, Estado = @EstadoIngresa
				WHERE id = @SeleccionCategoria
			ELSE IF @NuevaCategoria IS NOT NULL AND @Precio IS NULL AND @Estado IS NULL
				UPDATE Alumnos.Categoria
				SET Categoria = @NuevaCategoria
				WHERE id = @SeleccionCategoria
			ELSE IF @NuevaCategoria IS NULL AND @Precio IS NOT NULL AND @Estado IS NOT NULL
				UPDATE Alumnos.Categoria
				SET Precio = @Precio, Estado = @EstadoIngresa
				WHERE id = @SeleccionCategoria
			ELSE IF @NuevaCategoria IS NULL AND @Precio IS NOT NULL AND @Estado IS NULL
				UPDATE Alumnos.Categoria
				SET Precio = @Precio
				WHERE id = @SeleccionCategoria
			ELSE IF @NuevaCategoria IS NULL AND @Precio IS NULL AND @Estado IS NOT NULL
				UPDATE Alumnos.Categoria
				SET Estado = @EstadoIngresa
				WHERE id = @SeleccionCategoria
			ELSE
				PRINT 'Si desea modificar una categoria, porfavor ingresar un dato nuevo!'
		END
		ELSE
			PRINT 'La categoria no existe!'
	END TRY
	BEGIN CATCH
		DECLARE @error INT
		SET @error = @@ERROR

		IF (@error = 2627)
			PRINT 'La categoria ingresada ya existe!'
		ELSE IF (@error = 515)
			PRINT 'El estado no es valido!'
		ELSE
			PRINT ERROR_MESSAGE()
			PRINT ERROR_NUMBER()
	END CATCH
END
GO

CREATE PROCEDURE spInsercionInstrumento
(
	@Instrumento NVARCHAR (20),
	@Estado NVARCHAR (20),
	@Usuario NVARCHAR (20)
)
AS
BEGIN
	BEGIN TRY
		DECLARE @EstadoIngresa INT
		DECLARE @usuarioId INT

		SET @EstadoIngresa = (SELECT id FROM Informacion.Estados WHERE Estado = @Estado)
		SET @usuarioId = (SELECT id FROM Seguridad.Usuario WHERE Usuario = @Usuario)

		IF NOT EXISTS (SELECT * FROM Alumnos.Instrumento WHERE Instrumento = @Instrumento)
			INSERT INTO Alumnos.Instrumento (Instrumento, Estado, Fecha, Usuario)
				VALUES (@Instrumento, @EstadoIngresa, GETDATE(), @usuarioId)
	END TRY
	BEGIN CATCH
		DECLARE @error INT
		SET @error = @@ERROR

		IF (@error = 2627)
			PRINT 'La categoria ingresada ya existe!'
		ELSE IF (@error = 515)
			PRINT 'El estado no es valido!'
		ELSE
			PRINT ERROR_MESSAGE()
			PRINT ERROR_NUMBER()
			PRINT ERROR_LINE()
	END CATCH
END
GO

CREATE PROCEDURE spModificarInstrumento
(
	@Instrumento NVARCHAR(50),
	@NuevoInstrumento NVARCHAR(50) = NULL,
	@Estado NVARCHAR(20) = NULL,
	@Usuario NVARCHAR(20)
)
AS
BEGIN
	BEGIN TRY
		DECLARE @SeleccionInstrumento INT
		DECLARE @EstadoIngresa INT
		DECLARE @idUsuario INT

		SET @EstadoIngresa = (SELECT id FROM Informacion.Estados WHERE Estado = @Estado)
		SET @SeleccionInstrumento = (SELECT id FROM Alumnos.Instrumento WHERE Instrumento = @Instrumento)
		SET @idUsuario = (SELECT id FROM Seguridad.Usuario WHERE Usuario = @Usuario)

		IF EXISTS(SELECT * FROM Alumnos.Instrumento WHERE Instrumento = @Instrumento)
		BEGIN
			IF @NuevoInstrumento IS NOT NULL AND @Estado IS NOT NULL
				UPDATE Alumnos.Instrumento
				SET Instrumento = @NuevoInstrumento, Estado = @EstadoIngresa, Usuario = @idUsuario
				WHERE id = @SeleccionInstrumento
			ELSE IF @NuevoInstrumento IS NOT NULL AND @Estado IS NULL
				UPDATE Alumnos.Instrumento
				SET Instrumento = @NuevoInstrumento, Usuario = @idUsuario
				WHERE id = @SeleccionInstrumento
			ELSE IF @NuevoInstrumento IS NULL AND @Estado IS NOT NULL
				UPDATE Alumnos.Instrumento
				SET Estado = @EstadoIngresa, Usuario = @idUsuario
				WHERE id = @SeleccionInstrumento
			ELSE
				PRINT 'Si desea modificar un instrumento, porfavor ingresar un dato nuevo!'
		END
		ELSE
			PRINT 'El instrumento no existe!'
	END TRY
	BEGIN CATCH
		DECLARE @error INT
		SET @error = @@ERROR

		IF (@error = 2627)
			PRINT 'El instrumento ingresada ya existe!'
		ELSE IF (@error = 515)
			PRINT 'El estado no es valido!'
		ELSE
			PRINT ERROR_MESSAGE()
			PRINT ERROR_NUMBER()
	END CATCH
END
GO

CREATE PROCEDURE spInsercionSeccionInstrumento
(
	@Seccion NVARCHAR(2),
	@Categoria NVARCHAR (50) = NULL,
	@Instrumento NVARCHAR (50) = NULL,
	@Estado NVARCHAR(20),
	@Usuario NVARCHAR(20)
)
AS
BEGIN
	BEGIN TRY
		DECLARE @SeleccionInstrumento INT 
		DECLARE @EstadoIngresa INT
		DECLARE @idUsuario INT

		SET @SeleccionInstrumento = (SELECT id FROM Alumnos.Instrumento WHERE Instrumento = @Instrumento)
		SET @EstadoIngresa = (SELECT id FROM Informacion.Estados WHERE Estado = @Estado)
		SET @idUsuario = (SELECT id FROM Seguridad.Usuario WHERE Usuario = @Usuario)

		IF NOT EXISTS (SELECT * FROM Alumnos.SeccionInstrumento WHERE Seccion = @Seccion AND idInstrumento = @SeleccionInstrumento)
			INSERT INTO Alumnos.SeccionInstrumento (Seccion, idInstrumento, Estado, Fecha, Usuario)
				VALUES (@Seccion, @SeleccionInstrumento, @EstadoIngresa, GETDATE(), @idUsuario)
		ELSE
			PRINT 'La seccion ya existe para el instrumento selecionado'
	END TRY
	BEGIN CATCH
		PRINT ERROR_MESSAGE()
		PRINT ERROR_NUMBER()
		PRINT ERROR_LINE()
	END CATCH
END
GO

CREATE PROCEDURE spModificarSeccionInstrumento
(
	@Instrumento NVARCHAR(50),
	@SeccionInstrumento NVARCHAR(2),
	@NuevaSeccion NVARCHAR(2) = NULL,
	@Estado NVARCHAR (20) = NULL,
	@Usuario NVARCHAR(20)
)
AS
BEGIN
	BEGIN TRY
		DECLARE @SeleccionSeccionInstrumento INT
		DECLARE @SeleccionInstrumento INT
		DECLARE @EstadoIngresa INT
		DECLARE @idUsuario INT
		
		SET @EstadoIngresa = (SELECT id FROM Informacion.Estados WHERE Estado = @Estado)
		SET @SeleccionInstrumento = (SELECT id FROM Alumnos.Instrumento WHERE Instrumento = @Instrumento)
		SET @SeleccionSeccionInstrumento = (SELECT id FROM Alumnos.SeccionInstrumento 
											WHERE Seccion = @SeccionInstrumento AND 
											idInstrumento = @SeleccionInstrumento)
		SET @idUsuario = (SELECT id FROM Seguridad.Usuario WHERE Usuario = @Usuario)

		IF EXISTS (SELECT * FROM Alumnos.SeccionInstrumento WHERE Seccion = @SeccionInstrumento AND idInstrumento = @SeleccionInstrumento)
		BEGIN
			IF @NuevaSeccion IS NOT NULL AND @Estado IS NOT NULL
				UPDATE Alumnos.SeccionInstrumento
				SET Seccion = @NuevaSeccion, Estado = @EstadoIngresa, Usuario = @idUsuario
				WHERE id = @SeleccionInstrumento AND idInstrumento = @SeleccionInstrumento
			IF @NuevaSeccion IS NOT NULL AND @Estado IS NULL
				UPDATE Alumnos.SeccionInstrumento
				SET Seccion = @NuevaSeccion, Usuario = @idUsuario
				WHERE id = @SeleccionInstrumento AND idInstrumento = @SeleccionInstrumento
			IF @NuevaSeccion IS NULL AND @Estado IS NOT NULL
			BEGIN
				UPDATE Alumnos.SeccionInstrumento
				SET Estado = @EstadoIngresa, Usuario = @idUsuario
				WHERE id = @SeleccionSeccionInstrumento AND idInstrumento = @SeleccionInstrumento
			END
			ELSE
				PRINT 'Si desea modificar una seccion, porfavor ingresar un dato nuevo!'
		END
		ELSE
			PRINT 'La seccion del instrumento seleccionado no existe!'
	END TRY
	BEGIN CATCH
		DECLARE @error INT
		SET @error = @@ERROR

		IF (@error = 2627)
			PRINT 'La seccion del instrumento ingresado ya existe!'
		ELSE IF (@error = 515)
			PRINT 'El estado no es valido!'
		ELSE
			PRINT ERROR_MESSAGE()
			PRINT ERROR_NUMBER()
	END CATCH
END
GO

CREATE PROCEDURE spInsercionSolfeo
(
	@Seccion NVARCHAR (5),
	@Estado NVARCHAR (20),
	@Usuario NVARCHAR (20)
)
AS
BEGIN
	BEGIN TRY
		DECLARE @EstadoIngresa INT
		DECLARE @idUsuario INT

		SET @EstadoIngresa = (SELECT id FROM Informacion.Estados WHERE Estado = @Estado)
		SET @idUsuario = (SELECT id FROM Seguridad.Usuario WHERE Usuario = @Usuario)

		INSERT INTO Alumnos.Solfeo (Seccion, Estado, Fecha, Usuario)
			VALUES (@Seccion, @EstadoIngresa, GETDATE(), @idUsuario)
	END TRY
	BEGIN CATCH
		DECLARE @error INT
		SET @error = @@ERROR

		IF (@error = 2627)
			PRINT 'La seccion del instrumento ingresado ya existe!'
		ELSE IF (@error = 515)
			PRINT 'El estado no es valido!'
		ELSE
			PRINT ERROR_MESSAGE()
			PRINT ERROR_NUMBER()
	END CATCH
END
GO

CREATE PROCEDURE spModificarSolfeo
(
	@Solfeo NVARCHAR(50),
	@NuevaSeccion NVARCHAR(50) = NULL,
	@Estado NVARCHAR(20) = NULL,
	@Usuario NVARCHAR(20)
)
AS
BEGIN
	BEGIN TRY
		DECLARE @SeleccionSolfeo INT
		DECLARE @EstadoIngresa INT
		DECLARE @idUsuario INT

		SET @EstadoIngresa = (SELECT id FROM Informacion.Estados WHERE Estado = @Estado)
		SET @SeleccionSolfeo = (SELECT id FROM Alumnos.Solfeo WHERE Seccion = @Solfeo)
		SET @idUsuario = (SELECT id FROM Seguridad.Usuario WHERE Usuario = @Usuario)

		IF EXISTS (SELECT * FROM Alumnos.Solfeo WHERE Seccion = @Solfeo)
		BEGIN
			IF @NuevaSeccion IS NOT NULL AND @Estado IS NOT NULL
				UPDATE Alumnos.Solfeo
				SET Seccion = @NuevaSeccion, Estado = @EstadoIngresa, Usuario = @idUsuario
				WHERE id = @SeleccionSolfeo
			ELSE IF @NuevaSeccion IS NOT NULL AND @Estado IS NULL
				UPDATE Alumnos.Solfeo
				SET Seccion = @NuevaSeccion, Usuario = @idUsuario
				WHERE id = @SeleccionSolfeo
			ELSE IF @NuevaSeccion IS NULL AND @Estado IS NOT NULL
				UPDATE Alumnos.Solfeo
				SET Estado = @EstadoIngresa, Usuario = @idUsuario
				WHERE id = @SeleccionSolfeo
			ELSE
				PRINT 'Si desea modificar un seccion de solfeo, porfavor ingresar un dato nuevo!'
		END
		ELSE
			PRINT 'La seccion de solfeo seleccionada no existe!'
	END TRY
	BEGIN CATCH
		DECLARE @error INT
		SET @error = @@ERROR

		IF (@error = 2627)
			PRINT 'La seccion de solfeo ingresada ya existe!'
		ELSE IF (@error = 515)
			PRINT 'El estado no es valido!'
		ELSE
			PRINT ERROR_MESSAGE()
			PRINT ERROR_NUMBER()
			PRINT ERROR_LINE()
	END CATCH
END
GO

CREATE PROCEDURE spInsercionAlumno
(
	@Identidad NVARCHAR (50),
	@Nombre NVARCHAR (50),
	@Apellido NVARCHAR (50),
	@Telefono NVARCHAR (9),
	@TipoAlumno NVARCHAR (10),
	@Edad INT,
	@Estado NVARCHAR (10),
	@Usuario NVARCHAR (20),
	@Descuento DECIMAL
)
AS
BEGIN
	BEGIN TRY
		DECLARE @EstadoIngresa INT
		DECLARE @TipoIngresa INT
		DECLARE @idUsuario INT
		DECLARE @alumno INT
		
		SET @EstadoIngresa = (SELECT id FROM Informacion.Estados WHERE Estado = @Estado)
		SET @TipoIngresa = (SELECT id FROM Alumnos.TipoAlumno WHERE Tipo = @TipoAlumno)
		SET @idUsuario = (SELECT id FROM Seguridad.Usuario WHERE Usuario = @Usuario)

		INSERT INTO Alumnos.Alumno (Identidad, idTipoAlumno, Edad, Estado, Usuario, Fecha, Descuento)
			VALUES (@Identidad, @TipoIngresa, @Edad, @EstadoIngresa, @idUsuario, GETDATE(), @Descuento)

		SET @alumno = (SELECT id FROM Alumnos.Alumno WHERE Identidad = @Identidad)

		INSERT INTO Informacion.Nombre (idAlumno, Nombre)
		VALUES (@alumno, @Nombre)

		INSERT INTO Informacion.Apellido(idAlumno, Apellido)
		VALUES (@alumno, @Apellido)

		INSERT INTO Informacion.Telefono(idAlumno, Telefono)
		VALUES (@alumno, @Telefono)
	END TRY
	BEGIN CATCH
		PRINT ERROR_MESSAGE()
		PRINT ERROR_NUMBER()
		PRINT ERROR_LINE()
	END CATCH
END
GO

CREATE PROCEDURE spModificarAlumno
(
	@AlumnoIdentidad NVARCHAR (15),
	@NuevaIdentidad NVARCHAR (15) = NULL,
	@NuevoNombre NVARCHAR (50) = NULL,
	@NuevoApellido NVARCHAR (50) = NULL,
	@NuevoTelefono NVARCHAR (9) = NULL,
	@NuevoTipoAlumno NVARCHAR (15) = NULL,
	@NuevoEstado NVARCHAR (20) = NULL,
	@Usuario NVARCHAR (20),
	@NuevoDescuento DECIMAL = NULL
)
AS
BEGIN
	BEGIN TRY
		DECLARE @SeleccionarAlumno INT
		DECLARE @EstadoIngresa INT
		DECLARE @NuevoTipoIngresa INT
		DECLARE @idUsuario INT

		SET @SeleccionarAlumno = (SELECT id FROM Alumnos.Alumno WHERE Identidad = @AlumnoIdentidad)
		SET @EstadoIngresa = (SELECT id FROM Informacion.Estados WHERE Estado = @NuevoEstado)
		SET @NuevoTipoIngresa = (SELECT id FROM Alumnos.TipoAlumno WHERE Tipo = @NuevoTipoAlumno)
		SET @idUsuario = (SELECT id FROM Seguridad.Usuario WHERE Usuario = @Usuario)

		IF EXISTS (SELECT * FROM Alumnos.Alumno WHERE Identidad = @AlumnoIdentidad)
		BEGIN
			IF @NuevoNombre IS NOT NULL
			BEGIN
				UPDATE Alumnos.Alumno
				SET Usuario = @idUsuario
				WHERE Identidad = @AlumnoIdentidad

				UPDATE Informacion.Nombre
				SET Nombre = @NuevoNombre
				WHERE idAlumno = @SeleccionarAlumno
				END
			IF @NuevoApellido IS NOT NULL
			BEGIN
				UPDATE Alumnos.Alumno
				SET Usuario = @idUsuario
				WHERE Identidad = @AlumnoIdentidad

				UPDATE Informacion.Apellido
				SET Apellido = @NuevoApellido
				WHERE idAlumno = @SeleccionarAlumno
			END
			IF @NuevoTelefono IS NOT NULL
			BEGIN
				UPDATE Alumnos.Alumno
				SET Usuario = @idUsuario
				WHERE Identidad = @AlumnoIdentidad

				UPDATE Informacion.Telefono
				SET Telefono = @NuevoTelefono
				WHERE idAlumno = @SeleccionarAlumno
				END
			IF @NuevoTipoAlumno IS NOT NULL
			BEGIN
				UPDATE Alumnos.Alumno
				SET idTipoAlumno = @NuevoTipoIngresa, Usuario = @idUsuario
				WHERE Identidad = @AlumnoIdentidad
				END
			IF @NuevoEstado IS NOT NULL
			BEGIN
				UPDATE Alumnos.Alumno
				SET Estado = @EstadoIngresa, Usuario = @idUsuario
				WHERE Identidad = @AlumnoIdentidad
				END
			IF @NuevoDescuento IS NOT NULL
			BEGIN
				UPDATE Alumnos.Alumno
				SET Descuento = @NuevoDescuento, Usuario = @idUsuario
				WHERE Identidad = @AlumnoIdentidad
				END
			IF @NuevaIdentidad IS NOT NULL
				BEGIN	
				UPDATE Alumnos.Alumno
				SET Identidad = @NuevaIdentidad, Usuario = @idUsuario
				WHERE Identidad = @AlumnoIdentidad
				END
			END
		ELSE
			PRINT 'El alumno no existe!'
	END TRY
	BEGIN CATCH
		PRINT ERROR_MESSAGE()
		PRINT ERROR_NUMBER()
		PRINT ERROR_LINE()
	END CATCH
END
GO

CREATE PROCEDURE spInsercionDetalleAlumno
(
	@AlumnoIdentidad NVARCHAR (15),
	@Categoria NVARCHAR (20),
	@Instrumento NVARCHAR (50) = NULL,
	@SeccionInstrumento NVARCHAR (5) = NULL,
	@Usuario NVARCHAR (20),
	@Estado NVARCHAR (20)
)
AS
BEGIN
	BEGIN TRY
		DECLARE @SeleccionAlumno INT
		DECLARE @SeleccionCatgoria INT
		DECLARE @SeleccionInstrumento INT
		DECLARE @SeleccionSeccionInstrumento INT
		DECLARE @EstadoIngresa INT
		DECLARE @idUsuario INT
		
		SET @SeleccionAlumno = (SELECT id FROM Alumnos.Alumno WHERE Identidad = @AlumnoIdentidad)
		SET @SeleccionCatgoria = (SELECT id FROM Alumnos.Categoria WHERE Categoria = @Categoria)
		SET @SeleccionInstrumento = (SELECT id FROM Alumnos.Instrumento WHERE Instrumento = @Instrumento)
		SET @SeleccionSeccionInstrumento = (SELECT id FROM Alumnos.SeccionInstrumento 
											WHERE Seccion = @SeccionInstrumento AND 
											idInstrumento = @SeleccionInstrumento)
		SET @EstadoIngresa = (SELECT id FROM Informacion.Estados WHERE Estado = @Estado)
		SET @idUsuario = (SELECT id FROM Seguridad.Usuario WHERE Usuario = @Usuario)

		IF EXISTS (SELECT COUNT(*) FROM Alumnos.DetalleAlumno WHERE idAlumno = @SeleccionAlumno
						   AND idCategoria = @SeleccionCatgoria AND idInstrumento = @SeleccionInstrumento
						   AND idSeccionInstrumento = @SeleccionSeccionInstrumento)

			INSERT INTO Alumnos.DetalleAlumno (idAlumno, idCategoria, idInstrumento, idSeccionInstrumento,
											   Fecha, Usuario, Estado)
				VALUES (@SeleccionAlumno, @SeleccionCatgoria, @SeleccionInstrumento, @SeleccionSeccionInstrumento,
						GETDATE(), @idUsuario, @EstadoIngresa)
		ELSE
			PRINT 'Ya existe este registro para este alumno'
	END TRY
	BEGIN CATCH
		PRINT ERROR_MESSAGE()
		PRINT ERROR_NUMBER()
		PRINT ERROR_LINE()
	END CATCH
END
GO

CREATE PROCEDURE spModificarDetalleAlumno
(
	@Identidad NVARCHAR (15),
	@CategoriaAnterior NVARCHAR (50),
	@InstrumentoAnterior NVARCHAR (20),
	@SeccionAnterior NVARCHAR (2),
	@Categoria NVARCHAR (50) = NULL,
	@Instrumento NVARCHAR (20) = NULL,
	@SeccionInstrumento NVARCHAR (2) = NULL,
	@Estado NVARCHAR (20) = NULL,
	@Usuario NVARCHAR (20)
)
AS
BEGIN
	BEGIN TRY
		DECLARE @SeleccionAlumno INT
		DECLARE @SeleccionCategoria INT
		DECLARE @SeleccionInstrumento INT
		DECLARE @SeleccionSeccionInstrumento INT
		DECLARE @EstadoIngresa INT
		DECLARE @SeleccionCategoriaAnterior INT
		DECLARE @SeleccionInstrumentoAnterior INT
		DECLARE @SeleccionSeccionAnterior INT
		DECLARE @idUsuario INT

		SET @SeleccionCategoriaAnterior = (SELECT id FROM Alumnos.Categoria WHERE Categoria = @CategoriaAnterior)
		SET @SeleccionInstrumentoAnterior = (SELECT id FROM Alumnos.Instrumento WHERE Instrumento = @InstrumentoAnterior)
		SET @SeleccionSeccionAnterior = (SELECT id FROM Alumnos.SeccionInstrumento
											WHERE Seccion = @SeccionAnterior
											AND idInstrumento = @SeleccionInstrumentoAnterior)
		SET @SeleccionCategoria = (SELECT id FROM Alumnos.Categoria WHERE Categoria = @Categoria)
		SET @SeleccionInstrumento = (SELECT id FROM Alumnos.Instrumento WHERE Instrumento = @Instrumento)
		SET @SeleccionSeccionInstrumento = (SELECT id FROM Alumnos.SeccionInstrumento
											WHERE Seccion = @SeccionInstrumento 
											AND idInstrumento = @SeleccionInstrumento)
		SET @SeleccionAlumno = (SELECT id FROM Alumnos.DetalleAlumno 
								 WHERE idAlumno = (SELECT id FROM Alumnos.Alumno
								 			        WHERE Identidad = @Identidad)
								 AND idCategoria = (SELECT id FROM Alumnos.Categoria
												    WHERE Categoria = @CategoriaAnterior)
								 AND idInstrumento = (SELECT id FROM Alumnos.Instrumento
													  WHERE Instrumento = @InstrumentoAnterior)
								 AND idSeccionInstrumento = (SELECT id FROM Alumnos.SeccionInstrumento
															 WHERE Seccion = @SeccionAnterior
															 AND idInstrumento = (SELECT id FROM
															 Alumnos.Instrumento WHERE Instrumento =
															 @InstrumentoAnterior)))
		SET @EstadoIngresa = (SELECT id FROM Informacion.Estados WHERE Estado = @Estado)
		SET @idUsuario = (SELECT id FROM Seguridad.Usuario WHERE Usuario = @Usuario)

		IF EXISTS (SELECT * FROM Alumnos.DetalleAlumno WHERE id = @SeleccionAlumno)
		BEGIN
			IF @Categoria IS NOT NULL
				UPDATE Alumnos.DetalleAlumno
				SET idCategoria = @SeleccionCategoria, Usuario = @idUsuario
				WHERE id = @SeleccionAlumno
			IF @Instrumento IS NOT NULL
				UPDATE Alumnos.DetalleAlumno
				SET idInstrumento = @SeleccionInstrumento, Usuario = @idUsuario
				WHERE id = @SeleccionAlumno
			IF @SeccionInstrumento IS NOT NULL
				UPDATE Alumnos.DetalleAlumno
				SET idSeccionInstrumento = @SeleccionSeccionInstrumento, Usuario = @idUsuario
				WHERE id = @SeleccionAlumno
			IF @Estado IS NOT NULL
				UPDATE Alumnos.DetalleAlumno
				SET Estado = @EstadoIngresa, Usuario = @idUsuario
				WHERE id = @SeleccionAlumno
		END
	END TRY
	BEGIN CATCH
		DECLARE @error INT
		SET @error = @@ERROR

		IF (@error = 2627)
			PRINT 'El registro ingresado para este alumno ya existe!'
		ELSE IF (@error = 515)
			PRINT 'El estado no es valido!'
		ELSE
			PRINT ERROR_MESSAGE()
			PRINT ERROR_NUMBER()
			PRINT ERROR_LINE()		
	END CATCH
END
GO

CREATE PROCEDURE spInsercionSolfeoAlumno
(
	@Identidad NVARCHAR (15),
	@Solfeo NVARCHAR (5),
	@Estado NVARCHAR (20),
	@Usuario NVARCHAR (20)
)
AS
BEGIN
	BEGIN TRY
		DECLARE @SeleccionAlumno INT
		DECLARE @SeleccionSolfeo INT
		DECLARE @EstadoIngresa INT
		DECLARE @idUsuario INT

		SET @SeleccionAlumno = (SELECT id FROM Alumnos.Alumno WHERE Identidad = @Identidad)
		SET @SeleccionSolfeo = (SELECT id FROM Alumnos.Solfeo WHERE Seccion = @Solfeo)
		SET @EstadoIngresa = (SELECT id FROM Informacion.Estados WHERE Estado = @Estado)
		SET @idUsuario = (SELECT id FROM Seguridad.Usuario WHERE Usuario = @Usuario)

		IF NOT EXISTS (SELECT * FROM Alumnos.SolfeoAlumno WHERE idAlumno = @SeleccionAlumno
						   AND idSolfeo = @SeleccionSolfeo)
			INSERT INTO Alumnos.SolfeoAlumno (idAlumno, idSolfeo, Fecha, Usuario, Estado)
				VALUES (@SeleccionAlumno, @SeleccionSolfeo, GETDATE(), @idUsuario, @EstadoIngresa)
	END TRY
	BEGIN CATCH
		PRINT ERROR_MESSAGE()
		PRINT ERROR_NUMBER()
		PRINT ERROR_LINE()
	END CATCH
END
GO

CREATE PROCEDURE spModificarSolfeoAlumno
(
	@Identidad NVARCHAR (15),
	@Solfeo NVARCHAR (5),
	@NuevoSolfeo NVARCHAR (5) = NULL,
	@Estado NVARCHAR (20)
)
AS
BEGIN
	BEGIN TRY
		DECLARE @SeleccionAlumno INT
		DECLARE @SeleccionSolfeo INT
		DECLARE @SeleccionNuevoSolfeo INT
		DECLARE @EstadoIngresa INT
		DECLARE @idUsuario INT

		SET @SeleccionAlumno  = (SELECT id FROM Alumnos.Alumno WHERE Identidad = @Identidad)
		SET @SeleccionSolfeo = (SELECT id FROM Alumnos.Solfeo WHERE Seccion = @Solfeo)
		SET @SeleccionNuevoSolfeo = (SELECT id FROM Alumnos.Solfeo WHERE Seccion = @NuevoSolfeo)
		SET @EstadoIngresa = (SELECT id FROM Informacion.Estados WHERE Estado = @Estado)

		IF NOT EXISTS (SELECT * FROM Alumnos.SolfeoAlumno 
						   WHERE idAlumno = @SeleccionAlumno AND idSolfeo = @SeleccionSolfeo)
			BEGIN
				IF NOT EXISTS (SELECT * FROM Alumnos.SolfeoAlumno 
						   WHERE idAlumno = @SeleccionAlumno AND idSolfeo = @SeleccionNuevoSolfeo)
					BEGIN
						IF (@NuevoSolfeo IS NOT NULL)
							UPDATE Alumnos.SolfeoAlumno
							SET idSolfeo = @SeleccionNuevoSolfeo
						IF (@Estado IS NOT NULL)
							UPDATE Alumnos.SolfeoAlumno
							SET Estado = @EstadoIngresa
					END
				ELSE
					PRINT 'Ya existe este registro! Revise la informacion.'
			END
		ELSE
			PRINT 'El registro no existe!'
	END TRY
	BEGIN CATCH
		PRINT ERROR_MESSAGE()
		PRINT ERROR_NUMBER()
		PRINT ERROR_LINE()
	END CATCH
END
GO

CREATE PROCEDURE spInsercionMatricula
(
	@Alumno NVARCHAR (15),
	@Usuario NVARCHAR (20)
)
AS
BEGIN
	BEGIN TRY
		DECLARE @SeleccionAlumno INT
		DECLARE @EstadoIngresa INT
		DECLARE @idUsuario INT

		SET @SeleccionAlumno = (SELECT id FROM Alumnos.Alumno WHERE Identidad = @Alumno)
		SET @EstadoIngresa = (SELECT id FROM Informacion.Estados WHERE Estado = 'No Matriculado')
		SET @idUsuario = (SELECT id FROM Seguridad.Usuario WHERE Usuario = @Usuario)
		
		IF NOT EXISTS (SELECT * FROM MatriculaMensualidad.Matricula WHERE idAlumno = @SeleccionAlumno)
			INSERT INTO MatriculaMensualidad.Matricula (idAlumno, Matricula, idEstado, Fecha, Usuario)
				VALUES (@SeleccionAlumno, 300, @EstadoIngresa, GETDATE(), @idUsuario)
			
	END TRY
	BEGIN CATCH
		PRINT ERROR_MESSAGE()
		PRINT ERROR_NUMBER()
		PRINT ERROR_PROCEDURE()
	END CATCH
END
GO

CREATE PROCEDURE spModificarMatricula
(
	@Alumno NVARCHAR (15),
	@Usuario NVARCHAR (15)
)
AS
BEGIN
	BEGIN TRY
		DECLARE @SeleccionAlumno INT
		DECLARE @EstadoIngresa INT
		DECLARE @idUsuario INT

		SET @SeleccionAlumno = (SELECT id FROM Alumnos.Alumno WHERE Identidad = @Alumno)
		SET @EstadoIngresa = (SELECT id FROM Informacion.Estados WHERE Estado = 'Matriculado')
		SET @idUsuario = (SELECT id FROM Seguridad.Usuario WHERE Usuario = @Usuario)

		UPDATE MatriculaMensualidad.Matricula
		SET idEstado = @EstadoIngresa, Fecha = GETDATE(), Usuario = @idUsuario
		WHERE idAlumno = @SeleccionAlumno
		
	END TRY
	BEGIN CATCH
		PRINT ERROR_MESSAGE()
		PRINT ERROR_NUMBER()
		PRINT ERROR_PROCEDURE()
	END CATCH
END
GO

CREATE PROCEDURE spInsercionMensualidad
(
	@Alumno NVARCHAR(15),
	@Usuario NVARCHAR (20)
)
AS
BEGIN
	BEGIN TRY
		DECLARE @SeleccionAlumno INT
		DECLARE @SeleccionMensualidad INT
		DECLARE @EstadoIngresa INT
		DECLARE @Validacion INT
		DECLARE @Calculo INT
		DECLARE @SeleccionDescuento INT

		SET @SeleccionAlumno = (SELECT id FROM Alumnos.Alumno WHERE Identidad = @Alumno)
		SET @SeleccionMensualidad = (SELECT Precio FROM Alumnos.Categoria WHERE id = 2)
		SET @EstadoIngresa = (SELECT id FROM Informacion.Estados WHERE Estado = 'No Pagado')
		SET @Validacion = (SELECT COUNT(*) FROM Alumnos.DetalleAlumno
						   WHERE idAlumno = 1001)
		SET @SeleccionDescuento = (SELECT Descuento FROM Alumnos.Alumno WHERE id = @Alumno)

		IF (@Validacion = 0)
			INSERT INTO MatriculaMensualidad.Mensualidad (idAlumno, Mensualidad, idEstado, Fecha, Usuario)
				VALUES (@Alumno, @SeleccionMensualidad - @SeleccionDescuento, @EstadoIngresa, GETDATE(), @Usuario)

	END TRY
	BEGIN CATCH
		PRINT ERROR_MESSAGE()
		PRINT ERROR_NUMBER()
		PRINT ERROR_PROCEDURE()
	END CATCH
END
GO

CREATE PROCEDURE SP_ModificarMensualidad
(
	@Alumno NVARCHAR (15),
	@Fecha DATETIME,
	@Estado NVARCHAR (20) = NULL,
	@Usuario NVARCHAR (20)
)
AS
BEGIN
	BEGIN TRY
		DECLARE @SeleccionAlumno INT
		DECLARE @EstadoIngresa INT
		DECLARE @Validacion INT

		SET @SeleccionAlumno = (SELECT id FROM Alumnos.Alumno WHERE Identidad = @Alumno)
		SET @EstadoIngresa = (SELECT id FROM MatriculaMensualidad.Estados WHERE Estado = @Estado)
		--SET @Validacion = (
		
		IF @Estado IS NOT NULL
			UPDATE MatriculaMensualidad.Mensualidad
			SET idEstado = @EstadoIngresa
			WHERE idAlumno = @SeleccionAlumno AND Fecha = @Fecha			
	END TRY
	BEGIN CATCH
	END CATCH
END
GO
select * from Planilla.Maestro
EXEC spInsercionMaestro '0107-1998-00742', 'Christopher David', 'Fiallos', '9797-2178', 'Activo', '3'
go
CREATE PROCEDURE spInsercionMaestro
(
	@Identidad NVARCHAR(15),
	@Nombre NVARCHAR(50),
	@Apellido NVARCHAR(50),
	@Telefono NVARCHAR(9),
	@Estado NVARCHAR(20),
	@Usuario NVARCHAR(20)
)
AS
BEGIN
	BEGIN TRY
		DECLARE @EstadoIngresa INT
		DECLARE @idMaestro INT

		SET @EstadoIngresa = (SELECT id FROM Informacion.Estados WHERE Estado = @Estado)

		INSERT INTO Planilla.Maestro (Identidad, Estado, Fecha, Usuario)
			VALUES (@Identidad, @EstadoIngresa, GETDATE(), @Usuario)

		SET @idMaestro = (SELECT id FROM Planilla.Maestro WHERE Identidad = @Identidad)

		INSERT INTO Informacion.Nombre (idMaestro, Nombre)
		VALUES (@idMaestro, @Nombre)

		INSERT INTO Informacion.Apellido (idMaestro, Apellido)
		VALUES (@idMaestro, @Apellido)

		INSERT INTO Informacion.Telefono(idMaestro, Telefono)
		VALUES (@idMaestro, @Telefono)
	END TRY
	BEGIN CATCH
		DECLARE @error INT

		SET @error = @@ERROR

		IF (@error = 515)
			PRINT 'Profavor ingrese todos los datos solicitados!'
		ELSE
			PRINT ERROR_MESSAGE()
			PRINT ERROR_NUMBER()
			PRINT ERROR_LINE()
			PRINT ERROR_PROCEDURE()
	END CATCH
END
GO

ALTER PROCEDURE SP_ModificarMaestro
(
	@MaestroIdentidad NVARCHAR (15),
	@NuevaIdentidad NVARCHAR (15) = NULL,
	@NuevoNombre NVARCHAR (50) = NULL,
	@NuevoApellido NVARCHAR (50) = NULL,
	@NuevoTelefono NVARCHAR (9) = NULL,
	@NuevoEstado NVARCHAR (20) = NULL,
	@Usuario NVARCHAR (20)
)
AS
BEGIN
	BEGIN TRY
		DECLARE @SeleccionarMaestro INT
		DECLARE @EstadoIngresa INT
		DECLARE @Validacion INT

		SET @Validacion = (SELECT COUNT(*) FROM Planilla.Maestro WHERE Identidad = @MaestroIdentidad)
		SET @SeleccionarMaestro = (SELECT id FROM Planilla.Maestro WHERE Identidad = @MaestroIdentidad)
		SET @EstadoIngresa = (SELECT id FROM MatriculaMensualidad.Estados WHERE Estado = @NuevoEstado)

		IF (@Validacion = 1)
		BEGIN
			IF @NuevoNombre IS NOT NULL
			BEGIN
				UPDATE Planilla.Maestro
				SET Nombre = @NuevoNombre, Usuario = @Usuario
				WHERE Identidad = @MaestroIdentidad
				PRINT 'ingresado'
				END
			IF @NuevoApellido IS NOT NULL
			BEGIN
				UPDATE Planilla.Maestro
				SET Apellido = @NuevoApellido, Usuario = @Usuario
				WHERE Identidad = @MaestroIdentidad
				PRINT 'ingresado'
				END
			IF @NuevoTelefono IS NOT NULL
			BEGIN
				UPDATE Planilla.Maestro
				SET Telefono = @NuevoTelefono, Usuario = @Usuario
				WHERE Identidad = @MaestroIdentidad
				PRINT 'ingresado'
				END
			IF @NuevoEstado IS NOT NULL
			BEGIN
				UPDATE Planilla.Maestro
				SET Estado = @EstadoIngresa, Usuario = @Usuario
				WHERE Identidad = @MaestroIdentidad
				PRINT 'ingresado'
				END
			IF @NuevaIdentidad IS NOT NULL
				BEGIN	
				UPDATE Planilla.Maestro
				SET Identidad = @NuevaIdentidad, Usuario = @Usuario
				WHERE Identidad = @MaestroIdentidad
				PRINT 'ingresado'
				END
			END
		ELSE
			PRINT 'El maestro no existe!'
	END TRY
	BEGIN CATCH
		DECLARE @error INT
		SET @error = @@ERROR

		IF (@error = 2627)
			PRINT 'El maestro ingresado ya existe!'
		ELSE IF (@error = 515)
			PRINT 'El estado no es valido!'
		ELSE IF (@error = 547)
			PRINT 'Porfavor revise el formato de la identidad y el telefono'
		ELSE
			PRINT ERROR_MESSAGE()
			PRINT ERROR_NUMBER()
			PRINT ERROR_LINE()
	END CATCH
END
GO

CREATE PROCEDURE SP_InsercionDetalleMaestro
(
	@MaestroIdentidad NVARCHAR (15),
	@Categoria NVARCHAR (20),
	@Instrumento NVARCHAR (50) = NULL,
	@SeccionInstrumento NVARCHAR (5) = NULL,
	@Usuario NVARCHAR (20),
	@Estado NVARCHAR (20)
)
AS
BEGIN
	BEGIN TRY
		DECLARE @SeleccionMaestro INT
		DECLARE @SeleccionCatgoria INT
		DECLARE @SeleccionInstrumento INT
		DECLARE @SeleccionSeccionInstrumento INT
		DECLARE @EstadoIngresa INT
		DECLARE @Validacion INT
		
		SET @SeleccionMaestro = (SELECT id FROM Planilla.Maestro WHERE Identidad = @MaestroIdentidad)
		SET @SeleccionCatgoria = (SELECT id FROM Alumnos.Categoria WHERE Categoria = @Categoria)
		SET @SeleccionInstrumento = (SELECT id FROM Alumnos.Instrumento WHERE Instrumento = @Instrumento)
		SET @SeleccionSeccionInstrumento = (SELECT id FROM Alumnos.SeccionInstrumento 
											WHERE Seccion = @SeccionInstrumento AND 
											idInstrumento = @SeleccionInstrumento)
		SET @EstadoIngresa = (SELECT id FROM MatriculaMensualidad.Estados WHERE Estado = @Estado)
		SET @Validacion = (SELECT COUNT(*) FROM Planilla.DetalleMaestro WHERE idMaestro = @SeleccionMaestro
						   AND idCategoria = @SeleccionCatgoria AND idInstrumento = @SeleccionInstrumento
						   AND idSeccionInstrumento = @SeleccionSeccionInstrumento)
		IF (@Validacion = 0)
			INSERT INTO Planilla.DetalleMaestro (idMaestro, idCategoria, idInstrumento, idSeccionInstrumento,
													 Fecha, Usuario, Estado)
				VALUES (@SeleccionMaestro, @SeleccionCatgoria, @SeleccionInstrumento, @SeleccionSeccionInstrumento,
						GETDATE(), @Usuario, @EstadoIngresa)
		ELSE
			PRINT 'Ya existe este registro para este maestro!'
	END TRY
	BEGIN CATCH
		DECLARE @error INT
		SET @error = @@ERROR

		IF (@error = 2627)
			PRINT 'El maestro ingresado ya existe!'
		ELSE IF (@error = 515)
			PRINT 'El estado no es valido!'
		ELSE IF (@error = 547)
			PRINT 'Porfavor revise el formato de la identidad y el telefono'
		ELSE
			PRINT ERROR_MESSAGE()
			PRINT ERROR_NUMBER()
			PRINT ERROR_LINE()
	END CATCH
END
GO

ALTER PROCEDURE SP_ModificarDetalleMaestro
(
	@Maestro NVARCHAR (15),
	@CategoriaAnterior NVARCHAR (50),
	@InstrumentoAnterior NVARCHAR (20),
	@SeccionAnterior NVARCHAR (2),
	@Categoria NVARCHAR (50) = NULL,
	@Instrumento NVARCHAR (20) = NULL,
	@SeccionInstrumento NVARCHAR (2) = NULL,
	@Estado NVARCHAR (20) = NULL,
	@Usuario NVARCHAR (20)
)
AS
BEGIN
	BEGIN TRY
		DECLARE @SeleccionMaestro INT
		DECLARE @Validacion INT
		DECLARE @SeleccionCategoria INT
		DECLARE @SeleccionInstrumento INT
		DECLARE @SeleccionSeccionInstrumento INT
		DECLARE @EstadoIngresa INT
		DECLARE @SeleccionCategoriaAnterior INT
		DECLARE @SeleccionInstrumentoAnterior INT
		DECLARE @SeleccionSeccionAnterior INT

		SET @SeleccionCategoriaAnterior = (SELECT id FROM Alumnos.Categoria WHERE Categoria = @CategoriaAnterior)
		SET @SeleccionInstrumentoAnterior = (SELECT id FROM Alumnos.Instrumento WHERE Instrumento = @InstrumentoAnterior)
		SET @SeleccionSeccionAnterior = (SELECT id FROM Alumnos.SeccionInstrumento
											WHERE Seccion = @SeccionAnterior
											AND idInstrumento = @SeleccionInstrumentoAnterior)
		SET @SeleccionCategoria = (SELECT id FROM Alumnos.Categoria WHERE Categoria = @Categoria)
		SET @SeleccionInstrumento = (SELECT id FROM Alumnos.Instrumento WHERE Instrumento = @Instrumento)
		SET @SeleccionSeccionInstrumento = (SELECT id FROM Alumnos.SeccionInstrumento
											WHERE Seccion = @SeccionInstrumento 
											AND idInstrumento = @SeleccionInstrumento)
		SET @SeleccionMaestro = (SELECT id FROM Planilla.DetalleMaestro 
								 WHERE idMaestro = (SELECT id FROM Planilla.Maestro
								 			        WHERE Identidad = @Maestro)
								 AND idCategoria = (SELECT id FROM Alumnos.Categoria
												    WHERE Categoria = @CategoriaAnterior)
								 AND idInstrumento = (SELECT id FROM Alumnos.Instrumento
													  WHERE Instrumento = @InstrumentoAnterior)
								 AND idSeccionInstrumento = (SELECT id FROM Alumnos.SeccionInstrumento
															 WHERE Seccion = @SeccionAnterior
															 AND idInstrumento = (SELECT id FROM
															 Alumnos.Instrumento WHERE Instrumento =
															 @InstrumentoAnterior)))
		SET @EstadoIngresa = (SELECT id FROM MatriculaMensualidad.Estados WHERE Estado = @Estado)
		SET @Validacion = (SELECT COUNT(*) FROM Planilla.DetalleMaestro WHERE id = @SeleccionMaestro)

		IF (@Validacion = 1)
		BEGIN
			IF @Categoria IS NOT NULL
				UPDATE Planilla.DetalleMaestro
				SET idCategoria = @SeleccionCategoria
				WHERE id = @SeleccionMaestro
			IF @Instrumento IS NOT NULL
				UPDATE Planilla.DetalleMaestro
				SET idInstrumento = @SeleccionInstrumento
				WHERE id = @SeleccionMaestro
			IF @SeccionInstrumento IS NOT NULL
				UPDATE Planilla.DetalleMaestro
				SET idSeccionInstrumento = @SeleccionSeccionInstrumento
				WHERE id = @SeleccionMaestro
			IF @Estado IS NOT NULL
				UPDATE Planilla.DetalleMaestro
				SET Estado = @EstadoIngresa
				WHERE id = @SeleccionMaestro
		END
	END TRY
	BEGIN CATCH
		DECLARE @error INT
		SET @error = @@ERROR

		IF (@error = 2627)
			PRINT 'El registro ingresado para este maestro ya existe!'
		--ELSE IF (@error = 515)
		--	PRINT 'El estado no es valido!'
		ELSE
			PRINT ERROR_MESSAGE()
			PRINT ERROR_NUMBER()
			PRINT ERROR_LINE()		
	END CATCH
END
GO

CREATE PROCEDURE SP_InsercionHorasTrabajadasDia
(
	@Maestro NVARCHAR (15),
	@Horas INT,
	@Estado NVARCHAR (20),
	@Usuario NVARCHAR (20)
)
AS
BEGIN
	BEGIN TRY
		DECLARE @SeleccionMaestro INT
		DECLARE @EstadoIngresa INT

		SET @SeleccionMaestro = (SELECT id FROM Planilla.Maestro WHERE Identidad = @Maestro)
		SET @EstadoIngresa = (SELECT id FROM MatriculaMensualidad.Estados WHERE Estado = @Estado)

		INSERT INTO Planilla.HorasTrabajadasDia (idMaestro, Horas, Fecha, Estado, Usuario)
			VALUES (@SeleccionMaestro, @Horas, GETDATE(), @EstadoIngresa, @Usuario)
		
	END TRY
	BEGIN CATCH
		DECLARE @error INT
		SET @error = @@ERROR

		PRINT ERROR_MESSAGE()
		PRINT ERROR_NUMBER()
		PRINT ERROR_LINE()
		PRINT ERROR_PROCEDURE()
	END CATCH
END
GO

CREATE PROCEDURE SP_PagoMensualMaestro
(
	@Maestro NVARCHAR(15),
	@Sueldo DECIMAL,
	@Usuario NVARCHAR (20),
	@Estado NVARCHAR (20)
)
AS
BEGIN
	BEGIN TRY
		DECLARE @SeleccionMaestro INT
		DECLARE @EstadoIngresa INT

		SET @SeleccionMaestro = (SELECT id FROM Planilla.Maestro WHERE Identidad = @Maestro)
		SET @EstadoIngresa = (SELECT id FROM MatriculaMensualidad.Estados WHERE Estado = @Estado)

		INSERT INTO Planilla.PagoMensualMaestro (idMaestro, Sueldo, Fecha, Usuario, Estado)
			VALUES (@SeleccionMaestro, @Sueldo, GETDATE(), @Usuario, @EstadoIngresa)
	END TRY
	BEGIN CATCH
		DECLARE @error INT
		SET @error = @@ERROR

		PRINT ERROR_MESSAGE()
		PRINT ERROR_NUMBER()
		PRINT ERROR_LINE()
		PRINT ERROR_PROCEDURE()
	END CATCH
END
GO

CREATE PROCEDURE SP_ModificarPagoMensualMaestro
(
	@Maestro NVARCHAR (15),
	@Sueldo DECIMAL,
	@Usuario NVARCHAR (20),
	@Estado NVARCHAR (20)
)
AS
BEGIN
	BEGIN TRY
		DECLARE @SeleccionMaestro INT
		DECLARE @EstadoIngresa INT
		DECLARE @SeleccionRegistro INT

		SET @SeleccionMaestro = (SELECT id FROM Planilla.Maestro WHERE Identidad = @Maestro)
		SET @EstadoIngresa = (SELECT id FROM MatriculaMensualidad.Estados WHERE Estado = @Estado)
		SET @SeleccionRegistro = (SELECT id FROM Planilla.PagoMensualMaestro 
								  WHERE idMaestro = @SeleccionMaestro
								  AND Fecha = (SELECT MAX(Fecha) FROM Planilla.PagoMensualMaestro
											   WHERE idMaestro = @SeleccionMaestro))
		
		UPDATE Planilla.PagoMensualMaestro
		SET Sueldo = @Sueldo, Fecha = GETDATE()
		WHERE id = @SeleccionRegistro
	END TRY
	BEGIN CATCH
	END CATCH
END
GO

ALTER PROCEDURE SP_InsercionSolfeoMaestro
(
	@Maestro NVARCHAR (15),
	@Solfeo NVARCHAR (5),
	@Estado NVARCHAR (20),
	@Usuario NVARCHAR (20)
)
AS
BEGIN
	BEGIN TRY
		DECLARE @SeleccionMaestro INT
		DECLARE @SeleccionSolfeo INT
		DECLARE @EstadoIngresa INT
		DECLARE @Validacion INT

		SET @SeleccionMaestro = (SELECT id FROM Planilla.Maestro WHERE Identidad = @Maestro)
		SET @SeleccionSolfeo = (SELECT id FROM Alumnos.Solfeo WHERE Seccion = @Solfeo)
		SET @EstadoIngresa = (SELECT id FROM MatriculaMensualidad.Estados WHERE Estado = @Estado)
		SET @Validacion = (SELECT COUNT(*) FROM Planilla.SolfeoMaestro WHERE idMaestro = @SeleccionMaestro
						   AND idSolfeo = @SeleccionSolfeo)

		IF (@Validacion = 0)

			INSERT INTO Planilla.SolfeoMaestro (idMaestro, idSolfeo, Fecha, Usuario, Estado)
				VALUES (@SeleccionMaestro, @SeleccionSolfeo, GETDATE(), @Usuario, @EstadoIngresa)
		ELSE
			PRINT 'Este registro para este maestro ya existe!'
	END TRY
	BEGIN CATCH
		DECLARE @error INT
		SET @error = @@ERROR

		PRINT ERROR_MESSAGE()
		PRINT ERROR_NUMBER()
		PRINT ERROR_LINE()
	END CATCH
END
GO

ALTER PROCEDURE SP_ModificarSolfeoMaestro
(
	@Maestro NVARCHAR (15),
	@Solfeo NVARCHAR (5),
	@NuevoSolfeo NVARCHAR (5) = NULL,
	@Estado NVARCHAR (5) = NULL,
	@Usuario NVARCHAR (20)
)
AS
BEGIN
	BEGIN TRY
		DECLARE @SeleccionMaestro INT
		DECLARE @SeleccionSolfeo INT
		DECLARE @SeleccionNuevoSolfeo INT
		DECLARE @EstadoIngresa INT
		DECLARE @Validacion INT
		DECLARE @Validacion2 INT
		DECLARE @SeleccionRegistro INT

		SET @SeleccionMaestro = (SELECT id FROM Planilla.Maestro WHERE Identidad = @Maestro)
		SET @SeleccionSolfeo = (SELECT id FROM Alumnos.Solfeo WHERE Seccion = @Solfeo)
		SET @SeleccionNuevoSolfeo = (SELECT id FROM Alumnos.Solfeo WHERE Seccion = @NuevoSolfeo)
		SET @EstadoIngresa = (SELECT id FROM MatriculaMensualidad.Estados WHERE Estado = @Estado)
		SET @Validacion = (SELECT COUNT(*) FROM Planilla.SolfeoMaestro 
						   WHERE idMaestro = @SeleccionMaestro AND idSolfeo = @SeleccionSolfeo)
		SET @Validacion2 = (SELECT COUNT(*) FROM Planilla.SolfeoMaestro
						   WHERE idMaestro = @SeleccionMaestro AND idSolfeo = @SeleccionNuevoSolfeo)
		SET @SeleccionRegistro = (SELECT id FROM Planilla.SolfeoMaestro 
								  WHERE idMaestro = @SeleccionMaestro
								  AND idSolfeo = @SeleccionSolfeo AND Estado = 6)

		IF (@Validacion = 1)
			BEGIN
				IF (@Validacion2 = 0)
					BEGIN
						IF (@NuevoSolfeo IS NOT NULL)
							UPDATE Planilla.SolfeoMaestro
							SET idSolfeo = @SeleccionNuevoSolfeo
							WHERE id = @SeleccionRegistro
						IF (@Estado IS NOT NULL)
							UPDATE Alumnos.SolfeoAlumno
							SET Estado = @EstadoIngresa
							WHERE id = @SeleccionRegistro
						IF (@Usuario IS NOT NULL)
							UPDATE Planilla.SolfeoMaestro
							SET Usuario = @Usuario
							WHERE id = @SeleccionRegistro
					END
				ELSE
					PRINT 'Ya existe este registro! Revise la informacion.'
			END
		ELSE
			PRINT 'El registro no existe!'
	END TRY
	BEGIN CATCH
		DECLARE @error INT
		SET @error = @@ERROR

		IF (@error = 2627)
			PRINT 'El registro ingresado para este maestro ya existe!'
		ELSE IF (@error = 515)
			PRINT 'El estado no es valido!'
		ELSE
			PRINT ERROR_MESSAGE()
			PRINT ERROR_NUMBER()
			PRINT ERROR_LINE()
	END CATCH
END
GO

CREATE PROCEDURE spInsercionCargo
(
	@Cargo NVARCHAR (100),
	@Estado NVARCHAR (20)
)
AS
BEGIN
	BEGIN TRY
		DECLARE @EstadoIngresa INT

		SET @EstadoIngresa = (SELECT id FROM Informacion.Estados WHERE Estado = @Estado)

		INSERT INTO Seguridad.Cargo (Cargo, Estado, Fecha)
			VALUES (@Cargo, @EstadoIngresa, GETDATE())
	END TRY
	BEGIN CATCH
		DECLARE @error INT
		SET @error = @@ERROR

		IF (@error = 2627)
			PRINT 'El registro ingresado para este maestro ya existe!'
		ELSE IF (@error = 515)
			PRINT 'El estado no es valido!'
		ELSE
			PRINT ERROR_MESSAGE()
			PRINT ERROR_NUMBER()
			PRINT ERROR_LINE()
	END CATCH
END
GO

CREATE PROCEDURE spModificarCargo
(
	@Cargo NVARCHAR (100),
	@NuevoCargo NVARCHAR (100) = NULL,
	@Estado NVARCHAR(20) = NULL
)
AS
BEGIN
	BEGIN TRY
		DECLARE @EstadoIngresa INT
		DECLARE @Validacion INT

		SET @EstadoIngresa = (SELECT id FROM Informacion.Estados WHERE Estado = @Estado)
		SET @Validacion = (SELECT COUNT(*) FROM Seguridad.Cargo WHERE Cargo = @NuevoCargo)

		IF (@Validacion = 0)
		BEGIN
			IF (@Estado IS NOT NULL)
				UPDATE Seguridad.Cargo
				SET Estado = @EstadoIngresa
				WHERE Cargo = @Cargo
			IF (@NuevoCargo IS NOT NULL)
				UPDATE Seguridad.Cargo
				SET Cargo = @NuevoCargo
				WHERE Cargo = @Cargo
		END
		ELSE
			PRINT 'El Cargo no existe!'
	END TRY
	BEGIN CATCH
		DECLARE @error INT
		SET @error = @@ERROR

		IF (@error = 2627)
			PRINT 'El registro ingresado para este maestro ya existe!'
		ELSE IF (@error = 515)
			PRINT 'El estado no es valido!'
		ELSE
			PRINT ERROR_MESSAGE()
			PRINT ERROR_NUMBER()
			PRINT ERROR_LINE()
	END CATCH
END
GO

CREATE PROCEDURE spInsercionUsuario
(
	@Maestro NVARCHAR (15),
	@Usuario NVARCHAR (20),
	@Contrasena NVARCHAR (256),
	@Cargo NVARCHAR (100),
	@Estado NVARCHAR (20)
)
AS
BEGIN
	BEGIN TRY
		DECLARE @SeleccionMaestro INT
		DECLARE @SeleccionCargo INT
		DECLARE @EstadoIngresa INT

		SET @SeleccionMaestro = (SELECT id FROM Planilla.Maestro WHERE Identidad = @Maestro)
		SET @SeleccionCargo = (SELECT id FROM Seguridad.Cargo WHERE Cargo = @Cargo)
		SET @EstadoIngresa = (SELECT id FROM Informacion.Estados WHERE Estado = @Estado)

		IF NOT EXISTS (SELECT * FROM Seguridad.Usuario WHERE idMaestro = @SeleccionMaestro)
			INSERT INTO Seguridad.Usuario (Usuario, Pass, Fecha, Estado, idCargo, idMaestro)
				VALUES (@Usuario, @Contrasena, GETDATE(), @EstadoIngresa, @SeleccionCargo, @SeleccionMaestro)
		ELSE
			PRINT 'Un maestro no puede tener mas de 1 usuario!'
	END TRY
	BEGIN CATCH
		DECLARE @error INT
		SET @error = @@ERROR

		IF (@error = 2627)
			PRINT 'El usuario ya existe!'
		ELSE IF (@error = 515)
			PRINT 'El estado no es valido!'
		ELSE
			PRINT ERROR_MESSAGE()
			PRINT ERROR_NUMBER()
			PRINT ERROR_LINE()
	END CATCH
END
GO

CREATE PROCEDURE SP_ModificarUsuario
(
	@UsuarioAnterior NVARCHAR (20),
	@UsuarioNuevo NVARCHAR (20) = NULL,
	@Contrasena NVARCHAR (256) = NULL,
	@Estado NVARCHAR (20) = NULL
)	
AS
BEGIN
	BEGIN TRY
		DECLARE @SeleccionUsuario INT
		DECLARE @EstadoIngresa INT

		SET @EstadoIngresa = (SELECT id FROM Informacion.Estados WHERE Estado = @Estado)
		SET @SeleccionUsuario = (SELECT id FROM Seguridad.Usuario WHERE Usuario = @UsuarioAnterior)
		
		IF @UsuarioNuevo IS NOT NULL
			UPDATE Seguridad.Usuario
			SET Usuario = @UsuarioNuevo
			WHERE id = @SeleccionUsuario
		IF @Contrasena IS NOT NULL
			UPDATE Seguridad.Usuario
			SET Pass = @Contrasena
			WHERE id = @SeleccionUsuario
		IF @Estado IS NOT NULL
			UPDATE Seguridad.Usuario
			SET Estado = @EstadoIngresa
			WHERE id = @SeleccionUsuario
	END TRY
	BEGIN CATCH
		DECLARE @error INT
		SET @error = @@ERROR

		IF (@error = 2627)
			PRINT 'El usuario ya existe!'
		ELSE IF (@error = 515)
			PRINT 'El estado no es valido!'
		ELSE
			PRINT ERROR_MESSAGE()
			PRINT ERROR_NUMBER()
			PRINT ERROR_LINE()
	END CATCH
END
GO

-- Inserciones
INSERT INTO Informacion.Estados (Estado)
	VALUES ('Matriculado'),
		   ('No Matriculado'),
		   ('Pagado'),
		   ('No Pagado'),
		   ('Inactivo'),
		   ('Activo'),
		   ('Aprobado'),
		   ('Reprobado')
GO

INSERT INTO Alumnos.TipoAlumno (Tipo)
	VALUES ('Normal'),
		   ('Becado')
GO

spInsercionCategoria 'Instrumento', 600, 'Activo'
GO
spInsercionCategoria 'Artes Visuales', 600, 'Activo'
GO
spInsercionInstrumento 'Piano', 'Activo', 'Fiallos'
GO
spInsercionInstrumento 'Guitarra', 'Activo', 'Fiallos'
GO
spInsercionSeccionInstrumento 'A', 'Piano', 'Activo', 'Fiallos'
GO
SP_InsercionSeccionInstrumento 'B', 'Piano', 'Activo', 'Fiallos'
GO
SP_InsercionSeccionInstrumento 'C', 'Piano', 'Activo', 'Fiallos'
GO
SP_InsercionSeccionInstrumento 'A', 'Guitarra', 'Activo', 'Fiallos'
GO
SP_InsercionSeccionInstrumento 'B', 'Guitarra', 'Activo', 'Fiallos'
GO
SP_InsercionSeccionInstrumento 'C', 'Guitarra', 'Activo', 'Fiallos'
GO
SP_InsercionSolfeo 'I', 'Activo', 'Fiallos'
GO
SP_InsercionSolfeo 'II', 'Activo', 'Fiallos'
GO
SP_InsercionSolfeo 'III', 'Activo', 'Fiallos'
GO
SP_InsercionSolfeo 'IV', 'Activo', 'Fiallos'
GO
SP_InsercionSolfeo 'V', 'Activo', 'Fiallos'
GO
spInsercionAlumno '0107-1998-00742', 'Christopher', 'Fiallos', '9797-2178', 'Normal', 'Activo', 'Fiallos', 0
GO
SP_InsercionDetalleAlumno '0107-1998-00742', 'Instrumento', 'Guitarra', 'A', 'Fiallos', 'Activo'
GO
SP_InsercionSolfeoAlumno '0107-1998-00742', 'V', 'Activo','Fiallos'
GO
SP_InsercionMaestro '0107-1998-00745', 'Juan', 'Manuel', '9797-2179', 'Activo', 'Fiallos'
GO
SP_InsercionDetalleMaestro '0107-1998-00744', 'Instrumento', 'Piano', 'A', 'Fiallos', 'Activo'
GO

INSERT INTO Planilla.DetalleMaestro (idMaestro, idCategoria, idInstrumento, idSeccionInstrumento, Fecha, Usuario)
	VALUES (5000, 2, 3001, 30000, GETDATE(), 'Vivi')
GO
INSERT INTO Planilla.HorasTrabajadasDia (idMaestro, Horas, Fecha, Estado, Usuario)
	VALUES (5000, 3, GETDATE(), 1, 'Vivi')
GO
INSERT INTO Planilla.PagoMensualMaestro (idMaestro, Sueldo, Fecha, Usuario)
	VALUES (5000, 240.00, GETDATE(), 'Vivi')
GO
INSERT INTO Contabilidad.TipoAlquilerProveedor (Tipo)
	VALUES ('Mueble'),
		   ('Inmueble')
GO
INSERT INTO Contabilidad.Proveedor (Nombre, Telefono, Direccion, Correo, Estado, Fecha, Usuario)
	VALUES ('Buenas', '9797-2178', 'Aqui', 'hola@gmail.com', 1, GETDATE(), 'Vivi')
GO
INSERT INTO Contabilidad.Cuentas (Cuenta, TipoCuenta, Estado)
	VALUES ('Proveedores', 'Pasivo', 1),
		   ('Alquiler', 'Pasivo', 1),
		   ('Ventas', 'Activo', 1),
		   ('Compras', 'Pasivo', 1),
		   ('Gastos Varios', 'Pasivo', 1),
		   ('Cobros', 'Activo', 1),
		   ('Inventario', 'Activo', 1),
		   ('Caja Chica', 'Activo', 1)
GO
INSERT INTO Contabilidad.TipoArticulo (Tipo, Estado)
	VALUES ('Instrumento', 1),
		   ('Papeleria', 1)
GO
INSERT INTO Contabilidad.DetalleProveedor (idProveedor, idTipoAlquilerProveedor, MuebleInmueble, Fecha, Usuario)
	VALUES (9000, 90000, 'Sonido', GETDATE(), 'Vivi')
GO
INSERT INTO Contabilidad.Alquiler (idProveedor, Costo, Fecha, Usuario)
	VALUES (90001, 2500, GETDATE(), 'Vivi')
GO
-- INSERT INTO Contabilidad.Compra ('Tape', )

-- Vistas
CREATE VIEW Alumnos.InformacionAlumno
AS
	SELECT Alumnos.Alumno.Nombre				AS 'Hola Nombre',
	   Alumnos.Alumno.Apellido				AS Apellido,
	   Alumnos.Categoria.Categoria			AS Categoria,
	   Alumnos.Instrumento.Instrumento		AS Instrumento,
	   Alumnos.SeccionInstrumento.Seccion	AS Seccion,
	   Alumnos.Solfeo.Seccion				AS Solfeo
	FROM Alumnos.Alumno
	INNER JOIN Alumnos.DetalleAlumno
	ON Alumnos.DetalleAlumno.idAlumno = Alumnos.Alumno.id
	INNER JOIN Alumnos.Categoria
	ON Alumnos.Categoria.id = Alumnos.DetalleAlumno.idCategoria
	INNER JOIN Alumnos.Instrumento
	ON Alumnos.Instrumento.id = Alumnos.DetalleAlumno.idInstrumento
	INNER JOIN Alumnos.SeccionInstrumento
	ON Alumnos.SeccionInstrumento.id = Alumnos.DetalleAlumno.idSeccionInstrumento
	INNER JOIN Alumnos.SolfeoAlumno
	ON Alumnos.SolfeoAlumno.idAlumno = Alumnos.Alumno.id
	INNER JOIN Alumnos.Solfeo
	ON Alumnos.Solfeo.id = Alumnos.SolfeoAlumno.idSolfeo
GO
