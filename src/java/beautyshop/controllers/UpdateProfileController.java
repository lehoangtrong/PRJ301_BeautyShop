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
import java.sql.SQLException;
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
@WebServlet(name = "UpdateProfileController", urlPatterns = {"/UpdateProfileController"})
public class UpdateProfileController extends HttpServlet {

    private static final String ERROR = "updateProfile.jsp";
    private static final String SUCCESS = "shopping.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        String url = ERROR;
        try {
            HttpSession session = request.getSession();
            UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
            String userID = loginUser.getUserID();
            String oldPassword = request.getParameter("oldPassword");
            if (oldPassword.isEmpty()) {
                String fullName = request.getParameter("fullName");
                String email = request.getParameter("email");
                UserDAO dao = new UserDAO();
                UserError error = new UserError();
                boolean check = true;
                if (fullName.length() < 2 || fullName.length() > 50) {
                    error.setFullNameError("Full name must be 2-50 characters");
                    check = false;
                }
                if (check) {
                    UserDTO user = new UserDTO(userID, loginUser.getPassword(), fullName, email, "US", "true");
                    url = updateUser(dao, user, url, session, request, userID);
                } else {
                    request.setAttribute("USER_ERROR", error);
                    request.setAttribute("MESSAGE", "Update failed user: " + userID);
                    request.setAttribute("TITLE", "Update failed!!!");
                    request.setAttribute("ICON", "error");
                    request.setAttribute("BUTTON", "Try again");
                }
            } else {
                String password = request.getParameter("password");
                String confirm = request.getParameter("confirm");
                String fullName = request.getParameter("fullName");
                String email = request.getParameter("email");

                if (!oldPassword.equals(loginUser.getPassword())) {
                    request.setAttribute("ERROR", "Old password is incorrect");
                    request.setAttribute("MESSAGE", "Update failed user: " + userID);
                    request.setAttribute("TITLE", "Update failed!!!");
                    request.setAttribute("ICON", "error");
                    request.setAttribute("BUTTON", "Try again");
                } else {
                    UserDAO dao = new UserDAO();
                    UserError error = new UserError();
                    boolean check = true;
                    if (password.length() < 5) {
                        error.setPasswordError("Password must be at least 5 characters");
                        check = false;
                    }
                    if (!confirm.equals(password)) {
                        error.setConfirmError("Confirm must match password");
                        check = false;
                    }
                    if (fullName.length() < 2 || fullName.length() > 50) {
                        error.setFullNameError("Full name must be 2-50 characters");
                        check = false;
                    }
                    if (check) {
                        UserDTO user = new UserDTO(userID, password, fullName, email, "US", "true");
                        url = updateUser(dao, user, url, session, request, userID);
                    } else {
                        request.setAttribute("USER_ERROR", error);
                        request.setAttribute("MESSAGE", "Update failed user: " + userID);
                        request.setAttribute("TITLE", "Update failed!!!");
                        request.setAttribute("ICON", "error");
                        request.setAttribute("BUTTON", "Try again");
                    }
                }
            }
        } catch (Exception e) {
            log("Error at UpdateProfileController: " + e.toString());
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
        }

    }

    private String updateUser(UserDAO dao, UserDTO user, String url, HttpSession session, HttpServletRequest request, String userID) throws SQLException, ClassNotFoundException {
        boolean checkUpdate = dao.updateWithPassword(user);
        if (checkUpdate) {
            url = SUCCESS;
            session.setAttribute("LOGIN_USER", user);
            request.setAttribute("MESSAGE", "Update success user: " + userID);
            request.setAttribute("TITLE", "Update success!!!");
            request.setAttribute("ICON", "success");
            request.setAttribute("BUTTON", "Continue");
        } else {
            request.setAttribute("ERROR", "Update failed");
            request.setAttribute("MESSAGE", "Update failed user: " + userID);
            request.setAttribute("TITLE", "Update failed!!!");
            request.setAttribute("ICON", "error");
            request.setAttribute("BUTTON", "Continue");
        }
        return url;
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
