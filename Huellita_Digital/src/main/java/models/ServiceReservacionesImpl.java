package models;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.huellitas.entities.Clientes;
import com.huellitas.entities.Reservaciones;

@Service
public class ServiceReservacionesImpl implements ServiceReservaciones{

	@Autowired
	public repositoryReservaciones repository;

	@Override
	public List<Reservaciones> findAll() {
		return (List<Reservaciones>) repository.findAll();
	}

	@Override
	public Reservaciones save(Reservaciones entity) {
		return repository.save(entity);
	}

	@Override
	public Optional<Reservaciones> findById(Long id) {
		return repository.findById(id);
	}

	@Override
	public void delete(Long id) {
		repository.deleteById(id);
	}
	
}
