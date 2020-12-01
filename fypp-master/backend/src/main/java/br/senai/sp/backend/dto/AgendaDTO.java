package br.senai.sp.backend.dto;

import java.sql.Time;
import java.util.Date;

public class AgendaDTO {

	private Long id;
	private String data;
	private String horario_inicio;
	private String horario_fim;
	private String endereco;
	private Long cliente_id;
	private Long especialidade_id;
	private int status;
	
	
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
	public String getEndereco() {
		return endereco;
	}
	public void setEndereco(String endereco) {
		this.endereco = endereco;
	}
	public Long getCliente_id() {
		return cliente_id;
	}
	public void setCliente_id(Long cliente_id) {
		this.cliente_id = cliente_id;
	}
	public Long getEspecialidade_id() {
		return especialidade_id;
	}
	public void setEspecialidade_id(Long especialidade_id) {
		this.especialidade_id = especialidade_id;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
		
}
