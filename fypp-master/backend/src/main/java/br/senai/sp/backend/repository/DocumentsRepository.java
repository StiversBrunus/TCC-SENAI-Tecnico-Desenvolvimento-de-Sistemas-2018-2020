package br.senai.sp.backend.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import br.senai.sp.backend.model.Documents;

public interface DocumentsRepository extends JpaRepository<Documents, Long> {

}
