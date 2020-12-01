package br.senai.sp.backend.dto;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

import br.senai.sp.backend.model.Endereco;
import br.senai.sp.backend.model.Especialidades;
import br.senai.sp.backend.model.Portfolio;

public class FotografoToken {

	private Long id;
	private String nome;
	private String data_nascimento;
	private String fotoPerfil;
	private String cpf;
	private String experiencia;
	private String telefone;
	private String cep;
	private String email;
	private String senha;
	private String role;
	private String token;
	
	@ManyToMany
	private List<Especialidades> especialidades;

	@OneToMany(cascade = {CascadeType.ALL})
	private List<Portfolio> portfolios;
	
	@OneToOne
	private Endereco enderecos;
	
	public String getToken() {
		return token;
	}

	public List<Portfolio> getPortfolios() {
		return portfolios;
	}

	public void setPortfolios(List<Portfolio> portfolios) {
		this.portfolios = portfolios;
	}

	public Endereco getEnderecos() {
		return enderecos;
	}

	public void setEnderecos(Endereco enderecos) {
		this.enderecos = enderecos;
	}

	public void setToken(String token) {
		this.token = token;
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

	public String getFotoPerfil() {
		return fotoPerfil;
	}

	public void setFotoPerfil(String fotoPerfil) {
		this.fotoPerfil = fotoPerfil;
	}

	public String getCpf() {
		return cpf;
	}

	public void setCpf(String cpf) {
		this.cpf = cpf;
	}

	public String getTelefone() {
		return telefone;
	}

	public void setTelefone(String telefone) {
		this.telefone = telefone;
	}

	public String getCep() {
		return cep;
	}

	public void setCep(String cep) {
		this.cep = cep;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getSenha() {
		return senha;
	}

	public void setSenha(String senha) {
		this.senha = senha;
	}

	public List<Especialidades> getEspecialidades() {
		return especialidades;
	}
	
	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	
	public String getExperiencia() {
		return experiencia;
	}

	public void setExperiencia(String experiencia) {
		this.experiencia = experiencia;
	}

	
	
	public String getData_nascimento() {
		return data_nascimento;
	}

	public void setData_nascimento(String data_nascimento) {
		this.data_nascimento = data_nascimento;
	}

	public void setEspecialidades(List<Especialidades> especialidades) {
		this.especialidades = especialidades;
	}
}
