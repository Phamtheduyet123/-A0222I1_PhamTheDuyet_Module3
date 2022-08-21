import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "ServletCaculator", urlPatterns = {"/hello"})
public class ServletCaculator extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        float number1 = Float.parseFloat(request.getParameter("number"));
        float number2 = Float.parseFloat(request.getParameter("second"));
        String calculation = request.getParameter("operator");
        String result = "";
        if(calculation.equals("+")){
            result = number1 + "+" + number2 +"="+(number1+number2);
        }
        if(calculation.equals("-")){
            result = number1 + "-" + number2 +"="+(number1-number2);
        }
        if(calculation.equals("*")){
            result = number1 + "*" + number2 +"="+(number1*number2);
        }
        if(calculation.equals("/")){
            result = number1 + "/" + number2 +"="+(number1/number2);
        }
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("hello.jsp");
        request.setAttribute("ketqua", result);
        requestDispatcher.forward(request,response);
    }
}
