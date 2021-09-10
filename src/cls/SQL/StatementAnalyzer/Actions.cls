Class SQL.StatementAnalyzer.Actions Extends %DeepSee.KPI
{

/// This XData definition defines the KPI.
XData KPI [ XMLNamespace = "http://www.intersystems.com/deepsee/kpi" ]
{
<kpi xmlns="http://www.intersystems.com/deepsee/kpi" name="Statement Actions">
<action name="GoToDetail" displayName="Open Statement Viewer" />
</kpi>
}

/// This callback is invoked from a dashboard when an action defined by this dashboard is invoked.
ClassMethod %OnDashboardAction(pAction As %String, pContext As %ZEN.proxyObject) As %Status
{
	if (pAction="GoToDetail") {
		set pContext.command = "newWindow:/csp/sys/exp/_CSP.UI.Portal.Dialog.SQLStatementDetails.zen?$NAMESPACE="_$namespace_"&NAMESPACE="_$namespace_"&OpenInTab=1&STMTHASH="_pContext.valueList
	}

	quit $$$OK
}

}
