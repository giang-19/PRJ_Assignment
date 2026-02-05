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
import util.EmailUtil;
import util.OTPUtil;

/**
 *
 * @author DELL
 */
@WebServlet(name = "ForgotPasswordServlet", urlPatterns = {"/forgotPassword"})
public class ForgotPasswordServlet extends HttpServlet {

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
            out.println("<title>Servlet ForgotPasswordServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ForgotPasswordServlet at " + request.getContextPath() + "</h1>");
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
        session.setAttribute("forgotStep", "email");

        request.getRequestDispatcher("forgotPassword.jsp").forward(request, response);
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
        String step = request.getParameter("step");
        HttpSession session = request.getSession();
        AccountDAO dao = new AccountDAO(getServletContext());

        if ("sendOtp".equals(step)) {
            String email = request.getParameter("email");

            if (dao.getAccoutByEmail(email) == null) {
                request.setAttribute("error", "Email không tồn tại trong hệ thống!");
                session.setAttribute("forgotStep", "email");
                request.getRequestDispatcher("forgotPassword.jsp").forward(request, response);
                return;
            }

            String otp = OTPUtil.generateOTP();

            long otpTime = System.currentTimeMillis();

            // Lưu session
            session.setAttribute("forgotOtp", otp);
            session.setAttribute("forgotOtpTime", otpTime);   // 🔴 THÊM
            session.setAttribute("forgotEmail", email);
            session.setAttribute("forgotStep", "otp");

            StringBuilder sb = new StringBuilder();
            sb.append("<html>");
            sb.append("<body>");
            sb.append("<h2>Yêu cầu đặt lại mật khẩu</h2>");
            sb.append("<p>Xin chào,</p>");
            sb.append("<p>Mã OTP của bạn là:</p>");
            sb.append("<h1 style='color:#f4602a;'>").append(otp).append("</h1>");
            sb.append("<p>Mã có hiệu lực trong <b>2 phút</b>.</p>");
            sb.append("<p>Vui lòng không chia sẻ mã này cho bất kỳ ai.</p>");
            sb.append("<hr>");
            sb.append("<p>PRJ301 Shop</p>");
            sb.append("</body>");
            sb.append("</html>");

            String content = sb.toString();

            EmailUtil.sendEmail(getServletContext(), email, "OTP đặt lại mật khẩu", content);

            request.getRequestDispatcher("forgotPassword.jsp").forward(request, response);
            return;
        }

        if ("verifyOtp".equals(step)) {
            String inputOtp = request.getParameter("otp");
            String sessionOtp = (String) session.getAttribute("forgotOtp");
            Long otpTime = (Long) session.getAttribute("forgotOtpTime"); 

            if (otpTime == null || System.currentTimeMillis() - otpTime > 2 * 60 * 1000) {
                request.setAttribute("error", "Mã OTP đã hết hạn. Vui lòng gửi lại mã mới!");
                session.removeAttribute("forgotOtp");
                session.removeAttribute("forgotOtpTime");
                session.setAttribute("forgotStep", "email");

                request.getRequestDispatcher("forgotPassword.jsp").forward(request, response);
                return;
            }

            if (sessionOtp != null && sessionOtp.equals(inputOtp)) {
                session.setAttribute("forgotVerified", true);
                session.removeAttribute("forgotStep");

                session.removeAttribute("forgotOtp");
                session.removeAttribute("forgotOtpTime");

                response.sendRedirect(request.getContextPath() + "/resetPassword");
            } else {
                request.setAttribute("error", "Mã OTP không đúng!");
                session.setAttribute("forgotStep", "otp");

                request.getRequestDispatcher("forgotPassword.jsp").forward(request, response);
            }
        }

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
