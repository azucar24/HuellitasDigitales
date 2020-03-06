package com.huellitas.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Table (name="reservaciones")
public class Reservaciones {
	/*Campos de tabla*/
	
	@Column(name="id", unique=true, length=11)
	private Long id;
	
	@Column(name="reservacion_nombre_resp", length=50, unique = false)
	private String reservacionNombreResp;

	@Column(name="reservacion_fecha", length=10, unique = false)
	private String reservacionFecha;
	
	@Column(name="reservacion_hora", length=8, unique = false)
	private String reservacionHora;
	
	@Column(name="reservacion_telefono_resp", length=8, unique = false)
	private int reservacionTelefonoResp;
	
	@Column(name="reservacion_cant_personas", length=11, unique = false)
	private int reservacionCantPersonas;
	
	@Column(name="reservacion_estado", length=1, unique = false)
	private char reservacionEstado;
	
	@Column(name="reservacion_id_cliente", length=11, unique = false)
	private int reservacionIdCliente;

}
