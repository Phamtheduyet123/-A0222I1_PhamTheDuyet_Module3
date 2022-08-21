import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "helloServlet" ,urlPatterns ={"/hello","/xin-chao"})
public class helloServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // gửi bằng method post => vào doPost
        // Có 1 cách : submit form bằng method=post
        PrintWriter printWriter = response.getWriter();
        printWriter.println("<h1>Do post</h1>");

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // gử bằng metho get => vào doGet
        // Để tạo method get :
        //+ 1. gõ trên thanh trình duyệt
        // + 2. click vào đường link (thẻ a)
        // + 3. submit form vơi method =get

        int n1 = Integer.parseInt(request.getParameter("num1"));
        int n2 = Integer.parseInt(request.getParameter("num2"));
        int sum = n1+n2;
        // cách 1 (không được dùng):
//        PrintWriter printWriter = response.getWriter();
//        printWriter.println("<h1>Do get</h1>");
//        printWriter.println("<h1> ket qua la: "+sum+"</h1>");
        // cách 2:
        // trả về trang result.jsp
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("result.jsp");
        // trả kết quả kèm theo
        request.setAttribute("ketQua",sum);
        requestDispatcher.forward(request,response);

    }
    @Override
    public void init() throws ServletException {
        System.out.println("ham init dc chay");
    }

    @Override
    public void destroy() {
        System.out.println("ham destroy dc chay");

    }
}
