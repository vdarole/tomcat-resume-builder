package com.example.resumebuilder;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

/**
 * Receives form data and forwards to resume.jsp for rendering.
 */
@WebServlet(name = "ResumeServlet", urlPatterns = {"/build"})
public class ResumeServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");

        // Simple inputs (repeatable fields can be sent as arrays)
        String name = req.getParameter("name");
        String email = req.getParameter("email");
        String phone = req.getParameter("phone");
        String summary = req.getParameter("summary");

        String[] educationTitle = req.getParameterValues("edu_title");
        String[] educationYear = req.getParameterValues("edu_year");
        String[] expTitle = req.getParameterValues("exp_title");
        String[] expCompany = req.getParameterValues("exp_company");
        String[] expDuration = req.getParameterValues("exp_duration");
        String[] skills = req.getParameterValues("skills");

        req.setAttribute("name", name);
        req.setAttribute("email", email);
        req.setAttribute("phone", phone);
        req.setAttribute("summary", summary);
        req.setAttribute("educationTitle", educationTitle);
        req.setAttribute("educationYear", educationYear);
        req.setAttribute("expTitle", expTitle);
        req.setAttribute("expCompany", expCompany);
        req.setAttribute("expDuration", expDuration);
        req.setAttribute("skills", skills);

        // forward to JSP preview
        req.getRequestDispatcher("/resume.jsp").forward(req, resp);
    }
}

