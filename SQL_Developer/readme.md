# SQL Developer Oracle APEX Snippets

## Usage

Snippets are usually in :

```text
Windows   : "C:\Users\<username>\AppData\Roaming\SQL Developer\UserSnippets.xml"
Linux/osx : "~/.sqldeveloper/UserSnippets.xml"
```

If file "[UserSnippets.xml](UserSnippets.xml)" does not exist along "CodeTemplate.xml"file, simple add that file.

In case you already have that file and your custom snippets then in file "UserSnippets.xml" add

```xml
   <group category="{Custom} APEX" language="PLSQL">
      .. code snippets
   </group>
```

## Preview

![Preview](sample.png)