/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tramnbp.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import tramnbp.product.ProductDAO;
import tramnbp.product.ProductDTO;
import tramnbp.shopping.Cart;
import tramnbp.shopping.OrderDAO;
import tramnbp.shopping.OrderDTO;
import tramnbp.shopping.OrderDetailsDAO;
import tramnbp.user.UserDTO;

/**
 *
 * @author ACER
 */
@WebServlet(name = "PaymentController", urlPatterns = {"/PaymentController"})
public class PaymentController extends HttpServlet {

    private static final String ERROR = "checkout-error.jsp";
    private static final String SUCCESS = "payment-success.jsp";
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            HttpSession session = request.getSession();
            //user informaion
            UserDTO loginUser = (UserDTO)session.getAttribute("LOGIN_USER");
            String userID = loginUser.getUserID();
            //-------------
            
            //order information
            double total = (double) session.getAttribute("TOTAL");
            Date orderDate = new Date();
            Cart cart = (Cart) session.getAttribute("CART");
            OrderDTO newOrder = new OrderDTO(userID, orderDate, total);
            OrderDAO oDao = new OrderDAO();
            ProductDAO pDao = new ProductDAO();
            int lastInsertID = oDao.addOrder(newOrder);
            boolean checkInsert = false;
            boolean checkUpdateQuantity = false;
            if (lastInsertID > 0) {
                OrderDetailsDAO oDao2 = new OrderDetailsDAO();
                if (cart != null){
                    for (ProductDTO product : cart.getCart().values()) {
                        checkInsert = oDao2.insert(product, lastInsertID);
                        checkUpdateQuantity = pDao.updateQuantity(product);
                    }
                }
            }
            if (checkInsert && checkUpdateQuantity){
                request.setAttribute("ORDER", newOrder);
                url = SUCCESS;
            }
            //-------------
        } catch (Exception e){
            log("Error at PaymentController: " + e.toString());
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
            HttpSession session = request.getSession();
            session.setAttribute("CART", null);
            session.setAttribute("TOTAL", null);
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
