--Crear / Actualizar persona
create procedure Actualizar_Persona
(
	@Id int,
	@nombres varchar(250),
	@apellidos varchar(250),
	@fechaNacim datetime,
	@fechaFallec datetime,
	@paisNacim int
)
as
if not exists (select id from persona where id=@Id)
--Ingresar
insert into persona
(
	nombres,
	apellidos,
	fechaNacim,
	fechaFallec,
	paisNacim
)
values
(
	@nombres,
	@apellidos,
	@fechaNacim,
	@fechaFallec,
	@paisNacim
)
else
-- Actualizar
update persona
set nombres=@nombres,
	apellidos=@apellidos,
	fechaNacim=@fechaNacim,
	fechaFallec=@fechaFallec,
	paisNacim=@paisNacim
where id=@Id

GO

--Eliminar persona
create procedure Eliminar_Persona
	@Id int
as
delete from persona where id=@Id

GO

create procedure Informe_Nac_Fallec
as
SELECT t.AÑO, SUM(t.NACIDOS) AS NACIDOS, SUM(T.MUERTOS) AS MUERTOS FROM
(Select datepart(yyyy,fechaNacim) as AÑO, count(fechaNacim) as NACIDOS, 0 AS MUERTOS
from persona
group by datepart(yyyy,fechaNacim)
union
Select datepart(yyyy,fechaFallec) as AÑO, 0 NACIDOS, count(fechaFallec) as MUERTOS
from persona
group by datepart(yyyy,fechaFallec)) AS t
GROUP BY t.AÑO