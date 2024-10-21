package com.payroll;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/InsertPayrollServlet")
public class InsertPayrollServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve parameters from the request for payroll data
        int employeeID = Integer.parseInt(request.getParameter("employeeID"));
        String payDate = request.getParameter("payDate");
        double basicSalary = Double.parseDouble(request.getParameter("basicSalary"));
        double allowances = Double.parseDouble(request.getParameter("allowances"));
        double deductions = Double.parseDouble(request.getParameter("deductions"));
        double netPay = Double.parseDouble(request.getParameter("netPay"));

        // Flag to check if the insertion was successful
        boolean isInserted = PayrollController.insertPayrollData(employeeID, payDate, basicSalary, allowances, deductions, netPay);

        // Check the insertion status and respond accordingly
        if (isInserted) {
            String alertMessage = "Payroll data insert successful";
            response.getWriter().println("<script> alert('" + alertMessage + "'); window.location.href='/Employee_Management_System/gmanager/payrolldisplay.jsp'</script>");
        } else {
        	String alertMessage = "Data insert failed";
			response.getWriter().println("<script> alert('" + alertMessage
					+ "'); window.location.href='/Employee_Management_System/gmanager/addPayroll.jsp'</script>");
			
        }
    }
}

