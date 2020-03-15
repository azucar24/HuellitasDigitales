package com.huellitas.demo.models.repositorys;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.huellitas.demo.entities.Usuarios;

@Repository
public interface repositoryUsuarios extends CrudRepository<Usuarios, Long> {
	
}
