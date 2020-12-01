package br.senai.sp.backend.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import br.senai.sp.backend.model.Items;

public interface ItemsRepository extends JpaRepository<Items, Long> {

}
