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
import br.senai.sp.backend.dto.AvaliacaoDTO;
import br.senai.sp.backend.model.Avaliacoes;
import br.senai.sp.backend.repository.AvaliacoesRepository;

@RestController
@RequestMapping("/photo")

@CrossOrigin
public class AvaliacoesResource {
    @Autowired
	private AvaliacoesRepository avaliacoesRepository;
	
	@GetMapping("/avaliacoes")
	public Page<Avaliacoes> getAvaliacoes(Pageable paginacao){
		return avaliacoesRepository.findAll(paginacao);
	}
	
	@PostMapping("/avaliacao")
	@ResponseStatus(HttpStatus.CREATED)
	public AvaliacaoDTO gravar (@Valid @RequestBody Avaliacoes avaliacao) {
		
		AvaliacaoDTO avaliacaoDTO = new AvaliacaoDTO();
		
		Avaliacoes avaliacoes = new Avaliacoes();
		
		
		List<String> roles = new ArrayList<>();
		
		avaliacoes = avaliacoesRepository.save(avaliacao);
		
		avaliacaoDTO.setId_avaliacao(avaliacao.getId_avaliacao());
		avaliacaoDTO.setValor(avaliacao.getId_avaliacao());
		avaliacaoDTO.setDescricao(avaliacao.getDescricao());
		avaliacaoDTO.setId_fotografo(avaliacao.getId_fotografo());
		avaliacaoDTO.setId_cliente(avaliacao.getId_cliente());
		
		System.out.println("Avaliação Gravada");
		
		return avaliacaoDTO;
		
		
		
	}
}
