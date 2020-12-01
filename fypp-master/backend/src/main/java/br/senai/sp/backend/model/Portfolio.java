package br.senai.sp.backend.model;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "tbl_portfolio")
public class Portfolio {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	private String nome;
	private String descricao;
	private Long id_fotografo;
	
	@OneToMany
	private List<FotoPortfolio> fotoPortfolios;

	public String getDescricao() {
		return descricao;
	}

	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public List<FotoPortfolio> getFotoPortfolios() {
		return fotoPortfolios;
	}

	public void setFotoPortfolios(List<FotoPortfolio> fotoPortfolios) {
		this.fotoPortfolios = fotoPortfolios;
	}

	public Long getId_fotografo() {
		return id_fotografo;
	}

	public void setId_fotografo(Long id_fotografo) {
		this.id_fotografo = id_fotografo;
	}
}
