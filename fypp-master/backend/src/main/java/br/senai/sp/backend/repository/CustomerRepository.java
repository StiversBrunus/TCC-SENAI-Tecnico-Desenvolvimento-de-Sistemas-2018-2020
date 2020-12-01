package br.senai.sp.backend.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import br.senai.sp.backend.model.Customer;

public interface CustomerRepository extends JpaRepository<Customer, Long> {

}
