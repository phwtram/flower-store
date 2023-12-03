/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tramnbp.controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ACER
 */
public class MainController extends HttpServlet {
    private static final String LOGIN_PAGE="login.html";
    private static final String LOGIN="Login";
    private static final String LOGIN_CONTROLLER="LoginController";
     private static final String LOGOUT="Logout";
    private static final String LOGOUT_CONTROLLER="LogoutController";
    private static final String SEARCH="Search";
    private static final String SEARCH_CONTROLLER="SearchController";
    private static final String UPDATE="Update";
    private static final String UPDATE_CONTROLLER="UpdateController";
    private static final String DELETE="Delete";
    private static final String DELETE_CONTROLLER="DeleteController";
    private static final String CREATE="Create";
    private static final String CREATE_CONTROLLER="CreateController";
    private static final String SHOPPING="Shopping";
    private static final String SHOPPING_CONTROLLER="ShoppingController";
    private static final String ADD_TO_CART="Addtocart";
    private static final String ADD_TO_CART_CONTROLLER="AddtocartController";
    private static final String VIEW_CART="Viewcart";
    private static final String VIEW_CART_PAGE="viewcart.jsp";
    private static final String REMOVE="Remove";
    private static final String REMOVE_CONTROLLER="RemoveController";
    private static final String EDIT="Edit";
    private static final String EDIT_CONTROLLER="EditController";
    private static final String CHECKOUT="Checkout";
    private static final String CHECKOUT_CONTROLLER="CheckoutController";
    private static final String PAYMENT="Payment";
    private static final String PAYMENT_CONTROLLER="PaymentController";
    private static final String TEST="Test.jsp";
    private static final String TEST_CONTROLLER="TestController";
    
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url=LOGIN_PAGE;
        try{
            String action=request.getParameter("action");
            if(action==null){
                url=LOGIN_PAGE;
            }
            else if (LOGIN.equals(action)){
                url = LOGIN_CONTROLLER;
            }
            else if (LOGOUT.equals(action)){
                url = LOGOUT_CONTROLLER;
            }
             else if (SEARCH.equals(action)){
                url = SEARCH_CONTROLLER;
             }
             else if (UPDATE.equals(action)){
                url = UPDATE_CONTROLLER;
             }
             else if (DELETE.equals(action)){
                url = DELETE_CONTROLLER;
             }
             else if (CREATE.equals(action)){
                url = CREATE_CONTROLLER;
             }
            else if (SHOPPING.equals(action)){
                url = SHOPPING_CONTROLLER;
             }
             else if (ADD_TO_CART.equals(action)){
                url = ADD_TO_CART_CONTROLLER;
             }
            else if (VIEW_CART.equals(action)){
                url = VIEW_CART_PAGE;
             }
            else if(REMOVE.equals(action)){
                url=REMOVE_CONTROLLER;
            }
            else if(EDIT.equals(action)){
                url=EDIT_CONTROLLER;
            }
            else if(CHECKOUT.equals(action)){
                url=CHECKOUT_CONTROLLER;
            }
            else if(TEST.equals(action)){
                url=TEST_CONTROLLER;
            }
            else if(PAYMENT.equals(action)){
                url=PAYMENT_CONTROLLER;
            }
        }catch (Exception e){
            log("Error at MainController:"+e.toString());
        }finally{
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
