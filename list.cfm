<head>
<link rel="stylesheet" href = "css/style.css">
<title>User Table</title>
</head>
<cfparam name='img_id' type='integer'>
<cfquery name='img_details' datasource='newtech'>
SELECT *
FROM sakila.image_table
WHERE id="#img_id#" 
</cfquery>
<cfoutput query='img_details'>
<div class='container text-center table_container py-5'>
<h3 class='text-center pb-5'>Image Details</h3>
<table class='table table-bordered '>
<tbody>
<tr>
<td>Image Name</td>
<td>#name#</td>
</tr>
<tr>
<td>Description</td>
<td>#descp#</td>
</tr>
<tr>
<cfset path= expandPath("./uploads")  & "\" & file_name>
<td>File</td>
<td><cfimage source="#path#" action="writeToBrowser" height="200vh" width="400"></td>
</tr>
</tbody>
</table>
</div>
</cfoutput>