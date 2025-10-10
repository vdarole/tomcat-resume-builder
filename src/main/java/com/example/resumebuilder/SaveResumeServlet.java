package com.example.resumebuilder;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.*;
import java.nio.file.*;

@WebServlet(name = "SaveResumeServlet", urlPatterns = {"/save"})
public class SaveResumeServlet extends HttpServlet {
    private static final String SAVE_DIR = "resumes";

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        req.setCharacterEncoding("UTF-8");
        String name = req.getParameter("name");
        if (name == null || name.isEmpty()) {
            resp.sendRedirect("index.jsp");
            return;
        }

        File saveDir = new File(getServletContext().getRealPath("/") + SAVE_DIR);
        if (!saveDir.exists()) saveDir.mkdirs();

        String fileName = name.replaceAll("[^a-zA-Z0-9_-]", "_") + ".html";
        File file = new File(saveDir, fileName);

        // Simple HTML template
        StringBuilder html = new StringBuilder();
        html.append("<html><head><title>").append(name).append("</title></head><body>");
        html.append("<h1>").append(name).append("</h1>");
        html.append("<p>Email: ").append(req.getParameter("email")).append("<br>");
        html.append("Phone: ").append(req.getParameter("phone")).append("</p>");
        html.append("<h3>Summary</h3><p>").append(req.getParameter("summary")).append("</p>");

        String[] edu = req.getParameterValues("edu_title");
        String[] years = req.getParameterValues("edu_year");
        if (edu != null) {
            html.append("<h3>Education</h3><ul>");
            for (int i = 0; i < edu.length; i++) {
                html.append("<li>").append(edu[i]).append(" - ")
                    .append(years != null && i < years.length ? years[i] : "")
                    .append("</li>");
            }
            html.append("</ul>");
        }

        String[] exp = req.getParameterValues("exp_title");
        String[] comp = req.getParameterValues("exp_company");
        String[] dur = req.getParameterValues("exp_duration");
        if (exp != null) {
            html.append("<h3>Experience</h3><ul>");
            for (int i = 0; i < exp.length; i++) {
                html.append("<li>").append(exp[i]).append(" at ")
                    .append(comp != null && i < comp.length ? comp[i] : "")
                    .append(" (").append(dur != null && i < dur.length ? dur[i] : "")
                    .append(")</li>");
            }
            html.append("</ul>");
        }

        String[] skills = req.getParameterValues("skills");
        if (skills != null) {
            html.append("<h3>Skills</h3><ul>");
            for (String s : skills) html.append("<li>").append(s).append("</li>");
            html.append("</ul>");
        }

        html.append("</body></html>");
        Files.writeString(file.toPath(), html.toString());

        resp.sendRedirect("list");
    }
}

