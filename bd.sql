CREATE TABLE `TIPO_EVENTO` (
	`id_tipo_evento` INT NOT NULL DEFAULT 0,
	`tipo` NVARCHAR(50),
	CONSTRAINT `PrimaryKey` PRIMARY KEY (`id_tipo_evento`)
)
 ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

CREATE TABLE `EVENTO_SALA_REMOTA` (
	`id_asignacion` INT(11) AUTO_INCREMENT NOT NULL,
	`id_evento` INT DEFAULT 0,
	`id_sala` INT DEFAULT 0,
	`id_institucion` INT DEFAULT 0,
	`participa` NVARCHAR(255),
	CONSTRAINT `PrimaryKey` PRIMARY KEY (`id_asignacion`)
)
ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;


CREATE TABLE `EVENTO` (
	`id_evento` INT(11) AUTO_INCREMENT NOT NULL,
	`fecha_solicita` DATETIME,
	`nombre` NVARCHAR(50),
	`email` NVARCHAR(70),
	`titulo_evento` NVARCHAR(255),
	`fecha` DATETIME,
	`hora_inicio` DATETIME,
	`hora_fin` DATETIME,
	`num_participantes` INT DEFAULT 0,
	`tipo_enlace` NVARCHAR(50),
	`comentarios` NVARCHAR(255),
	`id_tipo_evento` INT DEFAULT 0,
	`estado` INT DEFAULT 0,
	`digital` BOOL NOT NULL,
	`borrado` BOOL NOT NULL DEFAULT 0,
	`costo` INT DEFAULT 0,
	`pagado` DATETIME,
	`eliminado` INT DEFAULT 0,
	CONSTRAINT `PrimaryKey` PRIMARY KEY (`id_evento`)
)
ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;


CREATE TABLE `SALA_REMOTA` (
	`id_sala_remota` INT(11) AUTO_INCREMENT NOT NULL,
	`nombre` NVARCHAR(255),
	`responsable` NVARCHAR(50),
	`telefono` NVARCHAR(50),
	`email_responsable` NVARCHAR(70),
	`ip` NVARCHAR(50),
	`isdn` NVARCHAR(50),
	
	CONSTRAINT `PrimaryKey` PRIMARY KEY (`id_sala_remota`)
)
ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;


CREATE TABLE `ASIGNACION_SALA_REMOTA` (
	`id_asignacion` INT(11) AUTO_INCREMENT NOT NULL,
	`id_usuario` INT DEFAULT 0,
	`fecha` DATETIME,
	`id_evento` INT DEFAULT 0,
	`id_sala`INT DEFAULT 0,
	CONSTRAINT `PrimaryKey` PRIMARY KEY (`id_asignacion`)
)
ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;


CREATE TABLE `SALA_LOCAL` (
	`id_sala` INT(11) AUTO_INCREMENT NOT NULL,
	`sala` NVARCHAR(255),
	`telefono` NVARCHAR(50),
	`ip` NVARCHAR(50),
	`isdn` NVARCHAR(50),
	`responsable` NVARCHAR(50),
	`email_responsable` NVARCHAR(70),
	`codec` NVARCHAR(100),
	`aforo` INT DEFAULT 0,
	`ubicacion` NVARCHAR(255),
	`servicios` NVARCHAR(255),
	`img` NVARCHAR(100),
	CONSTRAINT `PrimaryKey` PRIMARY KEY (`id_sala`)
)
ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

CREATE TABLE `ASIGNACION_SALA_LOCAL` (
	`id_asignacion` INT(11) AUTO_INCREMENT NOT NULL,
	`id_usuario` INT DEFAULT 0,
	`fecha` DATETIME,
	`id_evento` INT DEFAULT 0,
	`id_sala`INT DEFAULT 0,
	CONSTRAINT `PrimaryKey` PRIMARY KEY (`id_asignacion`)
)
ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

