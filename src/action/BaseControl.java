package action;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

/**
 * Servlet implementation class BaseControl
 */
@WebServlet("/BaseControl")
public abstract class BaseControl extends HttpServlet {
	protected Logger logger=Logger.getLogger(getClass());
}
