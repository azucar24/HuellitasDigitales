package models;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.huellitas.entities.Clientes;

@Service
public class ServiceClientesImpl implements ServiceClientes{

	@Autowired
	public repositoryClientes repository;
	
	@Override
	public List<Clientes> findAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Clientes save(Clientes entity) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Optional<Clientes> findById(Long id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void delete(Long id) {
		// TODO Auto-generated method stub
		
	}
	
}
