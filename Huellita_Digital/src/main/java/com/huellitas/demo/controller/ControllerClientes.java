package com.huellitas.demo.controller;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.huellitas.demo.entities.Clientes;
import com.huellitas.demo.models.services.ServiceClientes;

@RestController
@RequestMapping("/huellitas")
public class ControllerClientes {
	@Autowired
	private ServiceClientes ServiceClientes;
	
	/*================================== BUSCAR TODOS =============================================*/
	@RequestMapping(value="/clientes-all", method = RequestMethod.GET)
		public List<Clientes> obtenerListas(){
		List<Clientes> ClientesID = ServiceClientes.findAll();
		return ClientesID;
	}
	
	/*================================== BUSCAR POR ID ============================================*/
	@RequestMapping(value="/clientes/{id}", method = RequestMethod.GET)
	public Clientes obtenerPorId(@PathVariable("id") Long id){
		Optional<Clientes> ClientesID = ServiceClientes.findById(id);
		return ClientesID.get();
	}
	
	/*=================================== AGREGAR ===============================================*/
	@RequestMapping(value="/clientes-add", method = RequestMethod.POST)
	public Clientes guardar(@RequestBody Clientes clientes){
		Clientes NewUsuario = ServiceClientes.save(clientes);
		return NewUsuario;
	}
	
	/*================================== ELIMINAR ===============================================*/
	@RequestMapping(value="/clientes-delete/{id}", method = RequestMethod.GET)
		public void delete(@PathVariable("id") Long id){
		ServiceClientes.delete(id);
	}

}