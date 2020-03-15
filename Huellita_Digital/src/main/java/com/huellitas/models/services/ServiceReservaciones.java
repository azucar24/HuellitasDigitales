package com.huellitas.models.services;

import java.util.List;
import java.util.Optional;

import com.huellitas.entities.Reservaciones;

public interface ServiceReservaciones {
	public List<Reservaciones> findAll();
	public Reservaciones save(Reservaciones entity);
	public Optional<Reservaciones> findById(Long id);
	public void delete(Long id);
}
