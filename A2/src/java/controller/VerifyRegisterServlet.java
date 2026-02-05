/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.AccountDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author DELL
 */
@WebServlet(name = "VerifyRegisterServlet", urlPatterns = {"/verify"})
public class VerifyRegisterServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet VerifyRegisterServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet VerifyRegisterServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String sessionOtp = (String) session.getAttribute("registerOtp");

        if (sessionOtp == null) {
            response.sendRedirect(request.getContextPath() + "/register");
            return;
        }

        request.getRequestDispatcher("verifyRegister.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();

        String inputOtp = request.getParameter("otp");
        String sessionOtp = (String) session.getAttribute("registerOtp");
        Long regTime = (Long) session.getAttribute("regTime");   // ⭐ thêm

        if (sessionOtp == null || regTime == null) {
            response.sendRedirect(request.getContextPath() + "/register");
            return;
        }

        if (System.currentTimeMillis() - regTime > 2 * 60 * 1000) {
            session.removeAttribute("registerOtp");
            session.removeAttribute("regTime");

            request.setAttribute("error", "Mã OTP đã hết hạn! Vui lòng đăng ký lại.");
            request.getRequestDispatcher("verifyRegister.jsp").forward(request, response);
            return;
        }

        if (!sessionOtp.equals(inputOtp)) {
            request.setAttribute("error", "Mã OTP không đúng!");
            request.getRequestDispatcher("verifyRegister.jsp").forward(request, response);
            return;
        }

        String username = (String) session.getAttribute("regUsername");
        String password = (String) session.getAttribute("regPassword");
        String email = (String) session.getAttribute("regEmail");
        Integer role = (Integer) session.getAttribute("regRole");

        if (username == null || password == null || email == null || role == null) {
            response.sendRedirect(request.getContextPath() + "/register");
            return;
        }

        AccountDAO dao = new AccountDAO(getServletContext());
        dao.register(username, password, email, role);

        session.removeAttribute("registerOtp");
        session.removeAttribute("regTime");          
        session.removeAttribute("regUsername");
        session.removeAttribute("regPassword");
        session.removeAttribute("regEmail");
        session.removeAttribute("regRole");

        request.setAttribute("message", "Đăng ký thành công! Vui lòng đăng nhập.");
        request.getRequestDispatcher("register.jsp").forward(request, response);

    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
