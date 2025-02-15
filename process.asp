<%
Response.ContentType = "text/plain"

Function GenerateRandomNumber(min, max)
    Randomize
    GenerateRandomNumber = Int((max - min + 1) * Rnd + min)
End Function

Dim name, randomNumber
name = Request.Form("name")

randomNumber = GenerateRandomNumber(1, 100)


If name <> "" Then
    Response.Write "Hello, " & Server.HTMLEncode(name) & "! Your request was processed successfully. Random Number: " & randomNumber
Else
    Response.Write "Please enter a valid name. Random Number: " & randomNumber
End If
%>
ss