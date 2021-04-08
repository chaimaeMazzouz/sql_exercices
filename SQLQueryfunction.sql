
create function somme(@a int, @b int)
returns int
as 
begin
return @a*@b
end

--Exécution--
select dbo.somme(10,4) as 'somme'

--Modification--
alter function somme(@a int, @b int)
returns int
as 
begin
return @a+@b
end

create function noteEtud(@Netu int, @mat int)
returns float
as 
begin
  DECLARE @note float
  set @note=(select note from Evaluer e where e.NEtudiant = @Netu and e.CodeMat=@mat)
  return @note
end

select dbo.noteEtud(1,101) as 'Note Etudiant'