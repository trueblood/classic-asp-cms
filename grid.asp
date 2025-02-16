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
<!-- DataTables JS -->
<link rel="stylesheet" href="https://cdn.datatables.net/1.13.6/css/jquery.dataTables.min.css">

<!-- Custom CSS for table styling -->
<style>
    /* Force table to use fixed layout for uniform column sizing */
    table {
        table-layout: fixed;
        width: 100%;
    }
    
    th, td {
        text-align: center !important;
        vertical-align: middle !important;
        white-space: nowrap; /* Prevent wrapping */
        overflow: hidden;
        text-overflow: ellipsis; /* Truncate text if too long */
    }

    /* Set specific column widths */
    .col-id { width: 50px !important; }       /* Shrink ID column */
    .col-first { width: 100px !important; }   /* Shrink First Name */
    .col-last { width: 100px !important; }    /* Shrink Last Name */
    .col-age { width: 60px !important; }      /* Shrink Age column */
    .col-status { width: 120px !important; }  /* Shrink Status column */
    .col-actions { width: 120px !important; white-space: nowrap; } /* Keep actions small */
</style>

<script src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js"></script>
    <h2 class="text-center mb-4"><i class="fas fa-users"></i> List of Persons</h2>

        <!-- Create New Person Button -->
        <div class="mb-3">
            <a href="create.asp" class="btn btn-success">
                <i class="fas fa-plus"></i> Create New Person
            </a>
        </div>
<br/>
    <table id="personTable" class="table table-bordered table-hover shadow">
        <thead class="table-dark">
            <tr>
                <th style="width:75px!important;">ID</th>
                <th style="width:50px!important;">First Name</th>
                <th style="width:50px!important;">Last Name</th>
                <th style="width:5px!important;">Age</th>
                <th style="width:5px!important;">Status</th>
                <th style="width:5px!important;">Actions</th>
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
                            <i class="fas fa-edit"></i>
                        </a>
                        <a href="delete.asp?id=<%= RS("ID") %>" class="btn btn-danger btn-sm" onclick="return confirm('Are you sure you want to delete this record?');">
                            <i class="fas fa-trash"></i>
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
<script>
    $(document).ready(function() {
        $('#personTable').DataTable({
            "columnDefs": [
                { "targets": [0], "visible": false } // Hide the ID column
            ]
        });
    });
    </script>