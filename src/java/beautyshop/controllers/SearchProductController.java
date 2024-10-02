/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package beautyshop.controllers;

import beautyshop.model.ProductDAO;
import beautyshop.model.ProductDTO;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author LeHoangTrong
 */
@WebServlet(name = "SearchProductController", urlPatterns = {"/SearchProductController"})
public class SearchProductController extends HttpServlet {

    private static final String ERROR = "shopping.jsp";
    private static final String SUCCESS = "shopping.jsp";
    private static final String INDEX = "all";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        String url = ERROR;
        try {
            String searchProduct = request.getParameter("searchProduct");
            String paramIndex = request.getParameter("index");
            if (INDEX.equals(paramIndex) || paramIndex.length() == 0) {
                ProductDAO dao = new ProductDAO();
                List<ProductDTO> list = dao.getListProduct(searchProduct);
                if (list.size() > 0) {
                    url = request.getParameter("success");
                    request.setAttribute("LIST_PRODUCT", list);
                }
            } else {
                int index = Integer.parseInt(paramIndex);
                index = (index == 0) ? 1 : index;

                ProductDAO dao = new ProductDAO();
                int count = dao.searchCount(searchProduct);
                if (count > 0) {
                    int pageSize = 12;
                    int endPage = count / pageSize;
                    if (count % pageSize != 0) {
                        endPage++;
                    }
                    request.setAttribute("LIST_PRODUCT_COUNT", endPage);
                    int left = index * pageSize - (pageSize - 1);
                    int right = index * pageSize;
                    List<ProductDTO> list = dao.search(searchProduct, left, right);
                    if (list.size() > 0) {
                        url = request.getParameter("success");
                        request.setAttribute("LIST_PRODUCT", list);
                        request.setAttribute("CURRENT_PAGE", index);
                    }
                }
            }

        } catch (Exception e) {
            log("Error at SearchProductController: " + e.toString());
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
