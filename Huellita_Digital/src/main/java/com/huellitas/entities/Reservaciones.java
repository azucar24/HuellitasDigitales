package com.huellitas.entities;

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
@Table (name="reservaciones")
public class Reservaciones implements Serializable{
	/*Campos de tabla*/
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	@Column(name="reservacion_nombre_resp", length=50)
	private String reservacionNombreResp;

	@Column(name="reservacion_fecha", length=10)
	private String reservacionFecha;
	
	@Column(name="reservacion_hora", length=8)
	private String reservacionHora;
	
	@Column(name="reservacion_telefono_resp")
	private int reservacionTelefonoResp;
	
	@Column(name="reservacion_cant_personas")
	private int reservacionCantPersonas;
	
	@Column(name="reservacion_estado", length=1)
	private char reservacionEstado;
	
	@Column(name="reservacion_id_cliente", length=11)
	private int reservacionIdCliente;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "reservacion_id_cliente", nullable=false)
	private Clientes cliente;

}
