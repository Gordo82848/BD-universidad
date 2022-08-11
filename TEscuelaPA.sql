---------------------------------------------------------------------------------
---------------------------------------TEscuela----------------------------------
------Actividad: Implementar Agregar, Eliminar, Actualizar, Buscar y Listar
------Presentado para el día miercoles 10 de agosto a traves de aula virtual
------DEYVIS JHOSWA SAMANEZ CCOSCCO
------10/08/2022
---------------------------------------------------------------------------------
---------------------------------------------------------------------------------

use BDUniversidad
go


--
--		LISTAR ESCUELA
--

if OBJECT_ID('spListarEscuela') is not null
	drop proc spListarEscuela
go

create proc spListarEscuela
as
begin
	select * from TEscuela
end
go

---		EJECUTAMOS
exec spListarEscuela


--
--		AGREGAR ESCUELA
--	

if OBJECT_ID('spAgregarEscuela') is not null
	drop proc spAgregarEscuela
go

create proc spAgregarEscuela
@CodEscuela char(3), @Escuela varchar(50), @Facultad varchar(50)
as
begin
	if not exists(select CodEscuela from TEscuela where CodEscuela=@CodEscuela)
		if not exists (select Escuela from TEscuela where Escuela=@Escuela)
			begin
				insert into TEscuela values(@CodEscuela,@Escuela,@Facultad)
				select CodError = 0, Mensaje = 'Se insertó correctamente Escuela'
			end
		else select CodError = 1, Mensaje = 'Error: Escuela duplicada'
	else select CodError = 1, Mensaje = 'Error: CodEscuela duplicada'
end

---		EJECUTAMOS
exec spAgregarEscuela 'E06','Medicina','Ciencias de la salud'
exec spAgregarEscuela 'E07','Psicología','Ciencias de la salud'


--
--		ELIMINAR ESCUELA
--

if OBJECT_ID('spEliminarEscuela') is not null
	drop proc spEliminarEscuela
go

create proc spEliminarEscuela
@CodEscuela char(3)
as
begin
	if not exists(select CodEscuela from TEscuela where CodEscuela=@CodEscuela)
		select CodError = 1, Mensaje = '<---- ERROR: CodEscuela no encontrada ---->'
	else 
		begin
			DELETE FROM TEscuela  WHERE CodEscuela = @CodEscuela
			select CodError = 0, Mensaje = '<---- Se eliminó correctamente ---->'
		end
end
go

---		EJECUTAMOS
exec spEliminarEscuela 'E06'
exec spEliminarEscuela 'E07'


--
--		ACTUALIZAR ESCUELA
--

if OBJECT_ID('spActualizarEscuela') is not null
	drop proc spActualizarEscuela
go

create proc spActualizarEscuela
@CodEscuela char(3), @Escuela varchar(50), @Facultad varchar(50)
as
begin
	if not exists(select CodEscuela from TEscuela where CodEscuela=@CodEscuela)
		select CodError = 1, Mensaje = '<---- ERROR: CodEscuela no encontrada ---->'
	else 
		begin
			UPDATE TEscuela SET Escuela = @Escuela, Facultad = @Facultad WHERE CodEscuela = @CodEscuela
			select CodError = 0, Mensaje = '<---- Se actualizó correctamente ---->'
		end
end
go


---		EJECUTAMOS
exec spActualizarEscuela 'E04','Metalúrgica','Ingenieria'

--
--		BUSCAR ESCUELA
--

if OBJECT_ID('spBuscarEscuela') is not null
	drop proc spBuscarEscuela
go

create proc spBuscarEscuela
@CodEscuela char(3)
as
begin
	if not exists(select CodEscuela from TEscuela where CodEscuela=@CodEscuela)
		select CodError = 1, Mensaje = '<---- ERROR: CodEscuela no encontrada ---->'
	else 
		begin
			select * from TEscuela where CodEscuela=@CodEscuela
		end
end
go

---		EJECUTAMOS

exec spBuscarEscuela 'E01'
exec spBuscarEscuela 'E07'