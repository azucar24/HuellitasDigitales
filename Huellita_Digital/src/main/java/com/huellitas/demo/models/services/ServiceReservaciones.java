package com.huellitas.demo.models.services;

import java.util.List;
import java.util.Optional;

import com.huellitas.demo.entities.Reservaciones;

public interface ServiceReservaciones {
	public List<Reservaciones> findAll();
	public Reservaciones save(Reservaciones entity);
	public Optional<Reservaciones> findById(Long id);
	public void delete(Long id);
}
