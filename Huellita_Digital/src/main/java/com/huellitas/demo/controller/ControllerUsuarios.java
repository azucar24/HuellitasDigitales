package com.huellitas.demo.controller;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.huellitas.demo.entities.Usuarios;
import com.huellitas.demo.models.services.ServiceUsuarios;

@RestController
@RequestMapping("/huellitas/usuarios")

public class ControllerUsuarios {
	@Autowired
	private ServiceUsuarios ServiceUsuarios;
	
	/*================================== BUSCAR TODOS =============================================*/
	@RequestMapping(value="", method = RequestMethod.GET)
		public List<Usuarios> obtenerListas(){
		List<Usuarios> UsuariosID = ServiceUsuarios.findAll();
		return UsuariosID;
	}
	
	/*================================== BUSCAR POR ID ============================================*/
	@RequestMapping(value="{id}", method = RequestMethod.GET)
	public Usuarios obtenerPorId(@PathVariable("id") Long id){
		java.util.Optional<Usuarios> UsuariosID = ServiceUsuarios.findById(id);
		return UsuariosID.get();
	}
	
	/*=================================== AGREGAR ===============================================*/
	@RequestMapping(value="", method = RequestMethod.POST)
	public Usuarios guardar(@RequestBody Usuarios usuarios){
	Usuarios NewUsuario = ServiceUsuarios.save(usuarios);
	return NewUsuario;
	}
	
	/*================================== ELIMINAR ===============================================*/
	@RequestMapping(value="/{id}", method = RequestMethod.DELETE)
		public void delete(@PathVariable("id") Long id){
		ServiceUsuarios.delete(id);
	}

}
