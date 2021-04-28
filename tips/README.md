
# SQL to "i18n Locale JSON Object"

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