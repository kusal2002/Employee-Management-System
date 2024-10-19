package com.payroll;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/UpdatePayrollServlet")
public class UpdatePayrollServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // No action needed for GET method in this servlet
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve the updated payroll data from the request
        int payrollID = Integer.parseInt(request.getParameter("payrollID"));
        double basicSalary = Double.parseDouble(request.getParameter("basicSalary"));
        double allowances = Double.parseDouble(request.getParameter("allowances"));
        double deductions = Double.parseDouble(request.getParameter("deductions"));
        double netPay = Double.parseDouble(request.getParameter("netPay"));

        // Update payroll data using the PayrollController
        boolean isUpdated = PayrollController.updatePayrollData(payrollID, basicSalary, allowances, deductions, netPay);

        if (isUpdated) {
            // If the update is successful, retrieve the updated payroll details
            List<PayrollModel> payrollDetails = PayrollController.getPayrollById(payrollID);
            request.setAttribute("payrollDetails", payrollDetails);

            // Display a success message and redirect to the GetAllPayrollServlet
            String alertMessage = "Payroll data update successful";
            response.getWriter().println("<script> alert('" + alertMessage + "'); window.location.href='/Employee_Management_System/gmanager/payrolldisplay.jsp'</script>");
        } else {
            // If the update fails, forward to the error page
            RequestDispatcher dispatcher = request.getRequestDispatcher("error.jsp");
            dispatcher.forward(request, response);
        }
    }
}
