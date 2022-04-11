    <cfif isDefined("submit")>
    <cfinvoke component="components.task1"
    method="image_upload"   argumentCollection="#Form#">
    </cfinvoke>
<cfelse>
<p>failed to get it!
</cfif>