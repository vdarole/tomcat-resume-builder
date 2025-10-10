<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.Arrays" %>
<!doctype html>
<html>
<head>
  <meta charset="utf-8"/>
  <title>Resume Preview - ${name}</title>
  <link rel="stylesheet" href="css/style.css"/>
  <style>
    /* small extra to format resume nicely */
    .resume { max-width: 800px; margin: 0 auto; padding: 24px; background: white; }
    .header { display:flex; justify-content:space-between; align-items:center; }
    .section { margin-top:18px; }
    .section h3 { border-bottom:1px solid #ddd; padding-bottom:6px; }
  </style>
</head>
<body>
  <div class="container resume">
    <div class="header">
      <div>
        <h1>${name}</h1>
        <div>${email} | ${phone}</div>
      </div>
    </div>

    <div class="section">
      <h3>Summary</h3>
      <p>${summary}</p>
    </div>

    <div class="section">
      <h3>Experience</h3>
      <%
        String[] expTitle = (String[]) request.getAttribute("expTitle");
        String[] expCompany = (String[]) request.getAttribute("expCompany");
        String[] expDuration = (String[]) request.getAttribute("expDuration");
        if (expTitle != null) {
          for (int i=0;i<expTitle.length;i++) {
      %>
            <div>
              <strong><%= expTitle[i] != null ? expTitle[i] : "" %></strong>
              <span> - <%= expCompany != null && i < expCompany.length && expCompany[i] != null ? expCompany[i] : "" %></span>
              <div><em><%= expDuration != null && i < expDuration.length && expDuration[i] != null ? expDuration[i] : "" %></em></div>
            </div>
      <%
          }
        }
      %>
    </div>

    <div class="section">
      <h3>Education</h3>
      <%
        String[] eduTitle = (String[]) request.getAttribute("educationTitle");
        String[] eduYear = (String[]) request.getAttribute("educationYear");
        if (eduTitle != null) {
          for (int i=0;i<eduTitle.length;i++) {
      %>
            <div>
              <strong><%= eduTitle[i] != null ? eduTitle[i] : "" %></strong>
              <span> — <%= eduYear != null && i < eduYear.length && eduYear[i] != null ? eduYear[i] : "" %></span>
            </div>
      <%
          }
        }
      %>
    </div>

    <div class="section">
      <h3>Skills</h3>
      <%
        String[] skills = (String[]) request.getAttribute("skills");
        if (skills != null) {
          // If single comma-separated entry was given, split it
          if (skills.length == 1 && skills[0].contains(",")) {
            String[] tokens = skills[0].split("\\s*,\\s*");
            for (String s: tokens) { out.print("<span class='skill'>" + s + "</span> "); }
          } else {
            for (String s: skills) { out.print("<span class='skill'>" + s + "</span> "); }
          }
        }
      %>
    </div>

  <div class="actions">
    <!-- Close the preview window -->
    <button class="close-btn" onclick="window.close()">Close Window</button>
  </div>


  </div>
</body>
</html>

