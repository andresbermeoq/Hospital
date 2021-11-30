package ec.edu.ups.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import ec.edu.ups.dao.PersonaDAO;
import ec.edu.ups.model.Persona;

/**
 * Servlet Filter implementation class Filtro
 */
@WebFilter({"/Filtro","/CerrarSesionServlet",})
public class Filtro implements Filter {
	
	private PersonaDAO personaDAO;
	private Persona persona;

    /**
     * Default constructor. 
     */
    public Filtro() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		// TODO Auto-generated method stub
				// place your code here
				HttpSession session = ((HttpServletRequest)request).getSession();
				// pass the request along the filter chain
				System.out.println("Session: "+session.getAttribute("persona"));
				if (session.getAttribute("persona")!=null) {
					try {
						Persona utemp = new Persona();
						utemp = (Persona)session.getAttribute("persona");
						//SE BUSCA POR CEDULA
						persona = personaDAO.read(utemp.getCedula());
						
						if(persona.getRol()=="admin") {
							
						}else if (persona.getRol()=="doctor") {
							
						}else if (persona.getRol()=="secretaria") {
							
						}else if (persona.getRol()=="paciente") {
							
						}
						
						chain.doFilter(request, response);
					} catch (Exception e) {
						// TODO: handle exception
						System.out.println("Erro en filtro validando login: "+e.getMessage());
						session.invalidate();
						
						((HttpServletResponse)response).sendRedirect("/index.html");
					}
					
				}else {
					((HttpServletResponse)response).sendRedirect("/index.html");
					
					session.invalidate();
				}

	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
