 package com.huellitas.demo.models.repositorys;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.huellitas.demo.entities.Clientes;

@Repository
public interface repositoryClientes extends CrudRepository<Clientes, Long>{

}
