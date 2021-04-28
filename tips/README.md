
# SQL to "i18n Locale JSON Object"

SQL Dataset :
|ResourceKey|ResourceValue|flag|
|---|---|---|
|hello|hello|en-US|
|hello|merhaba|tr-TR|

```SQL
SELECT '{' + STRING_AGG( '"' + ResourceKey + '":"' + STRING_ESCAPE(ResourceValue,'json') + '"' ,',') + '}' as attributes 
FROM @LanguageResource
WHERE flag = 'tr-TR'
```
* * *