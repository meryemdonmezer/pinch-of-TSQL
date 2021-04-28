EXEC sp_addlinkedsrvlogin 
@rmtsrvname = N'{server name}', -- SERVER ADRESS + INSTANCE
@locallogin = N'{local login}', -- FOR LOCAL ACCESS
@useself = N'False', 
@rmtuser = N'{remote user}', -- REMOTE LOGIN NAME
@rmtpassword = N'{remote password}' -- REMOTE LOGIN PASSWORD

SELECT * FROM [SERVER NAME].[DATABASE].dbo.[Table]