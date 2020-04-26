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
@Table (name="reservaciones")
public class Reservaciones implements Serializable{
	
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
	private Long reservacionIdCliente;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "reservacion_id_cliente", insertable=false, updatable=false)
	private Clientes clientes;


	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getReservacionNombreResp() {
		return reservacionNombreResp;
	}

	public void setReservacionNombreResp(String reservacionNombreResp) {
		this.reservacionNombreResp = reservacionNombreResp;
	}

	public String getReservacionFecha() {
		return reservacionFecha;
	}

	public void setReservacionFecha(String reservacionFecha) {
		this.reservacionFecha = reservacionFecha;
	}

	public String getReservacionHora() {
		return reservacionHora;
	}

	public void setReservacionHora(String reservacionHora) {
		this.reservacionHora = reservacionHora;
	}

	public int getReservacionTelefonoResp() {
		return reservacionTelefonoResp;
	}

	public void setReservacionTelefonoResp(int reservacionTelefonoResp) {
		this.reservacionTelefonoResp = reservacionTelefonoResp;
	}

	public int getReservacionCantPersonas() {
		return reservacionCantPersonas;
	}

	public void setReservacionCantPersonas(int reservacionCantPersonas) {
		this.reservacionCantPersonas = reservacionCantPersonas;
	}

	public char getReservacionEstado() {
		return reservacionEstado;
	}

	public void setReservacionEstado(char reservacionEstado) {
		this.reservacionEstado = reservacionEstado;
	}


	public Long getReservacionIdCliente() {
		return reservacionIdCliente;
	}

	public void setReservacionIdCliente(Long reservacionIdCliente) {
		this.reservacionIdCliente = reservacionIdCliente;
	}

	
	
	

}
