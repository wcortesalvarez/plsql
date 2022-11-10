-- By Wilson Cortes Alvarez
-- student grade tables

CREATE TABLE not_colegios
(colegio varchar2(20) not null,
 razon_social varchar2(500) not null,
 direccion varchar2(500),
 correoe varchar2(500),
 pagina_web varchar2(500),
 rector varchar2(500),
 secretaria varchar2(500),
 observaciones varchar2(500),
CONSTRAINT not_colegios_lp PRIMARY KEY (colegio) 
);
COMMENT ON TABLE not_colegios IS 'information related to the schools where the students are going to register';

CREATE TABLE not_alumnos
(colegio varchar2(20) not null,
documento number not null,
carnet varchar2(50),
nombres varchar2(500) not null,
foto blob,
fecha_naci date not null,
lugar_naci varchar2(100),
genero varchar2(20) not null,  
direccion varchar2(500),
celular varchar2(100),
correoe varchar2(500),
observaciones varchar2(500),
fecha date default Sysdate,
usuario varchar2(50) default User,
CONSTRAINT not_alumnos_lp PRIMARY KEY (colegio, documento)
);
COMMENT ON TABLE not_colegios IS 'student information';

ALTER TABLE not_alumnos
ADD CONSTRAINT alumnos_genero_cq CHECK (genero in ('FEMENINO', 'MASCULINO', 'OTRO'));
	  
Alter Table not_alumnos
   Add Constraint alumnos_colegios_lf foreign key (colegio)
      References not_colegios (colegio);	  

CREATE PUBLIC SYNONYM not_colegios FOR not_colegios;
--GRANT SELECT  ON not_colegios TO notas_consulta;
--GRANT INSERT, UPDATE, DELETE, SELECT  ON not_colegios TO notas_adminis;

CREATE PUBLIC SYNONYM not_alumnos FOR not_alumnos;
--GRANT SELECT  ON not_alumnos TO notas_consulta;
--GRANT INSERT, UPDATE, DELETE, SELECT  ON not_alumnos TO notas_adminis;
