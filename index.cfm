<html>
    <head>
        <link rel="stylesheet" href = "css/style.css">
        <title>Task 14</title>
    </head>
    <body style="background-color:#d7b2d7;">
        <section>
            <div class="main_container">
                <div class = "forms card">
                    <h3>Task 14 - Image Upload</h3>
                    <hr>
         <cfform action="infoAction.cfm" method="post" enctype="multipart/form-data">
       
         <div class="form-group">
           <div class="form-control">
             <label>Name</label>
			<input type="text" name="name"/><br/>
    
            <label >Description </label>
            <textarea name="description" style="margin-top:5px;"> </textarea> <br/>
		Please upload an image: <cfinput type="file" name="img_file">
        </div>
        </div>
<cfinput type="submit" class="common-btn" value="Send Image" name="form_submit">
		</cfform>                    
                  
                </div>
            </div>
        </section>
    </body>
</html>
    <table>










