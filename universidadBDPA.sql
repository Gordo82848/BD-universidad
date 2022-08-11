-- PROCEDIMIENTOS ALMACENADOS
-- AUTOR. DEYVIS JHOSWA  SAMANEZ CCOSCCO
-- FECHA. 10/08/2022


use BDUniversidad
go

if OBJECT_ID('ListaEsSP') is not null
	drop proc ListaEsSP
go
create proc ListaEsSP
as
begin
	select CodEscuela, Escuela, Facultad from TEscuela
end
go

exec ListaEsSP
go

if OBJECT_ID('AgregarEsSP') is not null
	drop proc AgregarEsSP
go
create proc AgregarEsSP
@CodEscuela char(3), @Escuela varchar(50), @Facultad varchar(50)
as
begin
	if not exists(select CodEscuela from TEscuela where CodEscuela=@CodEscuela)
		if not exists (select Escuela from TEscuela where Escuela=@Escuela)
			begin
				insert into TEscuela values(@CodEscuela,@Escuela,@Facultad)
				select CodError = 0, Mensaje = 'Escuela correctamente ingresada'
			end
		else select CodError = 1, Mensaje = 'Error: ( ???? ??) Escuela duplicado'
	else select CodError = 1, Mensaje = 'Error: ( ???? ??) CodEscuela duplicado'
end
go