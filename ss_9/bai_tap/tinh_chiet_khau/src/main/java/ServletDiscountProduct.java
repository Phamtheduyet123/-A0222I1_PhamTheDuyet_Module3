import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "ServletDiscountProduct", urlPatterns = {"/discount"})
public class ServletDiscountProduct extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String productDescription = request.getParameter("describe");
        double listPrice = Double.parseDouble(request.getParameter("price"));
        double discountPercent = Double.parseDouble(request.getParameter("percent"));
        double discountAmount = listPrice*discountPercent*0.01;
        double discountPrice = listPrice - discountAmount;

        RequestDispatcher requestDispatcher = request.getRequestDispatcher("result.jsp");
        // trả kết quả kèm theo
        request.setAttribute("ProductDescription", productDescription);
        request.setAttribute("ListPrice", listPrice);
        request.setAttribute("DiscountPercent", discountPercent);
        request.setAttribute("DiscountAmount", discountAmount);
        request.setAttribute("DiscountPrice", discountPrice);
        requestDispatcher.forward(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
