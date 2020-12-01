package br.senai.sp.backend.model;

import java.sql.Time;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "tbl_agenda")
public class Agenda {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	private String data;
	private String horario_inicio;
	private String horario_fim;
	private int status;
	
	@OneToOne
	private Endereco endereco;

	@OneToOne
	private Cliente cliente;
	
	@OneToOne
	private Fotografo fotografo;
	
	@OneToOne
	private Especialidades especialidades;
	
	@OneToOne
	private Contratacao contratacao;
	
	
	public Fotografo getFotografo() {
		return fotografo;
	}
	public void setFotografo(Fotografo fotografo) {
		this.fotografo = fotografo;
	}
	public Contratacao getContratacao() {
		return contratacao;
	}
	public void setContratacao(Contratacao contratacao) {
		this.contratacao = contratacao;
	}
	public Cliente getCliente() {
		return cliente;
	}
	public void setCliente(Cliente cliente) {
		this.cliente = cliente;
	}
	public Especialidades getEspecialidades() {
		return especialidades;
	}
	public void setEspecialidades(Especialidades especialidades) {
		this.especialidades = especialidades;
	}
	public Endereco getEndereco() {
		return endereco;
	}
	public void setEndereco(Endereco endereco) {
		this.endereco = endereco;
	}
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getData() {
		return data;
	}
	public void setData(String data) {
		this.data = data;
	}
	public String getHorario_inicio() {
		return horario_inicio;
	}
	public void setHorario_inicio(String horario_inicio) {
		this.horario_inicio = horario_inicio;
	}
	public String getHorario_fim() {
		return horario_fim;
	}
	public void setHorario_fim(String horario_fim) {
		this.horario_fim = horario_fim;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	
	
}