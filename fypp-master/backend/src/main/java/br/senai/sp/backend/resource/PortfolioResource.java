package br.senai.sp.backend.resource;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import javax.validation.Valid;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

import br.senai.sp.backend.dto.FotoPortfolioToken;
import br.senai.sp.backend.dto.PortfolioToken;
import br.senai.sp.backend.model.Cliente;
import br.senai.sp.backend.model.Fotografo;
import br.senai.sp.backend.model.Portfolio;
import br.senai.sp.backend.repository.PortfolioRepository;
import br.senai.sp.backend.security.JwtAuthService;

@RestController
@RequestMapping("/photo")

@CrossOrigin
public class PortfolioResource {

	@Autowired
	private PortfolioRepository portfolioRepository;
	
	@Autowired
	private JwtAuthService jwtAuthService;
	
	//listar todos os portifolios
	@GetMapping("/portfolios")
	public Page<Portfolio> getPortfolios (Pageable paginacao){
	return portfolioRepository.findAll(paginacao);
	}
	
	//listar portfolio pelo id
	@GetMapping("/portfolios/{id}")
	public Portfolio getPortfolio(@PathVariable(value = "id")Long id) {
		return portfolioRepository.portfoliosFotografos(id);
	}
	
	//listar todos os portfolios de um fotografo
	@RequestMapping(method = RequestMethod.GET, value = "portfolios/{id_fotografo}", produces = MediaType.APPLICATION_JSON_VALUE)
	public List<Portfolio> getportfolioFotografo(@PathVariable(value = "id_fotografo") Long id_fotografo) {
		if(portfolioRepository.portfoliosFotografo(id_fotografo) != null) {
			return portfolioRepository.portfoliosFotografo(id_fotografo);
		}else {
			System.out.println("vaziaa");
		}
		
		return portfolioRepository.portfoliosFotografo(id_fotografo);
	}
	
	//criar portfolio
	
	@PostMapping("/portfolio")
	@ResponseStatus(HttpStatus.CREATED)
	public PortfolioToken gravar(@Valid @RequestBody Portfolio portfolio) {
		
		Portfolio novoPortfolio = new Portfolio();
		novoPortfolio= portfolioRepository.save(portfolio);
		
		PortfolioToken portfolioToken = new PortfolioToken();
		List<String> roles = new ArrayList<>();
		//String token =  jwtAuthService.createToken(portfolio.getEmail(), roles) ;
		//portfolioToken.setToken(token);
		portfolioToken.setId_fotografo(portfolio.getId_fotografo());
		portfolioToken.setId(portfolio.getId());
		portfolioToken.setNome(portfolio.getNome());
		//portfolioToken.setRole(portfolio.getRole());
		
		return portfolioToken;
}
	
	// update no portfolios adicionando só as fotos
	
		@PutMapping("/portfolio/{id}")
		public ResponseEntity<Portfolio>atualizar(@PathVariable Long id, @Valid @RequestBody Portfolio portfolio){
			Portfolio portfolioAtual = portfolioRepository.findById(id).get();
			BeanUtils.copyProperties(portfolio, portfolioAtual, "id");
			portfolioRepository.save(portfolioAtual);
			return ResponseEntity.ok(portfolioAtual);
		}
}
