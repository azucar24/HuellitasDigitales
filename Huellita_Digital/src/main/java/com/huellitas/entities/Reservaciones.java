package com.huellitas.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Table (name="reservaciones")
public class Reservaciones {
	/*Campos de tabla*/
	
	@Column(name="id", unique=true, length=11)
	private int id;
	
	@Column(name="reservacion_nombre_resp", length=50, unique = false)
	private String reservacion_nombre_resp;
	
	@Column(name="reservacion_fecha", length=10, unique = false)
	private String reservacion_fecha;
	
	@Column(name="reservacion_hora", length=8, unique = false)
	private String reservacion_hora;
	
	@Column(name="reservacion_telefono_resp", length=8, unique = false)
	private int reservacion_telefono_resp;
	
	@Column(name="reservacion_cant_personas", length=11, unique = false)
	private int reservacion_cant_personas;
	
	@Column(name="reservacion_estado", length=1, unique = false)
	private char reservacion_estado;
	
	@Column(name="reservacion_id_cliente", length=11, unique = false)
	private int reservacion_id_cliente;

}
