---
title: "XML"
source: "https://pz-wiki-modding.github.io/PZ-API-Docs/xml.html"
source_repository: "https://github.com/PZ-Wiki-Modding/PZ-API-Docs"
source_commit: "effa0bc0f07b2be60da80a3bc374132b95d3118c"
source_path: "docs/source/xml.rst"
game_version: "42.20.4"
retrieved: "2026-09-15"
document_kind: "full source conversion"
authority: "external reference; verify against installed build and project research"
license: "Upstream custom permission; see ATTRIBUTION.md and LICENSE.txt"
---

<a id="xml"></a>

# XML

Reference documentation for XML file formats used in Project Zomboid. With this documentation, comes settings that you can use for [VSCode](../pzwiki/foundations/Visual_Studio_Code.md) alongside the RedHat XML extension to automatically verify your files. You can find here these settings.

<a id="documentation-instructions"></a>

## Documentation Instructions

Each XML file has its own documentation page. These will each detail variouus data and elements this file can contain. A small description of the file is first provided to explain what it is used for, providing generic resources about the file and how it is formatted and written. Multiple sections are used:
\* File patterns will explain what valid path the XML file can be found in.
\* Details about the root element of the XML file, which is the top-level element that contains all other elements in the XML file. For example:



```xml
<?xml version="1.0" encoding="utf-8"?>
<rootElement>
    <childElement1>
        <grandchildElement1 />
    </childElement1>
    <childElement2 />
</rootElement>
```



- A section for each type definition, which will detail the elements and attributes that can be used for that type. The root element is itself a type that can contain other various elements with their own types.

<a id="contributing"></a>

## Contributing

You can contribute to this documentation by editing the pz-xml-data repository. You can read more about it here.

<a id="table-of-contents"></a>

## Table of Contents

- [animNode](xml/animnode.md)
- [clothing](xml/clothing.md)
- [clothingDecals](xml/clothingdecals.md)
- [clothingItem](xml/clothingitem.md)
- [fileGuidTable](xml/fileguidtable.md)
