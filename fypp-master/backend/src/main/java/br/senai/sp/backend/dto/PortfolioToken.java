package br.senai.sp.backend.dto;

public class PortfolioToken {
	
	private Long id;
	private String nome;
	private Long id_fotografo;
	private String descricao;
	
	
	
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
	public Long getId_fotografo() {
		return id_fotografo;
	}
	public void setId_fotografo(Long id_fotografo) {
		this.id_fotografo = id_fotografo;
	}
	
	
}
