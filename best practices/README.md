# Id & ParentId to Leveled Result (Breadcrumb , Level and HierarchyId)

### Sample data :
```SQL
DECLARE @Categories table (Id int, ParentId int, Title varchar(25))

INSERT INTO @Categories VALUES 
(1,0,'Technologies'),
	(2,1,'Frontend'),
		(3,2,'Angular'),
			(4,3,'AngularJS'),
			(5,3,'Angular2'),
		(6,2,'ReactJS'),
	(7,1,'Backend'),
		(8,7,'C#'),
		(9,7,'Java'),
		(10,7,'Python');
```
### Query : 
```SQL
WITH Tree AS(
SELECT *, LevelById = '/' + CAST(Parent.Id as nvarchar(max)) + '/', Breadcrumb = CAST(Parent.Title as nvarchar(max))
FROM @Categories as Parent
WHERE ParentId = 0
UNION ALL
SELECT Child.*, LevelById = LevelById + CAST(Child.Id as varchar) + '/', Breadcrumb = Breadcrumb + ' / ' + Child.Title
FROM Tree as Parent
JOIN @Categories as Child ON Child.ParentId = Parent.Id
)
SELECT Tree.Id,
Tree.ParentId,
Tree.Title,
Tree.Breadcrumb,
Tree.LevelById,
CAST(LevelById as hierarchyid) as HierarchyId FROM Tree
ORDER BY LevelById
```

### Result:
|Id|ParentId|Title|Breadcrumb|LevelById|HierarchyId|
|---|---|---|---|---|---|
|1|0|Technologies|Technologies|/1/|0x58|
|2|1|Frontend|Technologies / Frontend|/1/2/|0x5B40|
|3|2|Angular|Technologies / Frontend / Angular|/1/2/3/|0x5B5E|
|4|3|AngularJS|Technologies / Frontend / Angular / AngularJS|/1/2/3/4/|0x5B5F08|
|5|3|Angular2|Technologies / Frontend / Angular / Angular2|/1/2/3/5/|0x5B5F18|
|6|2|ReactJS|Technologies / Frontend / ReactJS|/1/2/6/|0x5B65|
|7|1|Backend|Technologies / Backend|/1/7/|0x5CE0|
|10|7|Python|Technologies / Backend / Python|/1/7/10/|0x5CF540|
|8|7|C#|Technologies / Backend / C#|/1/7/8/|0x5CF440|
|9|7|Java|Technologies / Backend / Java|/1/7/9/|0x5CF4C0|

* * *

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