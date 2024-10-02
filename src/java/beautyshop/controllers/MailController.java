/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package beautyshop.controllers;

import beautyshop.model.Cart;
import beautyshop.model.ProductDTO;
import beautyshop.model.UserDTO;
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
@WebServlet(name = "MailController", urlPatterns = {"/MailController"})
public class MailController extends HttpServlet {

    private static final String ERROR = "checkout.jsp";
    private static final String SUCCESS = "shopping.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        String url = ERROR;
        try {
            String to = request.getParameter("mail");
            String subject = "Thank you for shopping at Beauty Shop!";

            HttpSession session = request.getSession();
            Cart cart = (Cart) session.getAttribute("CART");
            UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");

            String body = "";
//            add bootstrap css
            body += "<h1>Thank you " + loginUser.getFullName() + " for shopping at Beauty Shop!</h1>";
            body += "<table border='1' style='border-collapse: collapse; width: 100%;'>";
            body += "<tr>";
            body += "<th>Product ID</th>";
            body += "<th>Product Name</th>";
            body += "<th>Quantity</th>";
            body += "<th>Price</th>";
            body += "<th>Total</th>";
            body += "</tr>";
            for (ProductDTO productDTO : cart.getCart().values()) {
                body += "<tr>";
                body += "<td>" + productDTO.getProductID() + "</td>";
                body += "<td>" + productDTO.getProductName() + "</td>";
                body += "<td>" + productDTO.getQuantity() + "</td>";
                body += "<td>" + productDTO.getPrice() + "</td>";
                body += "<td>" + productDTO.getPrice() * productDTO.getQuantity() + "</td>";
                body += "</tr>";
            }
            body += "<tr>";
            body += "<td colspan='4'>Total:</td>";
            body += "<td>" + cart.getTotal() + "</td>";
            body += "</tr>";
            body += "</table>";
            body += "<h2>Thank you for shopping at Beauty Shop!</h2>";

            if (SendMail.sendMail(to, subject, body)) {
                session.setAttribute("CART", null);
                request.setAttribute("MESSAGE", "Checkout success! Please check your email for more information!");
                request.setAttribute("TITLE", "Checkout success!!!");
                request.setAttribute("ICON", "success");
                request.setAttribute("BUTTON", "Continue");
            } else {
                request.setAttribute("MESSAGE", "Checkout success! But we can't send email to you. Please check your email for more information!");
                request.setAttribute("TITLE", "Checkout success!!!");
                request.setAttribute("ICON", "success");
                request.setAttribute("BUTTON", "Continue");
            }
            url = SUCCESS;
        } catch (Exception e) {
            log("Error at MailController: " + e.toString());
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
