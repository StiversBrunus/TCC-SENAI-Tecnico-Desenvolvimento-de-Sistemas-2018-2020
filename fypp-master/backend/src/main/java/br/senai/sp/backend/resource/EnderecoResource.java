package br.senai.sp.backend.resource;

import java.util.ArrayList;
import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

import br.senai.sp.backend.dto.EnderecoToken;
import br.senai.sp.backend.dto.PacoteToken;
import br.senai.sp.backend.model.Endereco;
import br.senai.sp.backend.model.Pacotes;
import br.senai.sp.backend.repository.EnderecoRepository;

@RestController
@RequestMapping("/photo")
@CrossOrigin
public class EnderecoResource {

	@Autowired
	private EnderecoRepository enderecoRepository;
	
	//listagem de enderecos
	@GetMapping("/enderecos")
	public Page<Endereco> getEnderecos(Pageable paginacao){
		 return enderecoRepository.findAll(paginacao);
	}
	
	//criar endereco
	
			@PostMapping("/endereco")
			@ResponseStatus(HttpStatus.CREATED)
			public EnderecoToken gravar(@Valid @RequestBody Endereco endereco) {
				
				Endereco novoEndereco = new Endereco();
				novoEndereco= enderecoRepository.save(endereco);
				
				EnderecoToken enderecoToken = new EnderecoToken();
				List<String> roles = new ArrayList<>();
				//String token =  jwtAuthService.createToken(portfolio.getEmail(), roles) ;
				//portfolioToken.setToken(token);
				enderecoToken.setBairo(endereco.getBairo());
				enderecoToken.setCep(endereco.getCep());
				enderecoToken.setCidade(endereco.getCidade());
				enderecoToken.setEstado(endereco.getEstado());
				enderecoToken.setId(endereco.getId());
				enderecoToken.setNumero(endereco.getNumero());
				enderecoToken.setPais(endereco.getPais());
				enderecoToken.setRua(endereco.getRua());
				//portfolioToken.setRole(portfolio.getRole());
				
				return enderecoToken;
		}
}
