<%
Response.ContentType = "text/plain"

Function GenerateRandomNumber(min, max)
    Randomize
    GenerateRandomNumber = Int((max - min + 1) * Rnd + min)
End Function

Function CapitalizeText(text)
    CapitalizeText = UCase(text)
End Function

Dim name, randomNumber, capitalize, generateRandom
name = Request.Form("name")
capitalize = Request.Form("capitalize")
generateRandom = Request.Form("generateRandom")

If generateRandom = "true" Then
    randomNumber = GenerateRandomNumber(1, 100)
    Response.Write randomNumber
ElseIf capitalize = "true" Then
    Response.Write CapitalizeText(name)
ElseIf name <> "" Then
    Response.Write "Hello, " & Server.HTMLEncode(name) & "!"
Else
    Response.Write "Please enter a valid name."
End If
%>
