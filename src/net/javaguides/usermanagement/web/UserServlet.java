package net.javaguides.usermanagement.web;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.GenericServlet;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import net.javaguides.usermanagement.bo.BOFactory;
import net.javaguides.usermanagement.bo.SuperBo;
import net.javaguides.usermanagement.bo.custom.PatientBo;
import net.javaguides.usermanagement.dao.UserDAO;
import net.javaguides.usermanagement.model.Patient;
import net.javaguides.usermanagement.model.User;
import net.javaguides.usermanagement.util.GenerateUserID;

/**
 * ControllerServlet.java
 * This servlet acts as a page controller for the application, handling all
 * requests from the user.
 * @email naashnix
 */
@WebServlet(urlPatterns = "/")
public class UserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserDAO userDAO;

	@Resource(name = "java:comp/env/jdbc/pool")
	public  static DataSource dataSource;
	PatientBo patientBo = (PatientBo) BOFactory.getBoFactory().getBo(BOFactory.BOTypes.PATIENT);

	public void init() {
		userDAO = new UserDAO();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
			String action = request.getServletPath();
			switch (action) {
				case "/login" :
					String username = request.getParameter("name");
					String password = request.getParameter("country");
					System.out.println("Username"+username);
					System.out.println("Password"+password);
					// Login checked && Patient Dashboard.jsp return.
					try {
						Patient patient = patientBo.checkLogin(username, password);
						if(patient != null) {
							RequestDispatcher dispatcher = request.getRequestDispatcher("Dashboard.jsp");
							request.setAttribute("user", patient);
							dispatcher.forward(request, response);
						}else {
							RequestDispatcher dispatcher = request.getRequestDispatcher("Login.jsp");
							request.setAttribute("errorMessage","display:block !important;");
							dispatcher.forward(request,response);
						}
					} catch (Exception e) {
						e.printStackTrace();
					}

				case "/newSignUp" :
					String firstName = request.getParameter("firstName");
					String secondName = request.getParameter("secondName");
					String nicNumber = request.getParameter("nicNumber");
					String birthday = request.getParameter("birthday");
					String address = request.getParameter("address");
					String email = request.getParameter("email");
					String signUsername = request.getParameter("username");
					String signPassword = request.getParameter("password");
					GenerateUserID generateUserID = new GenerateUserID();
					Patient newPatient = new Patient(
							generateUserID.generateNewId(),
							firstName,
							signUsername,
							secondName,
							nicNumber,
							signPassword,
							email,
							address,
							birthday
					);

					try {
						patientBo.add(newPatient);
						RequestDispatcher dispatcher = request.getRequestDispatcher("Registered.jsp");
						request.setAttribute("user", firstName);
						dispatcher.forward(request, response);
					} catch (SQLException | ClassNotFoundException throwables) {
						throwables.printStackTrace();
					}finally {
						sighupUser(request,response);
					}
					break;

			}
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getServletPath();

		try {
			switch (action) {
			case "/new":
				showNewForm(request, response);
				break;
			case "/insert":
				insertUser(request, response);
				break;
			case "/delete":
				deleteUser(request, response);
				break;
			case "/edit":
				showEditForm(request, response);
				break;
			case "/update":
				updateUser(request, response);
				break;

			case "/sighup" :
				System.out.println("sing up in switch");
				sighupUser(request,response);
				break;

			default:
				listUser(request, response);
				break;
			}
		} catch (SQLException ex) {
			throw new ServletException(ex);
		}
	}

	private void sighupUser(HttpServletRequest request, HttpServletResponse response) {
		try {
			RequestDispatcher requestDispatcher = request.getRequestDispatcher("Signup.jsp");
			System.out.println("sighupUser Called");
			requestDispatcher.forward(request,response);
		} catch (ServletException | IOException e) {
			e.printStackTrace();
		}
	}

	private void listUser(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException {
		//List<User> listUser = userDAO.selectAllUsers();
		//request.setAttribute("listUser", listUser);
		RequestDispatcher dispatcher = request.getRequestDispatcher("Login.jsp");
		dispatcher.forward(request, response);
	}

	private void showNewForm(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher("Login.jsp");
		dispatcher.forward(request, response);
	}

	private void showEditForm(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		User existingUser = userDAO.selectUser(id);
		RequestDispatcher dispatcher = request.getRequestDispatcher("user-form.jsp");
		request.setAttribute("user", existingUser);
		dispatcher.forward(request, response);

	}

	private void insertUser(HttpServletRequest request, HttpServletResponse response) 
			throws SQLException, IOException {
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String country = request.getParameter("country");
		User newUser = new User(name, email, country);
		userDAO.insertUser(newUser);
		response.sendRedirect("list");
	}

	private void updateUser(HttpServletRequest request, HttpServletResponse response) 
			throws SQLException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String country = request.getParameter("country");

		User book = new User(id, name, email, country);
		userDAO.updateUser(book);
		response.sendRedirect("list");
	}

	private void deleteUser(HttpServletRequest request, HttpServletResponse response) 
			throws SQLException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		userDAO.deleteUser(id);
		response.sendRedirect("list");

	}

}
