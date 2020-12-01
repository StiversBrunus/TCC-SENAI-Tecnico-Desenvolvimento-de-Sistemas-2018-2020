package br.senai.sp.backend.resource;

import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Optional;

import javax.validation.Valid;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
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
import br.senai.sp.backend.dto.FotografoToken;
import br.senai.sp.backend.model.Fotografo;
import br.senai.sp.backend.repository.FotografoRepository;
import br.senai.sp.backend.security.JwtAuthService;

@RestController
@RequestMapping("/photo")

@CrossOrigin
public class FotografoResource {

	@Autowired
	private FotografoRepository fotografoRepository;

	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;

	@Autowired
	private JwtAuthService jwtAuthService;

	// listar todos os fotografos
	@GetMapping("/fotografos")
	public Page<Fotografo> getFotografos(Pageable paginacao) {
		return fotografoRepository.findAll(paginacao);
	}

	// listar os fotografos por codigo
	@GetMapping("/fotografos/{id}")
	public ResponseEntity<?> getFotografo(@PathVariable Long id) {
		Optional codFotografo = fotografoRepository.findById(id);
		return codFotografo.isPresent() ? ResponseEntity.ok(codFotografo) : ResponseEntity.notFound().build();
	}

	// listar pelo nome
	@GetMapping("/fotografos/nome/{nome}")
	public List<Fotografo> getFotografoLikeNome(@PathVariable String nome) {
		return fotografoRepository.findByLikeNome(nome);
	}
	
	@GetMapping("/fotografos/email/{email}")
	public Fotografo getFotografoLikeEmail(@PathVariable String email) {
		return fotografoRepository.findByEmail(email);
	}

	//listar por categorias
	@RequestMapping(method = RequestMethod.GET, value = "fotografos/categoria/{id}", produces = MediaType.APPLICATION_JSON_VALUE)
	public List<Fotografo> getFotografoByCategory(@PathVariable Long id) {
		
		if(fotografoRepository.findByEspecialidade(id) !=null) {
			return fotografoRepository.findByEspecialidade(id);
		}else {
			System.out.println("vaziaa");
		}
		
		return fotografoRepository.findByEspecialidade(id);
	}
	
	// update no fotógrafo adicionando só as especialidades
	@PutMapping("/fotografo/{id}")
	public ResponseEntity<Fotografo>atualizar(@PathVariable Long id, @Valid @RequestBody Fotografo fotografo){
		Fotografo fotografoAtual = fotografoRepository.findById(id).get();
		BeanUtils.copyProperties(fotografo, fotografoAtual, "id");
		fotografoRepository.save(fotografoAtual);
		return ResponseEntity.ok(fotografoAtual);
	}

	// cadastrar um fotografo
	@PostMapping("/fotografo")
	@ResponseStatus(HttpStatus.CREATED)
	public FotografoToken gravar(@Valid @RequestBody Fotografo fotografo) {

		String senhaCodificada = bCryptPasswordEncoder.encode(fotografo.getSenha());

		Fotografo novoFotografo = new Fotografo();
		fotografo.setSenha(senhaCodificada);

		String cpf = fotografo.getCpf();
		String datas = fotografo.getData_nascimento();

		String ComparacaoCpf = fotografoRepository.findByCPF(cpf);

		try {
			String dataFront = fotografo.getData_nascimento();

			String ano = dataFront.substring(dataFront.length() - 4);
			String dia = dataFront.substring(0, 2);
			String mes = dataFront.substring(3, 5);

			String dataBanco = ano + "-" + mes + "-" + dia;

			System.out.println("data formatada: " + dataBanco);

			fotografo.setData_nascimento(dataBanco);

		} catch (Exception e) {
			e.printStackTrace();
		}

		novoFotografo = fotografoRepository.save(fotografo);

		FotografoToken fotografoToken = new FotografoToken();
		List<String> roles = new ArrayList<>();
		String token = jwtAuthService.createToken(fotografo.getEmail(), roles);

		fotografoToken.setToken(token);
		fotografoToken.setEmail(fotografo.getEmail());
		fotografoToken.setNome(fotografo.getNome());
		fotografoToken.setData_nascimento(fotografo.getData_nascimento());
		fotografoToken.setCep(fotografo.getCep());
		fotografoToken.setCpf(fotografo.getCpf());
		fotografoToken.setFotoPerfil(fotografo.getFotoPerfil());
		fotografoToken.setId(fotografo.getId());
		fotografoToken.setEnderecos(fotografo.getEnderecos());
		//fotografoToken.setPortfolios(fotografo.getPortfolios());
		fotografoToken.setSenha(fotografo.getSenha());
		fotografoToken.setTelefone(fotografo.getTelefone());
		fotografoToken.setSenha(fotografo.getSenha());
		fotografoToken.setRole(fotografo.getRole());
		fotografoToken.setExperiencia(fotografo.getExperiencia());

		return fotografoToken;
	}
}
