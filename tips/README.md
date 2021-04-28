
# SQL to "i18n Locale JSON Object"
### Sample data : 
```SQL
DECLARE @LanguageResource table (ResourceKey varchar(255), ResourceValue varchar(255), flag varchar(5))
INSERT INTO @LanguageResource VALUES 
('helloWorld','Hello World','en-US'),
('hello','Hello','en-US'),
('helloWorld','Merhaba Dünya','tr-TR'),
('hello','Merhaba','tr-TR')
```
### SQL Dataset :
|ResourceKey|ResourceValue|flag|
|---|---|---|
|helloWorld|Hello World|en-US|
|hello|Hello|en-US|
|helloWorld|Merhaba Dünya|tr-TR|
|hello|Merhaba|tr-TR|
### Query : 
```SQL
SELECT '{' + STRING_AGG( '"' + ResourceKey + '":"' + STRING_ESCAPE(ResourceValue,'json') + '"' ,',') + '}' as KeyValue 
FROM @LanguageResource
WHERE flag = 'en-US'
```
### Result : 
```json
{"helloWorld":"Hello World","hello":"Hello"}
```
* * *