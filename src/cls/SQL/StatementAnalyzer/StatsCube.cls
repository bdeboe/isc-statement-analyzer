/// 
Class SQL.StatementAnalyzer.StatsCube Extends %DeepSee.CubeDefinition [ DependsOn =  ]
{

/// Cube definition from Architect.
XData Cube [ XMLNamespace = "http://www.intersystems.com/deepsee" ]
{
<cube xmlns="http://www.intersystems.com/deepsee" name="SQLStats" displayName="SQL Statement Stats" disabled="false" abstract="false" sourceClass="INFORMATION.SCHEMA.STATEMENTDAILYSTATS" actionClass="SQL.StatementAnalyzer.Actions" owner="_SYSTEM" namedFactNums="true" countMeasureName="%COUNT" bucketSize="8" bitmapChunkInMemory="false" precompute="0" disableListingGroups="false" enableSqlRestrict="false">
  <dimension name="Day" disabled="false" hasAll="false" allCaption="All Day" allDisplayName="Day" sourceProperty="Day" type="time" calendar="gregorian" hidden="false" showHierarchies="default">
    <hierarchy name="H1" disabled="false" hidden="false">
      <level name="Year" disabled="false" timeFunction="Year" list="false" useDisplayValue="true" useAsFilter="true" hidden="false" factNumber="4">
      </level>
      <level name="Month" disabled="false" timeFunction="MonthYear" list="false" useDisplayValue="true" useAsFilter="true" hidden="false" factNumber="3">
      </level>
      <level name="Day" disabled="false" timeFunction="DayMonthYear" list="false" useDisplayValue="true" useAsFilter="true" hidden="false" factNumber="2">
      </level>
    </hierarchy>
  </dimension>
  <dimension name="Statement" disabled="false" hasAll="false" allCaption="All Hash" allDisplayName="Hash" type="data" calendar="gregorian" iKnowType="entity" hidden="false" showHierarchies="default">
    <hierarchy name="H1" disabled="false" hidden="false">
      <level name="Statement" disabled="false" sourceProperty="Statement.Hash" list="false" useDisplayValue="true" useAsFilter="true" hidden="false" factNumber="5">
        <property name="Statement" displayName="Statement Text" disabled="false" sourceExpression="$e(%source.Statement.Statement,1,100)_&quot;...&quot;" hidden="false" isName="false" isDescription="false" isReference="false" useDisplayValue="false">
        </property>
      </level>
    </hierarchy>
  </dimension>
  <dimension name="Tables" disabled="false" hasAll="false" allCaption="All Tables" allDisplayName="Tables" type="data" hidden="false" showHierarchies="default">
    <hierarchy name="H1" disabled="false" hidden="false">
      <level name="Tables" disabled="false" sourceExpression="%cube.GetTables(%source.Statement)" list="true" useDisplayValue="true" useAsFilter="true" hidden="false" factNumber="6">
      </level>
    </hierarchy>
  </dimension>
  <measure name="TimesExecuted" displayName="Times Executed" disabled="false" sourceProperty="StatCount" aggregate="SUM" type="number" hidden="false" searchable="false" factNumber="1">
  </measure>
  <measure name="TotalRuntime" displayName="Total Runtime" disabled="false" sourceProperty="StatTotal" aggregate="SUM" type="number" hidden="false" searchable="false" factNumber="2">
  </measure>
  <measure name="StatVariance" disabled="false" sourceProperty="StatVariance" aggregate="AVG" type="number" hidden="false" searchable="false" factNumber="3">
  </measure>
  <calculatedMember name="AverageRuntime" disabled="false" dimension="Measures" valueExpression="[Measures].[TotalRuntime] / [Measures].[TimesExecuted]" hidden="false">
  </calculatedMember>
</cube>
}

ClassMethod GetTables(id As %String) As %List
{
    &SQL(SELECT %DLIST(Relation) INTO :rel FROM INFORMATION_SCHEMA.STATEMENT_RELATIONS WHERE Statement = :id)
    quit $g(rel)
}

Parameter DOMAIN;

}
