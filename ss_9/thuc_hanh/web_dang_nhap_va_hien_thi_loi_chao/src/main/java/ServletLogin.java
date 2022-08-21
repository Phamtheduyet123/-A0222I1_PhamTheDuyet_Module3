import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "ServletLogin" , urlPatterns = {"/login"})
public class ServletLogin extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String result = "";
    String username = request.getParameter("username");
    String password = request.getParameter("password");
        PrintWriter printWriter = response.getWriter();
        if("admin".equals(username) && "admin".equals(password)){
            result = "Welcome "+ username + " to website";
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("demo/result.jsp");
            request.setAttribute("result",result);
            requestDispatcher.forward(request, response);
            //c2:
           // request.setAttribute("result",result);
            //request.getRequestDispatcher("demo/result.jsp").forward(request,response);
        }
        else {
            result = "Login Error";
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("demo/result.jsp");
            request.setAttribute("result",result);
            requestDispatcher.forward(request, response);
        }
    }
}
