package tw.eeit117.wematch.video;

import java.io.IOException;
import java.lang.reflect.Method;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

@WebServlet("/BaseServlet1.do")
public abstract class BaseServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
	private WebApplicationContext context;

	@Override
	public void init() throws ServletException {
		ServletContext application = getServletContext();
		context = WebApplicationContextUtils.getWebApplicationContext(application);
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		methodInvoke(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		methodInvoke(request, response);
	}

	protected void methodInvoke(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		String action = request.getParameter("action");
		try {
			Method method = this.getClass().getDeclaredMethod(action, HttpServletRequest.class,
					HttpServletResponse.class);
			method.invoke(this, request, response);
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		}
	}

	public WebApplicationContext getContext() {
		return context;
	}

	@Override
	public void destroy() {
		((ConfigurableApplicationContext) getContext()).close();
	}

}

