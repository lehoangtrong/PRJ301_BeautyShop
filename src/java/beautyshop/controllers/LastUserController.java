/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package beautyshop.controllers;

import beautyshop.model.UserDAO;
import beautyshop.model.UserDTO;
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
@WebServlet(name = "LastUserController", urlPatterns = {"/LastUserController"})
public class LastUserController extends HttpServlet {

    private static final String ERROR = "login.jsp";
    private static final String SUCCESS = "lastUser.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        String url = ERROR;
        try {
            UserDAO dao = new UserDAO();
            UserDTO user = dao.getLastUser();
            if (user != null) {
                request.setAttribute("USER", user);
                request.setAttribute("MESSAGE", "Last User:");
                request.setAttribute("TITLE", "Last User Information");
                request.setAttribute("ICON", "success");
                request.setAttribute("BUTTON", "Continue");
                url = SUCCESS;
            } else {
                request.setAttribute("MESSAGE", "No User Found");
                request.setAttribute("TITLE", "Error");
                request.setAttribute("ICON", "error");
                request.setAttribute("BUTTON", "Back");
            }
        } catch (Exception e) {
            log("Error at LastUserController: " + e.toString());
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
