package com.huellitas.controller;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.huellitas.entities.Clientes;


@RestController
@RequestMapping("huellitas/clientes")
public class ControllerClientes {
	@Autowired
	private com.huellitas.models.ServiceClientes ServiceClientes;
	
	@RequestMapping(value="/clientes", method = RequestMethod.GET)
		public List<Clientes> obtenerListas(){
		List<Clientes> ClienteID = ServiceClientes.findAll();
		return ClienteID;
	}
	
	/*================================== BUSCAR POR ID ============================================*/
	@RequestMapping(value="/clientes/{id}", method = RequestMethod.GET)
	public Clientes obtenerPorId(@PathVariable("id") Long id){
		java.util.Optional<Clientes> ClienteID = ServiceClientes.findById(id);
		return ClienteID.get();
	}
	
	/*=================================== AGREGAR ===============================================*/
	@RequestMapping(value="/clientes", method = RequestMethod.POST)
		public Clientes guardar(@RequestBody Clientes creditLine){
		Clientes NewCliente = ServiceClientes.save(creditLine);
		return NewCliente;
	}
	
	/*================================== ELIMINAR ===============================================*/
	@RequestMapping(value="/clientes/{id}", method = RequestMethod.GET)
		public void delete(@PathVariable("id") Long id){
		ServiceClientes.delete(id);
	}

}
