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

<div class="container mt-5">
    <div class="card mx-auto shadow-lg p-4 text-center" style="max-width: 500px;">
        <!-- Cute Font Awesome Emoji -->
        <div class="mb-3">
            <i class="fas fa-user-edit text-primary" style="font-size: 50px;"></i>
        </div>

        <h3 class="text-center mb-4">Update User</h3>

        <form  id="userForm" action="update.asp" method="POST">
            <input type="hidden" name="action" value="update">
            <input type="hidden" name="id" value="<%= userID %>">

            <!-- First Name -->
            <div class="mb-3 input-group">
                <span class="input-group-text"><i class="fas fa-user"></i></span>
                <input type="text" class="form-control" id="firstName" name="firstName" placeholder="First Name" value="<%= FirstName %>"  required>
            </div>

            <!-- Last Name -->
            <div class="mb-3 input-group">
                <span class="input-group-text"><i class="fas fa-user"></i></span>
                <input type="text" class="form-control" id="lastName" name="lastName" placeholder="Last Name" value="<%= LastName %>"  required>
            </div>

            <!-- Age -->
            <div class="mb-3 input-group">
                <span class="input-group-text"><i class="fas fa-birthday-cake"></i></span>
                <input type="number" class="form-control" id="age" name="age" min="1" placeholder="Age" value="<%= Age %>" required>
            </div>




            <div class="mb-3 input-group">
                <span class="input-group-text"><i class="fas fa-toggle-on"></i></span>
                <select class="form-select" name="isActive" required>
                    <option value="Active" <%= IIf(Status="Active", "selected", "") %>>Active</option>
                    <option value="Inactive" <%= IIf(Status="Inactive", "selected", "") %>>Inactive</option>
                </select>
            </div>

            <!-- Buttons -->
            <div class="d-flex gap-2">
                <button type="submit" class="btn btn-primary w-50">
                    <i class="fas fa-save"></i> Update
                </button>
                <button type="button" class="btn btn-secondary w-50" id="clearForm">
                    <i class="fas fa-eraser"></i> Clear
                </button>
                <a href="grid.asp" class="btn btn-secondary w-50">
                    <i class="fas fa-times"></i> Cancel
                </a>
            </div>
        </form>
    </div>
</div>

<script>
    document.getElementById("clearForm").addEventListener("click", function() {
        document.getElementById("userForm").reset();
    });
    </script>

<!--#include file="includes/footer.asp"-->
