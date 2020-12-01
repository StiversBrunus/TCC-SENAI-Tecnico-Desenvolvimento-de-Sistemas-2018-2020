package br.senai.sp.backend.dto;

public class PacoteToken {

	private long id;
	private double preco;
	private String descricao;
	private String nome_pacote;
	
	public String getNome_pacote() {
		return nome_pacote;
	}
	public void setNome_pacote(String nome_pacote) {
		this.nome_pacote = nome_pacote;
	}
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	
	public double getPreco() {
		return preco;
	}
	public void setPreco(double preco) {
		this.preco = preco;
	}
	public String getDescricao() {
		return descricao;
	}
	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}
	
	
}
