package br.senai.sp.backend.model;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "tbl_contratacao")
public class Contratacao {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	private int amount;
	private int card_number;
	private int card_cvv;
	private int card_expiration_date;
	private String card_holder_name;
	
	@OneToOne
	private Customer customer;

	@OneToOne
	private Billing billing;
	
	@OneToOne
	private Items items;
	
	
	
	public Items getItems() {
		return items;
	}
	public void setItems(Items items) {
		this.items = items;
	}
	public Billing getBilling() {
		return billing;
	}
	public void setBilling(Billing billing) {
		this.billing = billing;
	}
	public Customer getCustomer() {
		return customer;
	}
	public void setCustomer(Customer customer) {
		this.customer = customer;
	}
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public int getCard_number() {
		return card_number;
	}
	public void setCard_number(int card_number) {
		this.card_number = card_number;
	}
	public int getCard_cvv() {
		return card_cvv;
	}
	public void setCard_cvv(int card_cvv) {
		this.card_cvv = card_cvv;
	}
	public int getCard_expiration_date() {
		return card_expiration_date;
	}
	public void setCard_expiration_date(int card_expiration_date) {
		this.card_expiration_date = card_expiration_date;
	}
	public String getCard_holder_name() {
		return card_holder_name;
	}
	public void setCard_holder_name(String card_holder_name) {
		this.card_holder_name = card_holder_name;
	}

	
	
	
}
