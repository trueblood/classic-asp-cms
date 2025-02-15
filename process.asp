<%
Response.ContentType = "text/plain"

' Function to generate a random number between min and max
Function GenerateRandomNumber(min, max)
    Randomize
    GenerateRandomNumber = Int((max - min + 1) * Rnd + min)
End Function

' Get the name parameter from the request
Dim name, randomNumber
name = Request.Form("name")

' Generate a random number between 1 and 100
randomNumber = GenerateRandomNumber(1, 100)

' Process the name and return a response
If name <> "" Then
    Response.Write "Hello, " & Server.HTMLEncode(name) & "! Your request was processed successfully. Random Number: " & randomNumber
Else
    Response.Write "Please enter a valid name. Random Number: " & randomNumber
End If
%>
ss