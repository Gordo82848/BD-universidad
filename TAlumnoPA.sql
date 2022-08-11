---------------------------------------------------------------------------------
---------------------------------------TAlumno----------------------------------
------Actividad: Implementar Agregar, Eliminar, Actualizar, Buscar y Listar
------Presentado para el día miercoles 10 de agosto a traves de aula virtual
------DEYVIS JHOSWA SAMANEZ CCOSCCO
------10/08/2022
---------------------------------------------------------------------------------
---------------------------------------------------------------------------------

use BDUniversidad
go


--
--		LISTAR ALUMNOS
--

if OBJECT_ID('ListarAlSP') is not null
	drop proc ListarAlSP
go

create proc ListarAlSP
as
begin
	select * from TAlumno
end
go
---		EJECUTAMOS
exec ListarAlSP


--
--		AGREGAR ALUMNOS
--

if OBJECT_ID('AgregarAlSP') is not null
	drop proc AgregarAlSP
go

create proc AgregarAlSP
@CodAlumno char(5),@Apellidos varchar(50),@Nombres varchar(50),
@LugarNac varchar(50),@FechaNac datetime,@CodEscuela char(3)
as
begin
	if not exists(select CodAlumno from TAlumno where CodAlumno=@CodAlumno)
		begin
			insert into TAlumno values(@CodAlumno,@Apellidos,@Nombres,@LugarNac,@FechaNac,@CodEscuela)
			select CodError = 0, Mensaje = '<---- Se agregó correctamente al alumno ---->'
		end
	else select CodError = 1, Mensaje = '<---- ERROR: CodAlumno duplicado ---->'
end
go

---		EJECUTAMOS

exec AgregarAlSP 'A0006','Ruiz García','Paola','Cusco','4/5/2000','E01'



--
--		ELIMINAR ALUMNO
--

if OBJECT_ID('EliminarAlSP') is not null
	drop proc EliminarAlSP
go

create proc EliminarAlSP
@CodAlumno char(5)
as
begin
	if not exists(select CodAlumno from TAlumno where CodAlumno=@CodAlumno)
		select CodError = 1, Mensaje = '<---- ERROR: CodAlumno no encontrado ---->'
	else 
		begin
			DELETE FROM TAlumno  WHERE CodAlumno = @CodAlumno
			select CodError = 0, Mensaje = '<---- Se eliminó correctamente ---->'
		end
end
go


---		EJECUTAMOS
exec EliminarAlSP 'A00'
exec EliminarAlSP 'A0006'


--
--		ACTUALIZAR ALUMNOS	
--

if OBJECT_ID('ActualizarAlSP') is not null
	drop proc ActualizarAlSP
go

create proc ActualizarAlSP
@CodAlumno char(5),@Apellidos varchar(50),@Nombres varchar(50),@LugarNac varchar(50),
@FechaNac datetime,@CodEscuela char(3)
as
begin
	if not exists(select CodAlumno from TAlumno where CodAlumno=@CodAlumno)
		select CodError = 1, Mensaje = '<---- ERROR: CodAlumno no encontrado ---->'
	else 
		begin
			UPDATE TAlumno SET Apellidos=@Apellidos,Nombres=@Nombres,LugarNac=@LugarNac,
			FechaNac=@FechaNac,CodEscuela=@CodEscuela WHERE CodAlumno = @CodAlumno
			select CodError = 0, Mensaje = '<---- Se actualizó correctamente ---->'
		end
end
go

---		EJECUTAR

exec ActualizarAlSP 'A0003','Quispe Quispe','Juan','Cusco','8/14/2004','E01'

--
--		BUSCAR ALUMNO
--

if OBJECT_ID('BuscarAlSP') is not null
	drop proc BuscarAlSP
go

create proc BuscarAlSP
@CodAlumno char(5)
as
begin
	if not exists(select CodAlumno from TAlumno where CodAlumno=@CodAlumno)
		select CodError = 1, Mensaje = '<---- ERROR: CodAlumno no encontrado ---->'
	else 
		begin
			select * from TAlumno where CodAlumno=@CodAlumno
		end
end
go

---		EJECUTAMOS

exec BuscarAlSP 'A0001'
exec BuscarAlSP 'A0005'