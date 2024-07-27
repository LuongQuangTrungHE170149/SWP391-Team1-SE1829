/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Model.Promotion;
import Model.User;
import dal.PromotionDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;

/**
 *
 * @author thuhu
 */
public class PromotionManagerServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        final String loginFirst = "Bạn cần phải đăng nhập trước!";
        final String error = "Bạn không có quyền truy cập trang web này!";
        HttpSession session = request.getSession();
        User u = (User) session.getAttribute("user");

        //check
        if (u == null) {
            request.setAttribute("loginFirst", loginFirst);
            request.getRequestDispatcher("error").forward(request, response);
        } //neu da dang nhap => check role
        else {
            if (u.getRole().equalsIgnoreCase("user")) {
                request.setAttribute("error", error);
                request.getRequestDispatcher("error").forward(request, response);
            } //staff, manager true =>>
            else {
                PromotionDAO pdb = new PromotionDAO();
                List<Promotion> listAll;

                List<Object[]> listStaffAddPromotion = pdb.listStaffAddPromotion();

                //un/setHeader
                String unset = request.getParameter("unset");
                if (unset != null) {
                    pdb.setIsHeaderToFalse();
                }
                String setHeaderAtIdParam = request.getParameter("setHeaderAtId");
                if (setHeaderAtIdParam != null) {
                    int setHeaderAtId = Integer.parseInt(setHeaderAtIdParam);
                    pdb.setIsHeaderToFalse();
                    pdb.setIsHeaderToTrueById(Boolean.TRUE, setHeaderAtId);
                }

                //search
                String selectedStaff = request.getParameter("selectedStaff");
                String searchValue = request.getParameter("searchValue");
                listAll = pdb.searchPromotion(searchValue, selectedStaff);

                try {
                    String getHeader = request.getParameter("getHeader");
                    if (getHeader.equals("true")) {
                        if (!pdb.getHeader().isEmpty()) {
                            listAll = pdb.getHeader();
                        }else{
                            request.setAttribute("invalidHeader", "Bạn chưa chọn header!");
                        }
                    }
                } catch (Exception e) {
                    System.out.println(e);
                }

//                 
                //for pagination
                int page = 1;
                int recordPerPage = 20;
                if (request.getParameter("page") != null) {
                    page = Integer.parseInt(request.getParameter("page"));
                }
                int start = (page - 1) * recordPerPage;
                int end = Math.min(start + recordPerPage, listAll.size());

                List<Promotion> listForPage = listAll.subList(start, end);
                int numberOfPages = (int) Math.ceil(listAll.size() * 1.0 / recordPerPage);

                request.setAttribute("selectedStaff", selectedStaff);
                request.setAttribute("totalPromotion", listAll.size());
                request.setAttribute("listAll", listForPage);
                request.setAttribute("numberOfPages", numberOfPages);
                request.setAttribute("currentPage", page);
                request.setAttribute("searchValue", searchValue);
                request.setAttribute("listStaffAddPromotion", listStaffAddPromotion);
                session.setAttribute("totalPromotion", pdb.getAll().size());
                request.getRequestDispatcher("promotionManager.jsp").forward(request, response);
            }
        }
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
