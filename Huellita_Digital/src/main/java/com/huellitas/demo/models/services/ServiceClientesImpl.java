package com.huellitas.demo.models.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.huellitas.demo.entities.Clientes;
import com.huellitas.demo.entities.Usuarios;
import com.huellitas.demo.models.repositorys.repositoryClientes;

@Service
public class ServiceClientesImpl implements ServiceClientes{

	@Autowired
	public repositoryClientes repository;

	@Override
	public List<Clientes> findAll() {
		return (List<Clientes>) repository.findAll();
	}

	@Override
	public Clientes save(Clientes entity) {
		return repository.save(entity);
	}

	@Override
	public Optional<Clientes> findById(Long id) {
		return repository.findById(id);
	}

	@Override
	public void delete(Long id) {
		repository.deleteById(id);
	}
	
}
