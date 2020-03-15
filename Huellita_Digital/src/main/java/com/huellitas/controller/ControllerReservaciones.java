package com.huellitas.controller;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.huellitas.entities.Reservaciones;
@RestController
@RequestMapping("huellitas/reservaciones")

public class ControllerReservaciones {
	@Autowired
	private com.huellitas.models.ServiceReservaciones ServiceReservaciones;
	
	/*================================== BUSCAR TODOS =============================================*/
	@RequestMapping(value="/reservaciones", method = RequestMethod.GET)
		public List<Reservaciones> obtenerListas(){
		List<Reservaciones> ReservacionesID = ServiceReservaciones.findAll();
		return ReservacionesID;
	}
	
	/*================================== BUSCAR POR ID ============================================*/
	@RequestMapping(value="/reservaciones/{id}", method = RequestMethod.GET)
	public Reservaciones obtenerPorId(@PathVariable("id") Long id){
		java.util.Optional<Reservaciones> ReservacionesID = ServiceReservaciones.findById(id);
		return ReservacionesID.get();
	}
	
	/*=================================== AGREGAR ===============================================*/
	@RequestMapping(value="/reservaciones", method = RequestMethod.POST)
	public Reservaciones guardar(@RequestBody Reservaciones reservaciones){
	Reservaciones NewReservacion = ServiceReservaciones.save(reservaciones);
	return NewReservacion;
	}
	
	/*================================== ELIMINAR ===============================================*/
	@RequestMapping(value="/reservaciones/{id}", method = RequestMethod.GET)
		public void delete(@PathVariable("id") Long id){
		ServiceReservaciones.delete(id);
	}

}