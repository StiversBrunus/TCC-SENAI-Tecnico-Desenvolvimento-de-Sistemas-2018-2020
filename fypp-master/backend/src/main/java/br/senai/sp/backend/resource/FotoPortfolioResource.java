package br.senai.sp.backend.resource;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

import br.senai.sp.backend.dto.ClienteToken;
import br.senai.sp.backend.dto.FotoPortfolioToken;
import br.senai.sp.backend.model.Cliente;
import br.senai.sp.backend.model.FotoPortfolio;
import br.senai.sp.backend.model.Portfolio;
import br.senai.sp.backend.repository.FotoPortfolioRepository;
import br.senai.sp.backend.security.JwtAuthService;
import br.senai.sp.backend.upload.FirebaseStorageService;

@RestController
@RequestMapping("/photo")

@CrossOrigin
public class FotoPortfolioResource {

	@Autowired
	private FotoPortfolioRepository fotoPortfolioRepository;
	
	@Autowired
	private JwtAuthService jwtAuthService;
	
	
	//listar todas as fotos
	@GetMapping("/fotografoPortfolios")
	public Page<FotoPortfolio> getFotoPortfolios (Pageable paginacao){
	return fotoPortfolioRepository.findAll(paginacao);
	}
	
	//listar todas as fotos por fotografo
	@GetMapping("/fotografoPortfolios/{id}")
	public ResponseEntity<?> getfotoPortfolio(@PathVariable Long id) {
		Optional foto_id = fotoPortfolioRepository.findById(id);
		return foto_id.isPresent() ? ResponseEntity.ok(foto_id) : ResponseEntity.notFound().build();
	}
	
	//criar foto
	@PostMapping("/fotoPortfolio")
	@ResponseStatus(HttpStatus.CREATED)
	public FotoPortfolioToken gravar(@Valid @RequestBody FotoPortfolio foto) {
		
		
		FotoPortfolio fotoPortfolio = new FotoPortfolio();
		fotoPortfolio= fotoPortfolioRepository.save(foto);
		FotoPortfolioToken fotoPortfolioToken = new FotoPortfolioToken();
		List<String> roles = new ArrayList<>();
		fotoPortfolioToken.setNome(foto.getNome());
		fotoPortfolioToken.setDescricao(foto.getDescricao());
		fotoPortfolioToken.setUrl(foto.getUrl());

		return fotoPortfolioToken;
	}
	
}
