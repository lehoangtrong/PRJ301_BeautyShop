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

/**
 *
 * @author LeHoangTrong
 */
@WebServlet(name = "CreateController", urlPatterns = {"/CreateController"})
public class CreateController extends HttpServlet {

    private static final String ERROR = "register.jsp";
    private static final String SUCCESS = "login.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        UserError error = new UserError();
        String url = ERROR;
        try {
            String recaptcha = request.getParameter("g-recaptcha-response");
            if (recaptcha.length() > 0) {
                boolean checkVadidation = true;
                UserDAO dao = new UserDAO();

                String userID = request.getParameter("userID");
                String fullName = request.getParameter("fullName");
                String password = request.getParameter("password");
                String email = request.getParameter("email");
//            String roleID = request.getParameter("roleID");
//            String status = request.getParameter("status");
                String roleID = "US";
                String status = "1";
                String confirm = request.getParameter("confirm");

                if (userID.length() < 2 || userID.length() > 10) {
                    checkVadidation = false;
                    error.setUserIDError("UserID must be in (2,10)");
                }
                if (fullName.length() < 5 || fullName.length() > 50) {
                    checkVadidation = false;
                    error.setFullNameError("FullName must be in (5,50)");
                }
                if (!confirm.equals(password)) {
                    checkVadidation = false;
                    error.setConfirmError("Confirm must match password");
                }

                if (checkVadidation) {
                    boolean checkInsert = dao.insert(new UserDTO(userID, password, fullName, email, roleID, status));
                    if (checkInsert) {
                        url = SUCCESS;
                        request.setAttribute("MESSAGE", "Create success!!!");
                        request.setAttribute("TITLE", "Create success!!!");
                        request.setAttribute("ICON", "success");
                        request.setAttribute("BUTTON", "Close");
                    } else {
                        error.setError("Create failed!!!");
                        request.setAttribute("USER_ERROR", error);
                        request.setAttribute("MESSAGE", "Create failed!!!");
                        request.setAttribute("TITLE", "Create failed!!!");
                        request.setAttribute("ICON", "error");
                        request.setAttribute("BUTTON", "Try again");
                    }
                } else {
                    request.setAttribute("USER_ERROR", error);
                }
            } else {
                request.setAttribute("MESSAGE", "Please check recaptcha!!!");
                request.setAttribute("TITLE", "Login failed!!!");
                request.setAttribute("ICON", "error");
                request.setAttribute("BUTTON", "Try again");
            }

        } catch (Exception e) {
            if (e.toString().contains("duplicate")) {
                error.setUserIDError("UserID is existed!!!");
                request.setAttribute("USER_ERROR", error);
                request.setAttribute("MESSAGE", "Create failed!!!");
                request.setAttribute("TITLE", "Create failed!!!");
                request.setAttribute("ICON", "error");
                request.setAttribute("BUTTON", "Try again");
            }
            log("Error at CreateController: " + e.toString());
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
