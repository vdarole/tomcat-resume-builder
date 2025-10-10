Project Title: Java Resume Builder Web Application
Project Overview:

The Java Resume Builder is a web-based application built using Java Servlets, JSP, and HTML/CSS, packaged as a WAR file and deployed on Apache Tomcat 10.0.11. It allows users to create, preview, save, and manage resumes dynamically through a browser interface.

Key Features:

Dynamic Resume Form:

Users can input personal details, summary, education, experience, and skills.

Multiple rows can be added dynamically for Education, Experience, and Skills using “Add” buttons (JavaScript).

Preview Resume:

A Preview button opens the resume in a new window/tab.

The original form retains the entered data.

The preview page has a Close Window button instead of an edit button.

Save Resume:

Users can save the resume to the server as an HTML file.

Saved resumes are stored in a dedicated /resumes/ folder inside the web application.

Manage Saved Resumes:

A Saved Resumes page lists all saved resumes.

Clicking on a resume opens it in a new window for viewing.

Reset Functionality:

A Reset button clears all inputs from the form.

Technologies Used:

Backend: Java Servlets (Jakarta Servlet 5.0)

Frontend: JSP, HTML, CSS, JavaScript

Web Server: Apache Tomcat 10.0.11

Build Tool: Maven (WAR packaging)

How It Works:

User opens the Resume Builder form (index.jsp).

Fills in personal, education, experience, and skills details.

Adds more rows dynamically if needed using “Add” buttons.

Clicks Preview → opens resume in a new tab/window.

Clicks Save → stores resume as an HTML file on the server.

Clicks View Saved Resumes → opens a page listing all saved resumes.

Clicks a resume in the list → opens the saved resume in a new window.

Advantages / Highlights:

Fully web-based, no installation required on client machine.

Dynamic form fields for flexibility.

Supports multiple resumes per user.

Easy to deploy on any Tomcat server.

Lightweight, simple, and extendable for features like PDF export or database storage.
