package com.huellitas.demo.entities;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table (name="clientes")
public class Clientes implements Serializable{
	/*Campos*/
	
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	@Column(name="cliente_nombre", length=50)
	private String clienteNombre;
	
	@Column(name="cliente_correo", length=50)
	private String clienteCorreo;
	
	@Column(name="cliente_user", length=15)
	private String clienteUser;
	
	@Column(name="cliente_clave", length=15)
	private String clienteClave;
	
	@Column(name="cliente_telefono", length=8)
	private int clienteTelefono;
	
	@Column(name="cliente_sexo", length=1)
	private char clienteSexo;
	
}
