package com.huellitas.demo.entities;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table (name="usuarios")
public class Usuarios implements Serializable{
	/*todos los atributos de la tabla como campos van aca.*/
	
	private static final long serialVersionUID = 1L;

	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	@Column(name="usuario_nombre", length=50)
	private String usuarioNombre;
	
	@Column(name="usuario_correo", length=50)
	private String usuarioCorreo;
	
	@Column(name="usuario_user", length=15)
	private String usuarioUser;
	
	@Column(name="usuario_clave", length=15)
	private String usuarioClave;
	
	@Column(name="usuario_telefono", length=8)
	private int usuarioTelefono;
	
	@Column(name="usuario_sexo", length=1)
	private char usuarioSexo;
	
	@Column(name="usuario_rol", length=8)
	private String usuarioRol;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getUsuarioNombre() {
		return usuarioNombre;
	}

	public void setUsuarioNombre(String usuarioNombre) {
		this.usuarioNombre = usuarioNombre;
	}

	public String getUsuarioCorreo() {
		return usuarioCorreo;
	}

	public void setUsuarioCorreo(String usuarioCorreo) {
		this.usuarioCorreo = usuarioCorreo;
	}

	public String getUsuarioUser() {
		return usuarioUser;
	}

	public void setUsuarioUser(String usuarioUser) {
		this.usuarioUser = usuarioUser;
	}

	public String getUsuarioClave() {
		return usuarioClave;
	}

	public void setUsuarioClave(String usuarioClave) {
		this.usuarioClave = usuarioClave;
	}

	public int getUsuarioTelefono() {
		return usuarioTelefono;
	}

	public void setUsuarioTelefono(int usuarioTelefono) {
		this.usuarioTelefono = usuarioTelefono;
	}

	public char getUsuarioSexo() {
		return usuarioSexo;
	}

	public void setUsuarioSexo(char usuarioSexo) {
		this.usuarioSexo = usuarioSexo;
	}

	public String getUsuarioRol() {
		return usuarioRol;
	}

	public void setUsuarioRol(String usuarioRol) {
		this.usuarioRol = usuarioRol;
	}
	
	
	
}
