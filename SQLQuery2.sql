--créer une connexion SQL
exec sp_addlogin 'test1' , '1234'
-- supprimer une connexion SQL
exec sp_droplogin 'test1'
--créer une connexion hérité de windows
exec sp_grantlogin 'DESKTOP-7BV96LH\user'
exec  sp_defaultdb 'DESKTOP-7BV96LH\user', 'master'
--empécher un utilisateur windows d'acceder au serveur
exec sp_denylogin  'DESKTOP-7BV96LH\user'
-- pour donner une connexion accès à une base de donnée
exec sp_grantdbaccess 'test1' 
--empécher  l'accès à une base de donnée
exec sp_revokedbaccess 'test1' 
-- créer un utilisateur
exec sp_adduser 'test1', 'userTest','db_datareader'
-- supprimer un utilisateur
exec sp_dropuser 'userTest'