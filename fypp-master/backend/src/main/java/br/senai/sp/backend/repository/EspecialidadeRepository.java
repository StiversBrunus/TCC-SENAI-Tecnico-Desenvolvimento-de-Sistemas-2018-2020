package br.senai.sp.backend.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import br.senai.sp.backend.model.Especialidades;

public interface EspecialidadeRepository extends JpaRepository<Especialidades, Long> {
	
	
}