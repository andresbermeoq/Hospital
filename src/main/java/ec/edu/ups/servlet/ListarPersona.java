package ec.edu.ups.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ec.edu.ups.dao.FactoryDAO;
import ec.edu.ups.dao.PersonaDAO;
import ec.edu.ups.model.Persona;

/**
 * Servlet implementation class Listar
 */
@WebServlet("/ListarPersona")
public class ListarPersona extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ListarPersona() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String cedula=request.getParameter("cedula");
		PersonaDAO personadao=FactoryDAO.getFactoryDAO().getPersonaDAO();
		String url;
		try {
			List<Persona>listarPersona=personadao.find();
			request.setAttribute("Persona", listarPersona);
			
			
			url="/Listar.jsp";
		} catch (Exception e) {
			url="/Listar.jsp";
			System.out.println(e.getMessage());
			// TODO: handle exception
		}
		getServletContext().getRequestDispatcher(url).forward(request,response);

	}

}
