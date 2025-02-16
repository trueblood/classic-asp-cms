<!--#include file="includes/header.asp"-->
<%
Dim Conn, ConnStr, SQL, ID

' Retrieve ID from query string and ensure it's an integer
ID = Request.QueryString("id")
If IsNumeric(ID) Then
    ID = CInt(ID)
Else
    Response.Write "<script>alert('Invalid ID');window.location='index.asp';</script>"
    Response.End
End If

' Define the connection string
ConnStr = "Provider=SQLOLEDB;Server=localhost\SQLEXPRESS;Database=ClassicASPDB;User ID=test;Password=Psdet324-db3;Encrypt=False;"

' Create an ADO Connection object
Set Conn = Server.CreateObject("ADODB.Connection")

On Error Resume Next ' Enable error handling

' Attempt to open the connection
Conn.Open ConnStr

' Check for connection errors
If Err.Number <> 0 Then
    Response.Write "<script>alert('Database connection error!');window.location='grid.asp';</script>"
    Response.End
End If

' Define SQL Query to Delete the Record
SQL = "DELETE FROM classicaspodb.Person WHERE ID = " & ID

' Execute SQL Query
Conn.Execute SQL, , adCmdText

' Redirect to index page after deletion
Response.Write "<script>;window.location='grid.asp';</script>"

' Close Connection
Conn.Close
Set Conn = Nothing
%>
<!--#include file="includes/footer.asp"-->
