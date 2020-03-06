package models;

import java.util.List;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.huellitas.entities.Usuarios;

@Service
public class ServiceUsuariosImpl implements ServiceUsuarios{

	@Autowired
	public repositoryUsuarios repository;

	@Override
	public List<Usuarios> findAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Usuarios save(Usuarios entity) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Optional<Usuarios> findById(Long id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void delete(Long id) {
		// TODO Auto-generated method stub
		
	}
	
	

}
