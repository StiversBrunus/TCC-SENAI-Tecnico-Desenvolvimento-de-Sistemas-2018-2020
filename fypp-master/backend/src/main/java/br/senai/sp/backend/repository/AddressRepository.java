package br.senai.sp.backend.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import br.senai.sp.backend.model.Address;

public interface AddressRepository extends JpaRepository<Address, Long>{

}
