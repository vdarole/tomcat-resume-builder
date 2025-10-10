<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.io.File" %>
<!doctype html>
<html>
<head>
  <meta charset="utf-8">
  <title>Saved Resumes</title>
  <link rel="stylesheet" href="css/style.css">
</head>
<body>
<div class="container">
  <h1>Saved Resumes</h1>
  <%
    File[] files = (File[]) request.getAttribute("files");
    if (files == null || files.length == 0) {
  %>
    <p>No resumes saved yet.</p>
  <%
    } else {
  %>
    <ul>
      <%
        for (File f : files) {
          String name = f.getName();
      %>
        <li>
          <a href="view?file=<%= name %>"><%= name.replace(".html","") %></a>
        </li>
      <%
        }
      %>
    </ul>
  <%
    }
  %>
  <p><a href="index.jsp">← Back to Builder</a></p>
</div>
</body>
</html>

