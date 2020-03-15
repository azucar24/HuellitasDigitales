package com.huellitas.demo.models.repositorys;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.huellitas.demo.entities.Reservaciones;

@Repository
public interface repositoryReservaciones extends CrudRepository<Reservaciones, Long>{

}
