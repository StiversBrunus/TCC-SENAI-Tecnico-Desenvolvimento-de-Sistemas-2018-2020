package br.senai.sp.backend.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import br.senai.sp.backend.model.Endereco;

public interface EnderecoRepository extends JpaRepository<Endereco, Long> {

}
