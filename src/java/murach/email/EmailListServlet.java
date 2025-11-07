package murach.email;

import java.io.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;

import murach.business.User;
import murach.data.UserDB;

public class EmailListServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request,
            HttpServletResponse response) // <-- ĐÃ SỬA LỖI ĐÁNH MÁY
            throws ServletException, IOException {

        String url = "/index.html";

        // get current action
        String action = request.getParameter("action");
        if (action == null) {
            action = "join"; // default action
        }

        // perform action and set URL to appropriate page
        if (action.equals("join")) {
            url = "/index.html"; // the "join" page
        }
        else if (action.equals("add")) {
            // get parameters from the request
            String firstName = request.getParameter("firstName");
            String lastName = request.getParameter("lastName");
            String email = request.getParameter("email");

            // store data in User object and save User object in db
            User user = new User(firstName, lastName, email);
            
            // Chú ý: Phương thức này đang ném ra lỗi "Not supported yet."
            // Bạn cần triển khai logic lưu dữ liệu vào UserDB.
            UserDB.insert(user); 

            // set User object in request object and set URL
            request.setAttribute("user", user);
            url = "/thanks.jsp"; // the "thanks" page
        }

        // forward request and response objects to specified URL
        getServletContext()
            .getRequestDispatcher(url)
            .forward(request, response); // Bỏ cast (ServletResponse)
    }

    protected void doGet(HttpServletRequest request,
            HttpServletResponse response) // <-- ĐÃ SỬA LỖI ĐÁNH MÁY
            throws ServletException, IOException {
        doPost(request, response);
    }
}