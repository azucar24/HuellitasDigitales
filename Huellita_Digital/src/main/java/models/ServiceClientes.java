package models;

import java.util.List;
import java.util.Optional;

import com.huellitas.entities.Clientes;

public interface ServiceClientes {
	public List<Clientes> findAll();
	public Clientes save(Clientes entity);
	public Optional<Clientes> findById(Long id);
	public void delete(Long id);
}
