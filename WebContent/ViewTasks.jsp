<%@include file = "dbConnect.jsp" %>
<%
//out.println("here");
String selectQuery = "SELECT * from tasks";
PreparedStatement pst = connection.prepareStatement(selectQuery); 
ResultSet rs = pst.executeQuery(selectQuery);
%>
<TABLE BORDER="1">
            <TR>
                <TH>Task Number</TH>
                <TH>Task Name</TH>
                <TH>Task Priority</TH>
                <TH>Task Status</TH>
            </TR>
            <% while(rs.next()){ %>
            <TR>
                <TD> <%= rs.getString(1) %></td>
                <TD> <%= rs.getString(2) %></TD>
                <TD> <%= rs.getString(3) %></TD>
                <TD> <%= rs.getString(4) %></TD>
            </TR>
            <% } %>
        </TABLE>