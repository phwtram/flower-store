/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tramnbp.controller;

import java.io.IOException;
import java.io.PrintWriter;
import static javax.servlet.DispatcherType.ERROR;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import static jdk.nashorn.tools.Shell.SUCCESS;
import tramnbp.user.UserDAO;
import tramnbp.user.UserDTO;

/**
 *
 * @author ACER
 */
@WebServlet(name = "TestController", urlPatterns = {"/TestController"})
public class TestController extends HttpServlet {

   private static final String ERROR = "test.jsp";
   private static final String SUCCESS = "test.jsp";
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
       String SUCCESS = "test.jsp";
        String url = ERROR;
        try {
            UserDAO dao = new UserDAO();
            UserDTO testUser = dao.setTestUser();
            if (testUser != null){
                request.setAttribute("TEST", testUser);
                url = SUCCESS;
            } else {
                request.setAttribute("MESSAGE", "Not found.");
            }
        } catch (Exception e) {
            log("Error at TestController: " + e.toString());
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
