package br.senai.sp.backend.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import br.senai.sp.backend.model.Cliente;
import br.senai.sp.backend.model.Contratacao;
import br.senai.sp.backend.model.Portfolio;

public interface ContratacaoRepository extends JpaRepository<Contratacao, Long> {
	@Query(value = "SELECT c FROM Contratacao c WHERE c.card_holder_name LIKE %:card_holder_name%")
	Contratacao findByName(String card_holder_name);

	@Query(value = "select * from tbl_contratacao c where c.id =?1", nativeQuery = true)
	Contratacao findByIdContrato(@Param("id") Long id);
}
