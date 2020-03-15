 package com.huellitas.models;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.huellitas.entities.Clientes;

@Repository
public interface repositoryClientes extends CrudRepository<Clientes, Long>{

}
