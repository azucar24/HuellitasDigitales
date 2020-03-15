package com.huellitas.controller;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.huellitas.entities.Usuarios;
import com.huellitas.models.services.ServiceUsuarios;

@RestController
@RequestMapping("/huellitas")

public class ControllerUsuarios {
	@Autowired
	private ServiceUsuarios ServiceUsuarios;
	
	/*================================== BUSCAR TODOS =============================================*/
	@RequestMapping(value="/usuarios", method = RequestMethod.GET)
		public List<Usuarios> obtenerListas(){
		List<Usuarios> UsuariosID = ServiceUsuarios.findAll();
		return UsuariosID;
	}
	
	/*================================== BUSCAR POR ID ============================================*/
	@RequestMapping(value="/usuarios/{id}", method = RequestMethod.GET)
	public Usuarios obtenerPorId(@PathVariable("id") Long id){
		java.util.Optional<Usuarios> UsuariosID = ServiceUsuarios.findById(id);
		return UsuariosID.get();
	}
	
	/*=================================== AGREGAR ===============================================*/
	@RequestMapping(value="/usuarios", method = RequestMethod.POST)
	public Usuarios guardar(@RequestBody Usuarios usuarios){
	Usuarios NewUsuario = ServiceUsuarios.save(usuarios);
	return NewUsuario;
	}
	
	/*================================== ELIMINAR ===============================================*/
	@RequestMapping(value="/usuarios/{id}", method = RequestMethod.GET)
		public void delete(@PathVariable("id") Long id){
		ServiceUsuarios.delete(id);
	}

}
