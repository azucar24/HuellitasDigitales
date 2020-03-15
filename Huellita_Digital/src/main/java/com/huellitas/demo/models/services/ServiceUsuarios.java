package com.huellitas.demo.models.services;

import java.util.List;
import java.util.Optional;

import com.huellitas.demo.entities.Usuarios;

public interface ServiceUsuarios {
	public List<Usuarios> findAll();
	public Usuarios save(Usuarios entity);
	public Optional<Usuarios> findById(Long id);
	public void delete(Long id);
}
