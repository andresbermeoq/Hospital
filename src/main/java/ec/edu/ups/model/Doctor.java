package ec.edu.ups.model;

import java.io.Serializable;

public class Doctor implements Serializable{
	

	private static final long serialVersionUID = 1L;
	
	private int idDoctor;
	private Persona idPersona;
	private String Password;
	
	
	
	
	public Doctor(int idDoctor, Persona idPersona, String password) {
		super();
		this.idDoctor = idDoctor;
		this.idPersona = idPersona;
		Password = password;
	}
	
	
	public int getIdDoctor() {
		return idDoctor;
	}
	public void setIdDoctor(int idDoctor) {
		this.idDoctor = idDoctor;
	}
	public Persona getIdPersona() {
		return idPersona;
	}
	public void setIdPersona(Persona idPersona) {
		this.idPersona = idPersona;
	}
	public String getPassword() {
		return Password;
	}
	public void setPassword(String password) {
		Password = password;
	}


	@Override
	public String toString() {
		return "Doctor [idDoctor=" + idDoctor + ", idPersona=" + idPersona + ", Password=" + Password + "]";
	}
	
	

}
