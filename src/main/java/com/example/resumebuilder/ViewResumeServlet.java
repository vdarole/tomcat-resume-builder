package com.example.resumebuilder;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.*;

@WebServlet(name = "ViewResumeServlet", urlPatterns = {"/view"})
public class ViewResumeServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        String file = req.getParameter("file");
        if (file == null) { resp.sendRedirect("list"); return; }

        File resumeFile = new File(getServletContext().getRealPath("/") + "resumes/" + file);
        if (!resumeFile.exists()) {
            resp.getWriter().println("Resume not found");
            return;
        }

        resp.setContentType("text/html");
        try (FileInputStream fis = new FileInputStream(resumeFile)) {
            fis.transferTo(resp.getOutputStream());
        }
    }
}

