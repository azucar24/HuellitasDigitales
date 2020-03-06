package models;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.huellitas.entities.Usuarios;

@Repository
public interface repositoryUsuarios extends CrudRepository<Usuarios, Long> {
	
}
