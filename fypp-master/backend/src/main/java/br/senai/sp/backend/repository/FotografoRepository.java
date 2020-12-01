package br.senai.sp.backend.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import br.senai.sp.backend.model.Fotografo;

public interface FotografoRepository extends JpaRepository<Fotografo, Long> {

	@Query(value = "SELECT f FROM Fotografo f WHERE f.nome LIKE %:nome%")
	List<Fotografo> findByLikeNome(@Param("nome") String nome);
	
	@Query(value = "SELECT f FROM Fotografo f WHERE f.cpf LIKE %:cpf%")
	String findByCPF(String cpf);
	
	@Query(value = "SELECT f FROM Fotografo f WHERE f.email LIKE %:email%")
	Fotografo findByEmail(String email);
	
	@Query(value = "select * from tbl_fotografo f inner join tbl_fotografo_especialidades fe on f.id= fe.fotografo_id \r\n" + 
			"inner join tbl_especialidades e on fe.especialidades_id =?1 and fe.especialidades_id = e.id", 
			nativeQuery = true)
	List<Fotografo> findByEspecialidade(@Param("especialidades_id") Long id);

	
}
