# SQL Statement Analyzer

This repo contains a simple IRIS BI cube sourcing its data from the [SQL Statement Index](https://docs.intersystems.com/irislatest/csp/docbook/DocBook.UI.Page.cls?KEY=GSQLOPT_sqlstmts#GSQLOPT_sqlstmts_list), which is a treasure trove of runtime statistics on your instance's SQL usage.

## Installation

After importing the contents of this repository, you can build the cube using the following command (executed automatically if you install through ZPM): 

```ObjectScript
do ##class(%DeepSee.Utils).%BuildCube("SQLStats")
```

Data is fetched from the `INFORMATION_SCHEMA.STATEMENT_DAILY_STATS` view, so it makes sense to rebuild the cube on a daily schedule using the [Cube Manager](https://docs.intersystems.com/irislatest/csp/docbook/DocBook.UI.Page.cls?KEY=D2IMP_ch_current#D2IMP_current_cubemgr) or a simple scheduled task.


## What's in the box

The cube definition (for now) is fairly basic and exposes the runtime and execution count metrics. There is also a custom action which allows you to jump to the Statement Details page in the System Management Portal.

Happy to include pull requests with further extensions, including prebuilt dashboards, pivots and other goodness.