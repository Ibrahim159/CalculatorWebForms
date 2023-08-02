create database Calculadora;

use Calculadora;

create table Operaciones(
	id int identity(1,1),
	operacion varchar(max),
	resultado varchar(max),
	primary key(id)
);

create procedure ib_load
as begin
select * from Operaciones
end;

create procedure ib_create
@Operacion varchar(max),
@Resultado varchar(max)
as begin
	insert into Operaciones (operacion, resultado) values (@Operacion, @Resultado)
end;

EXEC ib_create @Operacion = "Prueba", @Resultado = "Prueba";

ib_load;

create procedure ib_delete
@Id int
as
begin
	DELETE FROM Operaciones WHERE id = @Id
end;
