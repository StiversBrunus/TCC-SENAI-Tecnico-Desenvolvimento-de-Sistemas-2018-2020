package br.senai.sp.backend.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import br.senai.sp.backend.model.Cliente;

public interface ClienteRepository extends JpaRepository<Cliente, Long>  {
	@Query(value = "SELECT c FROM Cliente c WHERE c.email LIKE %:email%")
	Cliente findByEmail(String email);

	
}
