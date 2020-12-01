package br.senai.sp.backend.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "tbl_items")
public class Items {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long items_id;
	
	private String id;
	private String title;
	private int unit_price;
	private int quantity;
	private boolean tangible;
	
	
	public Long getItems_id() {
		return items_id;
	}
	public void setItems_id(Long items_id) {
		this.items_id = items_id;
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
