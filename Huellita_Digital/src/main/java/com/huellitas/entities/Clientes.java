package com.huellitas.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Table (name="clientes")
public class Clientes {
	/*Campos*/
	
	@Column(name="id", unique=true, length=11)
	private int id;
	
	@Column(name="cliente_nombre", length=50, unique = false)
	private String clienteNombre;
	
	@Column(name="cliente_correo", length=50, unique = false)
	private String cliente_correo;
	
	@Column(name="cliente_user", length=15, unique = false)
	private String cliente_user;
	
	@Column(name="cliente_clave", length=15, unique = false)
	private String cliente_clave;
	
	@Column(name="cliente_telefono", length=8, unique = false)
	private int cliente_telefono;
	
	@Column(name="cliente_sexo", length=1, unique = false)
	private char cliente_sexo;
	
}
