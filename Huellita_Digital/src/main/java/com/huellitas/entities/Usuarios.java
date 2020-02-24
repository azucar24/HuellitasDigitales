package com.huellitas.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Table (name="usuarios")
public class Usuarios {
	/*todos los atributos de la tabla como campos van aca.*/
	
	@Column(name="id", unique=true, length=11)
	private int id;
	
	@Column(name="usuario_nombre", length=50, unique = false)
	private String usuario_nombre;
	
	@Column(name="usuario_correo", length=50, unique = false)
	private String usuario_correo;
	
	@Column(name="usuario_user", length=15, unique = false)
	private String usuario_user;
	
	@Column(name="usuario_clave", length=15, unique = false)
	private String usuario_clave;
	
	@Column(name="usuario_telefono", length=8, unique = false)
	private int usuario_telefono;
	
	@Column(name="usuario_sexo", length=1, unique = false)
	private char usuario_sexo;
	
	@Column(name="usuario_rol", length=8, unique = false)
	private String usuario_rol;
	
}
