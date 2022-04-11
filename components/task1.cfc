<cfcomponent displayname="task1">
 <cffunction name="image_upload" output="false" access="public">
    <cfif len(trim(form.image))>
    <cfset thisDir = expandPath(".")>
<cffile action="upload" fileField="form.image" accept="image/jpg,image/jpeg,image/png" nameconflict="makeunique" destination="C:\ColdFusion2021\cfusion\wwwroot\workout\task14\uploads" result="fileUpload">
      
<!--- Determine whether the image file is saved. --->
<cfif fileUpload.fileWasSaved>
<!--- Determine whether the saved file is a valid image file. --->

 <!--- Read the image file into a variable called myImage. --->
<cfimage action="read" source="../uploads/#fileUpload.serverfile#" name="myImage">
<!--- Determine whether the image file exceeds the size limits. --->

  <cfoutput>
<p>
The image you uploaded was too large. It must be less than 800 pixels wide
and 800 pixels high. Your image was #imageGetWidth(myImage)# pixels wide
and #imageGetHeight(myImage)# pixels high.
</p>
</cfoutput>
<!--- If the image is valid and does not exceed the size limits,
create a thumbnail image from the source file that is 75-pixels
square, while maintaining the aspect ratio of the source image.
Use the bilinear interpolation method to improve performance.
--->


<cfset ImageScaleToFit(myImage,75,75,"bilinear")>
<!--- Specify the new filename as the source filename with
"_thumbnail" appended to it. --->
<cfset newImageName = fileUpload.serverDirectory & "/" &
fileUpload.serverFilename & "_thumbnail." &
fileUpload.serverFileExt>
<!--- Save the thumbnail image to a file with the new filename. --->
<cfimage source="#myImage#" action="write"
destination="#newImageName#" overwrite="yes">
<cfoutput>
<p>
Thank you for uploading the image. We have created a thumbnail for
your picture.
</p>
<p>
<!--- Display the thumbnail image. --->
<img src="#getFileFromPath(newImageName)#">
</p>
</cfoutput> 
 </cfif>       
<cfreturn>
        </cfif>

         <cfquery datasource="newtech">
            INSERT INTO sakila.image_table(NAME,DESCP,PICTURE) VALUES ('#form.name#','#form.description#','#cffile.serverFileName#.#cffile.serverFileExt#')
        </cfquery>
 </cffunction>
</cfcomponent>