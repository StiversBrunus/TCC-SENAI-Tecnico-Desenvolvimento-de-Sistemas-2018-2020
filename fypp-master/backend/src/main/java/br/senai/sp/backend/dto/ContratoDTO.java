package br.senai.sp.backend.dto;

import java.util.ArrayList;

import br.senai.sp.backend.model.Customer;

public class ContratoDTO {

	private Long id_contrato;
	private int amount;
	private int card_number;
	private int card_cvv;
	private int card_expiration_date;
	private String card_holder_name;
	private int external_id;
	private String name;
	private String  type;
	private String  country;
	private String  email;
	private String documents_type;
	private String number;
	private String billing_name;
	private String address_country;
	private String state;
	private String city;
	private String neighborhood;
	private String street;
	private int zipcode;
	private String id;
	private String title;
	private int unit_price;
	private int quantity;
	private boolean tangible;
	
	
	
	public Long getId_contrato() {
		return id_contrato;
	}
	public void setId_contrato(Long id_contrato) {
		this.id_contrato = id_contrato;
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
	public int getExternal_id() {
		return external_id;
	}
	public void setExternal_id(int external_id) {
		this.external_id = external_id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getCountry() {
		return country;
	}
	public void setCountry(String country) {
		this.country = country;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getDocuments_type() {
		return documents_type;
	}
	public void setDocuments_type(String documents_type) {
		this.documents_type = documents_type;
	}
	public String getNumber() {
		return number;
	}
	public void setNumber(String number) {
		this.number = number;
	}
	public String getBilling_name() {
		return billing_name;
	}
	public void setBilling_name(String billing_name) {
		this.billing_name = billing_name;
	}
	public String getAddress_country() {
		return address_country;
	}
	public void setAddress_country(String address_country) {
		this.address_country = address_country;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getNeighborhood() {
		return neighborhood;
	}
	public void setNeighborhood(String neighborhood) {
		this.neighborhood = neighborhood;
	}
	public String getStreet() {
		return street;
	}
	public void setStreet(String street) {
		this.street = street;
	}
	public int getZipcode() {
		return zipcode;
	}
	public void setZipcode(int zipcode) {
		this.zipcode = zipcode;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public int getUnit_price() {
		return unit_price;
	}
	public void setUnit_price(int unit_price) {
		this.unit_price = unit_price;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public boolean isTangible() {
		return tangible;
	}
	public void setTangible(boolean tangible) {
		this.tangible = tangible;
	}

	
	
	
	
	
	
}
