package com.payroll;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/GetAllPayrollServlet")
public class GetAllPayrollServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve all payroll data from the PayrollController
        List<PayrollModel> allPayrolls = PayrollController.getAllPayrolls();
        // Set the payroll data as a request attribute to be accessed in the JSP
        request.setAttribute("allPayrolls", allPayrolls);

        // Forward the request to the JSP page for display
        RequestDispatcher dispatcher = request.getRequestDispatcher("displayPayroll.jsp");
        dispatcher.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
