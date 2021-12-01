package ec.edu.ups.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import ec.edu.ups.dao.FactoryDAO;
import ec.edu.ups.dao.PersonaDAO;
import ec.edu.ups.model.Persona;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private PersonaDAO personaDAO;
	private List<Persona>listaPersonas;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        personaDAO = FactoryDAO.getFactoryDAO().getPersonaDAO();
        listaPersonas = personaDAO.find();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		RequestDispatcher rd = request.getRequestDispatcher("index.html");
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println(personaDAO.find());
		
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String url = null;
		HttpSession session = request.getSession(true);
		
		listaPersonas = personaDAO.find();
		System.out.println(email);
		System.out.println(password);
		
		for (Persona persona : listaPersonas) {
			
			if (persona.getPassword().equals(password) && persona.getCorreo().equals(email)) {
				System.out.println("Paciente encontrado: " + persona.toString());
				session.setAttribute("persona", persona);
				getServletContext().getRequestDispatcher("/admin/index.jsp").forward(request, response);
			} else {
				url = "/Public/error.jsp";
			}
		}
		
		request.getRequestDispatcher(url).forward(request, response);
		
	}

}
