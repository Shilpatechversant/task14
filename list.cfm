<html>
    <head>
        <link rel="stylesheet" href="css/style.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
        <title>Task 14</title>
    </head>
    <body style="background-color:#d7b2d7;">
        <section>
            <div class="main_container">
                <cfparam name='img_id' type='integer'>
                    <cfquery name='img_details' datasource='newtech'> SELECT * FROM sakila.image_table WHERE id="#img_id#" </cfquery>
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
                                        <cfset FileName="#picture#">
                                            <cfset path=expandPath("./uploads") & "\" & FileName>
                                                <td>File</td>
                                                <td>
                                                    <cfimage source="#path#" action="writeToBrowser" height="200vh" width="400">
                                                </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </cfoutput>
            </div>
            </div>
        </section>
    </body>
</html>
</div>
</div>
</div>