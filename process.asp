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

Dim FirstName, LastName, Age, IsActive


If generateRandom = "true" Then
    randomNumber = GenerateRandomNumber(1, 100)
    Response.Write randomNumber
ElseIf capitalize = "true" Then
    Response.Write CapitalizeText(name)
ElseIf name <> "" Then
    Response.Write "Hello, " & Server.HTMLEncode(name) & "!"
End If

FirstName = Request.Form("firstName")
LastName = Request.Form("lastName")
Age = Request.Form("age")
IsActive = Request.Form("isActive")


If firstName <> "" And lastName <> "" And age <> "" And isActive <> "" Then
    ' Prepare SQL Insert Statement
    ConnStr = "Provider=SQLOLEDB;Server=localhost\SQLEXPRESS;Database=ClassicASPDB;User ID=test;Password=Psdet324-db3;Encrypt=False;"
    Set Conn = Server.CreateObject("ADODB.Connection")
    Conn.Open ConnStr




    ' Prepare SQL Insert Statement
    SQL = "INSERT INTO classicaspodb.Person (FirstName, LastName, Age, Status) VALUES ('" & FirstName & "', '" & LastName & "', " & Age & ", '" & IsActive & "')"

    
    <!-- SQL = "INSERT INTO ClassicASPDB].[classicaspodb].[Person] (FirstName, LastName, Age, Status) VALUES ('" & firstName & "', '" & lastName & "', " & age & ", '" & isActive & "')" -->

    ' Execute the SQL Statement
    Conn.Execute SQL

    ' Close Database Connection
    Conn.Close
    Set Conn = Nothing

    Response.Write "User added successfully!"
End If
%>
