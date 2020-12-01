package br.senai.sp.backend.dto;

public class AvaliacaoDTO {
	
	private Long id_avaliacao;
	private Long valor;
	private String descricao;
	private Long id_fotografo;
	private Long id_cliente;
	
	public Long getId_avaliacao() {
		return id_avaliacao;
	}
	public void setId_avaliacao(Long id_avaliacao) {
		this.id_avaliacao = id_avaliacao;
	}
	public Long getValor() {
		return valor;
	}
	public void setValor(Long valor) {
		this.valor = valor;
	}
	public String getDescricao() {
		return descricao;
	}
	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}
	public Long getId_fotografo() {
		return id_fotografo;
	}
	public void setId_fotografo(Long id_fotografo) {
		this.id_fotografo = id_fotografo;
	}
	public Long getId_cliente() {
		return id_cliente;
	}
	public void setId_cliente(Long id_cliente) {
		this.id_cliente = id_cliente;
	}
	
	
}
