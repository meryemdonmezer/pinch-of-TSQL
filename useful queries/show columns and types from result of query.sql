CREATE TABLE Example_Table(
	[Id] INT IDENTITY PRIMARY KEY,
	[Name] VARCHAR(50) NOT NULL,
	[Description] VARCHAR(255) NOT NULL
)

INSERT INTO Example_Table
VALUES ('test name','test description')

SELECT * FROM sys.dm_exec_describe_first_result_set
('SELECT * FROM Example_Table', NULL, 0) ;
