/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package beautyshop.controllers;

import beautyshop.model.ProductDAO;
import beautyshop.model.ProductDTO;
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
@WebServlet(name = "UpdateItemController", urlPatterns = {"/UpdateItemController"})
public class UpdateItemController extends HttpServlet {

    private static final String ERROR = "admin.jsp";
    private static final String SUCCESS = "SearchProductController";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        String url = ERROR;
        try {
            String productID = request.getParameter("productID");
            String productName = request.getParameter("productName");
            double price = Double.parseDouble(request.getParameter("price"));
            int quantity = Integer.parseInt(request.getParameter("quantity"));
//            String status = request.getParameter("status");
            String status = "1";

            ProductDAO dao = new ProductDAO();
            ProductDTO product = new ProductDTO(productID, productName, price, quantity, true);
            boolean checkUpdate = dao.update(product);
            if (checkUpdate) {
                request.setAttribute("MESSAGE", "Update successfully");
                url = request.getParameter("success");
                request.setAttribute("TITLE", "Update success!!!");
                request.setAttribute("ICON", "success");
                request.setAttribute("BUTTON", "Continue");
            } else {
                request.setAttribute("MESSAGE", "Update failed");
                request.setAttribute("TITLE", "Update failed!!!");
                request.setAttribute("ICON", "error");
                request.setAttribute("BUTTON", "Try again");
            }

        } catch (Exception e) {
            log("Error at UpdateItemController: " + e.toString());
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
