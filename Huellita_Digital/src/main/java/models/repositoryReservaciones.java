package models;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.huellitas.entities.Reservaciones;

@Repository
public interface repositoryReservaciones extends CrudRepository<Reservaciones, Long>{

}
