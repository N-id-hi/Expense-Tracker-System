<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@ page import="java.sql.*" %>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Search Expense:</title>
</head>
<body bgcolor="#ffffcc">
<font size="+3" color="green"><br>Welcome to Expense Tracking System!</font>
<FORM action="search.jsp" method="get">
<TABLE style="background-color: #ECE5B6;" WIDTH="30%">
<TR>
<TH width="50%">Expense Type:</TH>
<TD width="50%"><INPUT TYPE="text" NAME="exp_type"></TD>
</tr>
<TR>
<TH width="50%">Expense:</TH>
<TD width="50%"><INPUT TYPE="text" NAME="exp"></TD>
</tr>
<TR>
<TH></TH>
<TD width="50%"><INPUT TYPE="submit" VALUE="Search"></TD>
</tr>
</TABLE>
</FORM>

<%
String expType = request.getParameter("exp_type");
String exp = request.getParameter("exp");
if (expType != null || exp != null) {
    try {
        Class.forName("com.mysql.jdbc.Driver"); 
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ETS?characterEncoding=latin1", "root", "tiger");
        String query = "SELECT * FROM expense WHERE 1=1";
        if (expType != null && !expType.trim().isEmpty()) {
            query += " AND exp_type LIKE '%" + expType + "%'";
        }
        if (exp != null && !exp.trim().isEmpty()) {
            query += " AND exp LIKE '%" + exp + "%'";
        }
        Statement st = con.createStatement();
        ResultSet rs = st.executeQuery(query);
%>
<h2>Search Results</h2>
<TABLE cellpadding="15" border="1" style="background-color: #ffffcc;">
<tr><th>Expense ID</th><th>Expense Type</th><th>Expense</th></tr>
<%
        while (rs.next()) {
%>
<tr>
    <td><%=rs.getInt(1)%></td>
    <td><%=rs.getString(2)%></td>
    <td><%=rs.getString(3)%></td>
</tr>
<%
        }
        rs.close();
        st.close();
        con.close();
    } catch (Exception ex) {
%>
<font size="+3" color="red"><b>Unable to connect to database.</b></font>
<%
    }
}
%>
</TABLE>
</body>
</html>
