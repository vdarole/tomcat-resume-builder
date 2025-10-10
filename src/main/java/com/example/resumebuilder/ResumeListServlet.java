package com.example.resumebuilder;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.*;

@WebServlet(name = "ResumeListServlet", urlPatterns = {"/list"})
public class ResumeListServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        File dir = new File(getServletContext().getRealPath("/") + "resumes");
        File[] files = dir.exists() ? dir.listFiles((d, n) -> n.endsWith(".html")) : new File[0];
        req.setAttribute("files", files);
        req.getRequestDispatcher("/list.jsp").forward(req, resp);
    }
}

