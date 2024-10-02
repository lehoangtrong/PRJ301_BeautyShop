/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package beautyshop.controllers;

import beautyshop.model.UserDAO;
import beautyshop.model.UserDTO;
import beautyshop.model.UserError;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author LeHoangTrong
 */
@WebServlet(name = "CreatePasswordController", urlPatterns = {"/CreatePasswordController"})
public class CreatePasswordController extends HttpServlet {

    private static final String ERROR = "registerPassword.jsp";
    private static final String SUCCESS = "ShoppingController";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        String url = ERROR;
        try {
            String password = request.getParameter("password");
            String confirmPassword = request.getParameter("confirm");
            boolean check = true;
            UserError userError = new UserError();
            if (password.length() < 5) {
                check = false;
                userError.setPasswordError("Password must be greater than 5 characters");
            }
            if (!password.equals(confirmPassword)) {
                check = false;
                userError.setConfirmError("Confirm password must match password");
            }
            if (check) {
                HttpSession session = request.getSession();
                if (session != null) {
                    UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
                    loginUser.setPassword(password);
                    UserDAO dao = new UserDAO();
                    boolean checkCreate = dao.insert(loginUser);
                    if (checkCreate) {
                        url = SUCCESS;
                        request.setAttribute("MESSAGE", "Login success");
                        request.setAttribute("TITLE", "Login success!!!");
                        request.setAttribute("ICON", "success");
                        request.setAttribute("BUTTON", "Continue");
                    }
                }
            } else {
                request.setAttribute("USER_ERROR", userError);
            }

        } catch (Exception e) {
            log("Error at CreatePasswordController: " + e.toString());
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
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
        processRequest(request, response);
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
        processRequest(request, response);
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
