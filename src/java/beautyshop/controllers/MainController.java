/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package beautyshop.controllers;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author LeHoangTrong
 */
public class MainController extends HttpServlet {

    private static final String WELCOME = "home.jsp";

//    LOGIN
    private static final String LOGIN = "Login";
    private static final String LOGIN_CONTROLLER = "LoginController";

//    LOGIN WITH GOOGLE
    private static final String LOGIN_GOOGLE = "LoginWithGoogle";
    private static final String LOGIN_GOOGLE_CONTROLLER = "LoginGoogleController";
    private static final String CREATE_PASSWORD = "CreatePassword";
    private static final String CREATE_PASSWORD_CONTROLLER = "CreatePasswordController";

//    SEARCH
    private static final String SEARCH = "Search";
    private static final String SEARCH_CONTROLLER = "SearchController";

//    UPDATE
    private static final String UPDATE = "Update";
    private static final String UPDATE_CONTROLLER = "UpdateController";

//    DELETE
    private static final String DELETE = "Delete";
    private static final String DELETE_CONTROLLER = "DeleteController";

//    CREATE
    private static final String CREATE = "Create";
    private static final String CREATE_CONTROLLER = "CreateController";
//    UPDATE PROFILE
    private static final String UPDATE_PROFILE = "UpdateProfile";
    private static final String UPDATE_PROFILE_CONTROLLER = "UpdateProfileController";
//    LOGOUT
    private static final String LOGOUT = "Logout";
    private static final String LOGOUT_CONTROLLER = "LogoutController";

//    SHOPPING
    private static final String SHOPPING_PAGE_STRING = "Shopping_Page";
    private static final String SHOPPING_CONTROLLER = "ShoppingController";

//    SEARCH_PRODUCT
    private static final String SEARCH_PRODUCT = "SearchProduct";
    private static final String SEARCH_PRODUCT_CONTROLLER = "SearchProductController";

//    ADD TO CART
    private static final String ADD = "Add";
    private static final String ADD_CONTROLLER = "AddController";

//    VIEWCART
    private static final String VIEW = "viewCart";
    private static final String VIEW_CONTROLLER = "viewCart.jsp";
//    VIEW ORDER
    private static final String VIEW_ORDER = "viewOrder";
    private static final String VIEW_ORDER_CONTROLLER = "ViewOrderController";
//    VIEW DETAILS
    private static final String VIEW_DETAILS = "View_Detail";
    private static final String VIEW_DETAILS_CONTROLLER = "ViewDetailsController";

//    EDIT ITEM
    private static final String EDIT = "Edit";
    private static final String EDIT_CONTROLLER = "EditController";
//    UPDATE ITEM
    private static final String UPDATE_ITEM = "UpdateProduct";
    private static final String UPDATE_ITEM_CONTROLLER = "UpdateItemController";

//    REMOVE ITEM
    private static final String REMOVE = "Remove";
    private static final String REMOVE_CONTROLLER = "RemoveController";
//    Checkout
    private static final String CHECKOUT_BTN = "checkout_page";
    private static final String CHECKOUT_PAGE = "checkout.jsp";
    private static final String CHECKOUT = "Checkout";
    private static final String CHECKOUT_CONTROLLER = "CheckoutController";

//    LastUser
    private static final String LAST_USER = "LastUser";
    private static final String LAST_USER_CONTROLLER = "LastUserController";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        String url = WELCOME;
        try {
            String action = request.getParameter("action");

            if (LOGIN.equals(action)) {
                url = LOGIN_CONTROLLER;
            } else if (LOGIN_GOOGLE.equals(action)) {
                url = LOGIN_GOOGLE_CONTROLLER;
            } else if (CREATE_PASSWORD.equals(action)) {
                url = CREATE_PASSWORD_CONTROLLER;
            } else if (LOGOUT.equals(action)) {
                url = LOGOUT_CONTROLLER;
            } else if (SEARCH.equals(action)) {
                url = SEARCH_CONTROLLER;
            } else if (UPDATE.equals(action)) {
                url = UPDATE_CONTROLLER;
            } else if (DELETE.equals(action)) {
                url = DELETE_CONTROLLER;
            } else if (CREATE.equals(action)) {
                url = CREATE_CONTROLLER;
            } else if (SHOPPING_PAGE_STRING.equals(action)) {
                url = SHOPPING_CONTROLLER;
            } else if (SEARCH_PRODUCT.equals(action)) {
                url = SEARCH_PRODUCT_CONTROLLER;
            } else if (ADD.equals(action)) {
                url = ADD_CONTROLLER;
            } else if (VIEW.equals(action)) {
                url = VIEW_CONTROLLER;
            } else if (VIEW_ORDER.equals(action)) {
                url = VIEW_ORDER_CONTROLLER;
            } else if (VIEW_DETAILS.equals(action)) {
                url = VIEW_DETAILS_CONTROLLER;
            } else if (EDIT.equals(action)) {
                url = EDIT_CONTROLLER;
            } else if (UPDATE_ITEM.equals(action)) {
                url = UPDATE_ITEM_CONTROLLER;
            } else if (REMOVE.equals(action)) {
                url = REMOVE_CONTROLLER;
            } else if (CHECKOUT_BTN.equals(action)) {
                url = CHECKOUT_PAGE;
            } else if (CHECKOUT.equals(action)) {
                url = CHECKOUT_CONTROLLER;
            } else if (UPDATE_PROFILE.equals(action)) {
                url = UPDATE_PROFILE_CONTROLLER;
            } else if (LAST_USER.equals(action)) {
                url = LAST_USER_CONTROLLER;
            }
        } catch (Exception e) {
            log("Error at MainController: " + e.toString());
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
