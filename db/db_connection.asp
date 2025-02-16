<%
' Include the config file for connection string
<!--#include file="../config/config.asp" -->

' Create an ADO Connection object
Dim Conn
Set Conn = Server.CreateObject("ADODB.Connection")

' Open the database connection
Conn.Open ConnStr

' Error handling (optional)
If Conn.State = 1 Then
    Response.Write "Database connection established successfully!<br>"
Else
    Response.Write "Database connection failed!<br>"
End If
%>
