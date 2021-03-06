<head>
                <link rel="stylesheet" href = "css/style.css">
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
                <title>User Table</title>

</head>
<cfset myFunction=createObject(component, "components.task")>
<cfset img_details=myFunction.getdata(#img_id#)>
<div class='container py-5'>
        <cfif structKeyExists(URL, "upload")>
                <div class="text-center pb-3">
                        <h3>File uploaded and thumbail created </h3>
                        <cfimage source="#session.thumbail#" action="writeToBrowser">                        
                </div>
        </cfif>
        <table class='table table-bordered mb-3 text-center'>
        <tr>
                <th>Img Name</th>
                <th>Thumbnail Image</th>
        </tr>
        <cfoutput query="img_details">
        <tr>
                <td>#name#</td>
                <cfset FileName = ListDeleteAt(file_name, ListLen(file_name, "."), ".")>
                <cfset extn=ListDeleteAt(file_name, 1,".")>
                <cfset thumbail_path=session.directory & "\" & FileName & "_thumbnail." &extn>
                <td><a href='details.cfm?img_id=#id#'><cfimage source="#thumbail_path#" action="writeToBrowser"></a>
                </td>
        </tr>
        </cfoutput>
        </table>
</div>