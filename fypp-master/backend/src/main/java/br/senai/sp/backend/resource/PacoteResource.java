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

import br.senai.sp.backend.dto.PacoteToken;
import br.senai.sp.backend.dto.PortfolioToken;
import br.senai.sp.backend.model.Pacotes;
import br.senai.sp.backend.model.Portfolio;
import br.senai.sp.backend.repository.PacotesRepository;
import br.senai.sp.backend.security.JwtAuthService;

@RestController
@RequestMapping("/photo")
@CrossOrigin
public class PacoteResource {

	@Autowired
	private PacotesRepository pacotesRepository;
	
	@Autowired
	private JwtAuthService jwtAuthService;
	
	//listagem de pacotes
	@GetMapping("/pacotes")
	public Page<Pacotes> getPacotes (Pageable paginacao){
		return pacotesRepository.findAll(paginacao);
		}
	
	//criar pacote
	
		@PostMapping("/pacote")
		@ResponseStatus(HttpStatus.CREATED)
		public PacoteToken gravar(@Valid @RequestBody Pacotes pacotes) {
			
			Pacotes novoPacote = new Pacotes();
			novoPacote= pacotesRepository.save(pacotes);
			
			PacoteToken pacoteToken = new PacoteToken();
			List<String> roles = new ArrayList<>();
			//String token =  jwtAuthService.createToken(portfolio.getEmail(), roles) ;
			//portfolioToken.setToken(token);
			pacoteToken.setId(pacotes.getId());
			pacoteToken.setPreco(pacotes.getPreco());
			pacoteToken.setDescricao(pacotes.getDescricao());
			pacoteToken.setNome_pacote(pacotes.getNome_pacote());
			//portfolioToken.setRole(portfolio.getRole());
			
			return pacoteToken;
	}
}
