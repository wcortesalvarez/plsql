CREATE OR REPLACE VIEW v_alumnos (colegio, documento, carnet, nombres, genero, direccion, fecha_naci,
                                  nom_colegio) AS 
SELECT al.colegio, 
al.documento, 
al.carnet, 
al.nombres, 
al.genero,
al.direccion, 
al.fecha_naci,
-- para establecer la edad falta ligar a una funcion,
co.razon_social nom_colegio
FROM not_alumnos al
LEFT OUTER JOIN not_colegios co ON co.colegio = al.colegio;

 