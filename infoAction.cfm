<html>
    <head>
        <link rel="stylesheet" href="css/style.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
        <title>Task 14</title>
    </head>
    <body style="background-color:#d7b2d7;">
        <cfset thisDir=expandPath("./uploads")>
            <cfif structKeyExists(form,"img_file")>
                <!--- Use the cffile tag to upload the image file. --->
                <cffile action="upload" fileField="form.img_file" destination="#thisDir#" result="fileUpload" nameconflict="overwrite">
                    <cfquery datasource="newtech"> INSERT INTO sakila.image_table(NAME,DESCP,PICTURE) VALUES ('#form.name#','#form.description#','#fileupload.serverfile#') </cfquery>
                    <cfif fileUpload.fileWasSaved>
                        <cfset path=fileupload.serverdirectory & "\" & fileupload.serverfile>
                            <cfif not IsImageFile(path)>
                                <cfset errors="Invalid Image!
											<br />">
                                    <!--- clean up --->
                                    <cffile action="delete" file="#path#">
                                        <!---<cfimage action="read" source="#fileUpload.serverfile#" name="myImage"><cfoutput>#ImageGetHeight(myImage)# </cfoutput><cfif ImageGetHeight(myImage) gt 2000 or ImageGetWidth(myImage) gt 2000>
#Width and height not in format#
</cfif>--->
                                        <cfelseif fileupload.filesize gt 1000000>
                                            <cfoutput> File larger than 1MB.Upload image size lesse than 1MB </cfoutput>
                                            <cfelse>
                                                <cfimage action="read" source="#path#" name="myImage">
                                                    <cfset ImageScaleToFit(myImage,20,20,"bilinear")>
                                                        <cfset newImageName=fileupload.serverdirectory & "\" & fileupload.serverFileName & "_thumbnail." &fileUpload.serverFileExt>
                                                            <cfimage source="#myImage#" action="write" destination="#newImageName#" overwrite="yes">
                                                                <cfoutput>
                                                                    <div class='d-flex flex-column justify-content-center align-items-center'>
                                                                        <p class=' text-success font-weight-bold'> File Uploaded and thumbnail created!!
                                                                        <p>
                                                                            <cfimage source="#newImageName#" action="writeToBrowser">
                                                                    </div>
                                                                </cfoutput>
                            </cfif>
                    </cfif>
            </cfif>
            <div class="col-md-12">
                </table>
                <cfquery name="img_data" datasource="newtech"> SELECT * FROM sakila.image_table </cfquery>
                <table class='table table-bordered'>
                    <h3>List </h3>
                    <tr>
                        <th>Img Name</th>
                        <th>Thumbnail Image</th>
                    </tr>
                    <cfoutput query="img_data">
                        <tr>
                            <td> #picture#</td>
                            <cfset FileName=ListDeleteAt(picture, ListLen(picture, "." ), "." )>
                                <cfset extn=ListDeleteAt(picture, 1,".")>
                                    <cfset thumbail_path=fileupload.serverdirectory & "\" & FileName & "_thumbnail." &extn>
                                        <td>
                                            <a href='list.cfm?img_id=#id#'>
                                                <cfimage source="#thumbail_path#" action="writeToBrowser">
                                            </a>
                                   </td>
                        </tr>
                    </cfoutput>
                </table>
            </div>
            </div>
            </section>
    </body>
</html>
</div>
</div>