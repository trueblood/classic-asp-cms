<!--#include file="includes/header.asp"-->
<%
Dim Conn, ConnStr, RS, SQL

' Define the connection string
ConnStr = "Provider=SQLOLEDB;Server=localhost\SQLEXPRESS;Database=ClassicASPDB;User ID=test;Password=Psdet324-db3;Encrypt=False;"

' Create an ADO Connection object
Set Conn = Server.CreateObject("ADODB.Connection")

On Error Resume Next  ' Enable error handling

' Attempt to open the connection
Conn.Open ConnStr

' Define SQL Query to Select All Records
SQL = "SELECT * FROM classicaspodb.Person ORDER BY ID DESC"

' Execute SQL Query
Set RS = Conn.Execute(SQL)
%>
    <h2 class="text-center mb-4"><i class="fas fa-users"></i> List of Persons</h2>

        <!-- Create New Person Button -->
        <div class="mb-3">
            <a href="create.asp" class="btn btn-success">
                <i class="fas fa-plus"></i> Create New Person
            </a>
        </div>
        
    <table class="table table-bordered table-hover shadow">
        <thead class="table-dark">
            <tr>
                <th>ID</th>
                <th>First Name</th>
                <th>Last Name</th>
                <th>Age</th>
                <th>Status</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <% Do While Not RS.EOF %>
                <tr>
                    <td><%= RS("ID") %></td>
                    <td><%= RS("FirstName") %></td>
                    <td><%= RS("LastName") %></td>
                    <td><%= RS("Age") %></td>
                    <td><%= RS("Status") %></td>
                    <td>
                        <a href="update.asp?id=<%= RS("ID") %>" class="btn btn-warning btn-sm">
                            <i class="fas fa-edit"></i> Edit
                        </a>
                        <a href="delete.asp?id=<%= RS("ID") %>" class="btn btn-danger btn-sm" onclick="return confirm('Are you sure you want to delete this record?');">
                            <i class="fas fa-trash"></i> Delete
                        </a>
                    </td>
                </tr>
            <% 
                RS.MoveNext 
            Loop 
            %>
        </tbody>
    </table>
    
    <% ' Close Recordset and Connection %>
    <% RS.Close: Set RS = Nothing %>
    <% Conn.Close: Set Conn = Nothing %>
    
<!--#include file="includes/footer.asp"-->
