--cr�er une connexion SQL
exec sp_addlogin 'test1' , '1234'
-- supprimer une connexion SQL
exec sp_droplogin 'test1'
--cr�er une connexion h�rit� de windows
exec sp_grantlogin 'DESKTOP-7BV96LH\user'
exec  sp_defaultdb 'DESKTOP-7BV96LH\user', 'master'
--emp�cher un utilisateur windows d'acceder au serveur
exec sp_denylogin  'DESKTOP-7BV96LH\user'
-- pour donner une connexion acc�s � une base de donn�e
exec sp_grantdbaccess 'test1' 
--emp�cher  l'acc�s � une base de donn�e
exec sp_revokedbaccess 'test1' 
-- cr�er un utilisateur
exec sp_adduser 'test1', 'userTest','db_datareader'
-- supprimer un utilisateur
exec sp_dropuser 'userTest'