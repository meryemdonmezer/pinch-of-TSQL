SELECT [TRIGGER].name as TRIGGER_NAME,
[TABLE].name as TABLE_NAME
FROM sysobjects [TRIGGER]
LEFT JOIN sysobjects [TABLE] on [TRIGGER].parent_obj = [TABLE].id
where [TRIGGER].xtype = 'TR'