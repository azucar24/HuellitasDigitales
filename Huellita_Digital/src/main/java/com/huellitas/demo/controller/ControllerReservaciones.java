package com.huellitas.demo.controller;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.huellitas.demo.entities.Reservaciones;
import com.huellitas.demo.models.services.ServiceReservaciones;

@RestController
@RequestMapping("/huellitas/reservaciones")
public class ControllerReservaciones {
	@Autowired
	private ServiceReservaciones ServiceReservaciones;
	
	/*================================== BUSCAR TODOS =============================================*/
	@RequestMapping(value="", method = RequestMethod.GET)
		public List<Reservaciones> obtenerListas(){
		List<Reservaciones> ReservacionesID = ServiceReservaciones.findAll();
		return ReservacionesID;
	}
	
	/*================================== BUSCAR POR ID ============================================*/
	@RequestMapping(value="/{id}", method = RequestMethod.GET)
	public Reservaciones obtenerPorId(@PathVariable("id") Long id){
		java.util.Optional<Reservaciones> ReservacionesID = ServiceReservaciones.findById(id);
		return ReservacionesID.get();
	}
	
	/*=================================== AGREGAR ===============================================*/
	@RequestMapping(value="", method = RequestMethod.POST)
	public Reservaciones guardar(@RequestBody Reservaciones reservaciones){
	Reservaciones NewReservacion = ServiceReservaciones.save(reservaciones);
	return NewReservacion;
	}
	
	/*================================== ELIMINAR ===============================================*/
	@RequestMapping(value="/{id}", method = RequestMethod.DELETE)
		public void delete(@PathVariable("id") Long id){
		ServiceReservaciones.delete(id);
	}

}