<!--#include file="includes/header.asp"-->
<%
Dim Conn, ConnStr, RS, SQL, userID, FirstName, LastName, Age, Status, action

' Get User ID from Query String
userID = Request.QueryString("id")

' Define the connection string
ConnStr = "Provider=SQLOLEDB;Server=localhost\SQLEXPRESS;Database=ClassicASPDB;User ID=test;Password=Psdet324-db3;Encrypt=False;"

' Create an ADO Connection object
Set Conn = Server.CreateObject("ADODB.Connection")

On Error Resume Next  ' Enable error handling

' Attempt to open the connection
Conn.Open ConnStr

' Fetch User Details
SQL = "SELECT * FROM classicaspodb.Person WHERE ID=" & userID
Set RS = Conn.Execute(SQL)

If Not RS.EOF Then
    FirstName = RS("FirstName")
    LastName = RS("LastName")
    Age = RS("Age")
    Status = RS("Status")
End If

RS.Close
Set RS = Nothing

' Retrieve form values
action = Request.Form("action")

If action = "update" Then
FirstName = Request.Form("firstName")
LastName = Request.Form("lastName")
Age = Request.Form("age")
Status = Request.Form("isActive")
userID = Request.Form("id")

    
    SQL = "UPDATE classicaspodb.Person SET " & _
    "FirstName='" & FirstName & "', " & _
    "LastName='" & LastName & "', " & _
    "Age=" & Age & ", " & _
    "Status='" & Status & "' " & _
    "WHERE ID=" & userID


    
    ' Execute SQL Query
    Conn.Execute(SQL)
    
    ' Redirect back to grid
    Response.Redirect("grid.asp")
End If

' Close Connection
Conn.Close
Set Conn = Nothing
%>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update User</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
</head>
<body class="container mt-5">
    <div class="card mx-auto shadow-lg p-4 text-center" style="max-width: 500px;">
        <div class="mb-3">
            <i class="fas fa-user-edit text-primary" style="font-size: 50px;"></i>
        </div>

        <h3 class="text-center mb-4">Update User</h3>

        <form action="update.asp" method="POST">
            <input type="hidden" name="action" value="update">
            <input type="hidden" name="id" value="<%= userID %>">

            <div class="mb-3 input-group">
                <span class="input-group-text"><i class="fas fa-user"></i></span>
                <input type="text" class="form-control" name="firstName" value="<%= FirstName %>" required>
            </div>

            <div class="mb-3 input-group">
                <span class="input-group-text"><i class="fas fa-user"></i></span>
                <input type="text" class="form-control" name="lastName" value="<%= LastName %>" required>
            </div>

            <div class="mb-3 input-group">
                <span class="input-group-text"><i class="fas fa-birthday-cake"></i></span>
                <input type="number" class="form-control" name="age" value="<%= Age %>" required>
            </div>

            <div class="mb-3 input-group">
                <span class="input-group-text"><i class="fas fa-toggle-on"></i></span>
                <select class="form-select" name="isActive" required>
                    <option value="Active" <%= IIf(Status="Active", "selected", "") %>>Active</option>
                    <option value="Inactive" <%= IIf(Status="Inactive", "selected", "") %>>Inactive</option>
                </select>
            </div>

            <div class="d-flex gap-2">
                <button type="submit" class="btn btn-primary w-50">
                    <i class="fas fa-save"></i> Update
                </button>
                <a href="grid.asp" class="btn btn-secondary w-50">
                    <i class="fas fa-times"></i> Cancel
                </a>
            </div>
        </form>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

<!--#include file="includes/footer.asp"-->
