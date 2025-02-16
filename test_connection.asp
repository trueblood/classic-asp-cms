<%
Dim Conn, ConnStr

' Define the connection string
ConnStr = "Provider=SQLOLEDB;Server=localhost\SQLEXPRESS;Database=ClassicASPDB;User ID=test;Password=Psdet324-db3;Encrypt=False;"


' Create an ADO Connection object
Set Conn = Server.CreateObject("ADODB.Connection")

On Error Resume Next  ' Enable error handling

' Attempt to open the connection
Conn.Open ConnStr

' Check if the connection was successful
If Err.Number <> 0 Then
    Response.Write "<h3 style='color:red;'>Connection Failed!</h3>"
    Response.Write "Error: " & Err.Description
Else
    Response.Write "<h3 style='color:green;'>Database Connected Successfully!</h3>"
    ' ========================== INSERT TEST VALUES ==========================
    FirstName = "TestFirstName"
    LastName = "TestLastName"
    Age = 25
    IsActive = "Active"

    ' Prepare SQL Insert Statement
    SQL = "INSERT INTO classicaspodb.Person (FirstName, LastName, Age, Status) VALUES ('" & FirstName & "', '" & LastName & "', " & Age & ", '" & IsActive & "')"

    ' Execute the SQL Statement
    Conn.Execute SQL

    ' Check if the insert was successful
    If Err.Number <> 0 Then
        Response.Write "<h3 style='color:red;'>Insert Failed!</h3>"
        Response.Write "Error: " & Err.Description
        Err.Clear
    Else
        Response.Write "<h3 style='color:green;'>Test Value Inserted Successfully!</h3>"
    End If

    ' ========================== RETRIEVE ALL RECORDS ==========================
    ' Define SQL Query to Select All Records
    SQL = "SELECT * FROM classicaspodb.Person ORDER BY ID DESC"

    ' Execute SQL Query
    Set RS = Conn.Execute(SQL)

    ' Start HTML Output
    Response.Write "<html><head><title>Person List</title>"
    Response.Write "<link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css'>"
    Response.Write "</head><body class='container mt-5'>"

    Response.Write "<h2 class='text-center'>List of Persons</h2>"
    Response.Write "<table class='table table-bordered table-striped mt-4'>"
    Response.Write "<tr><th>ID</th><th>First Name</th><th>Last Name</th><th>Age</th><th>Status</th></tr>"

    ' Loop Through Records and Display Data
    Do While Not RS.EOF
        Response.Write "<tr>"
        Response.Write "<td>" & RS("ID") & "</td>"
        Response.Write "<td>" & RS("FirstName") & "</td>"
        Response.Write "<td>" & RS("LastName") & "</td>"
        Response.Write "<td>" & RS("Age") & "</td>"
        Response.Write "<td>" & RS("Status") & "</td>"
        Response.Write "</tr>"
        RS.MoveNext
    Loop

    Response.Write "</table>"
    Response.Write "</body></html>"

    ' Close Recordset
    RS.Close
    Set RS = Nothing
End If

' Close the connection
Conn.Close
Set Conn = Nothing
%>