CREATE TABLE `USUARIOS` (
	`id_usuario` INT NOT NULL AUTO_INCREMENT,
	`usuario` NVARCHAR(50),
	`clave` NVARCHAR(50),
	`nombre` NVARCHAR(60),
	`cargo` NVARCHAR(150),
	`correo` NVARCHAR(70),
	CONSTRAINT `PrimaryKey` PRIMARY KEY (`id_usuario`)
)
ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;


CREATE TABLE `ESTADO` (
	`id_estado` INT AUTO_INCREMENT NOT NULL,
	`estado` NVARCHAR(50),
	CONSTRAINT `PrimaryKey` PRIMARY KEY (`id_estado`)
)
 ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;


 CREATE TABLE `RAZON` (
	`id_razon` INT  AUTO_INCREMENT NOT NULL,
	`razon` NVARCHAR(50),
	CONSTRAINT `PrimaryKey` PRIMARY KEY (`id_razon`)
)
 ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

CREATE INDEX `id_tipo_evento`
	ON `TIPO_EVENTO` (`id_tipo_evento`);
CREATE INDEX `id`
	ON `EVENTO_SALA_REMOTA` (`id`);
CREATE INDEX `id_evento`
	ON `EVENTO_SALA_REMOTA` (`id_evento`);
CREATE INDEX `id_sala`
	ON `EVENTO_SALA` (`id_sala`);
CREATE INDEX `EVENTOSid_categoria`
	ON `EVENTO` (`id_tipo_evento`);
CREATE INDEX `id_evento`
	ON `EVENTO` (`id_evento`);
CREATE INDEX `SALASsala`
	ON `SALAS` (`sala`);
CREATE INDEX `id`
	ON `SALAS` (`id_sala`);
CREATE INDEX `clave`
	ON `USUARIOS` (`clave`);
CREATE INDEX `id_usuario`
	ON `USUARIOS` (`id_usuario`);
ALTER TABLE `EVENTO_SALA_REMOTA`
	ADD CONSTRAINT `EVENTOSEVENTO_SALA`
	FOREIGN KEY (`id_evento`) REFERENCES
		`EVENTO` (`id_evento`);
ALTER TABLE `EVENTO_SALA_REMOTA`
	ADD CONSTRAINT `INSTITUCIONEVENTO_SALA`
	FOREIGN KEY (`id_institucion`) REFERENCES
		`INSTITUCION` (`id_institucion`);
ALTER TABLE `EVENTO_SALA`
	ADD CONSTRAINT `SALASEVENTO_SALA`
	FOREIGN KEY (`id_sala`) REFERENCES
		`SALAS` (`id_sala`);
ALTER TABLE `EVENTO`
	ADD CONSTRAINT `CATEGORIASEVENTOS`
	FOREIGN KEY (`id_tipo_evento`) REFERENCES
		`TIPO_EVENTOS` (`id_tipo_evento`)
	ON DELETE CASCADE;
ALTER TABLE `ASIGNACION_SALA_LOCAL`
	ADD CONSTRAINT `ASIGNACIONES`
	FOREIGN KEY (`id_evento`) REFERENCES
		`EVENTO` (`id_evento`);
ALTER TABLE `ASIGNACION_SALA_LOCAL`
	ADD CONSTRAINT `ASIGNACIONES`
	FOREIGN KEY (`id_usuario`) REFERENCES
		`USUARIOS` (`id_usuario`);
ALTER TABLE `ASIGNACION_SALA_REMOTA`
	ADD CONSTRAINT `ASIGNACIONES`
	FOREIGN KEY (`id_evento`) REFERENCES
		`EVENTO` (`id_evento`);
ALTER TABLE `ASIGNACION_SALA_REMOTA`
	ADD CONSTRAINT `ASIGNACIONES`
select * from table	FOREIGN KEY (`id_usuario`) REFERENCES
		`USUARIOS` (`id_usuario`);
