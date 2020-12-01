package br.senai.sp.backend.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import br.senai.sp.backend.model.Agenda;

public interface AgendaRepository extends JpaRepository<Agenda, Long> {

}
