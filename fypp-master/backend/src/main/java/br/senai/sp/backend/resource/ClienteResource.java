package br.senai.sp.backend.resource;

import java.util.ArrayList;
import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

import br.senai.sp.backend.dto.ClienteToken;
import br.senai.sp.backend.model.Cliente;
import br.senai.sp.backend.model.Fotografo;
import br.senai.sp.backend.repository.ClienteRepository;
import br.senai.sp.backend.security.JwtAuthService;
import br.senai.sp.backend.upload.FirebaseStorageService;
import br.senai.sp.backend.upload.UploadInput;

@RestController
@RequestMapping("/photo")

@CrossOrigin
public class ClienteResource {
	
	@Autowired
	private ClienteRepository clienteRepository;
	
	@Autowired
	private FirebaseStorageService uploadFoto;
	
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;
	
	@Autowired
	private JwtAuthService jwtAuthService;
	
	//listar os clientes
	@GetMapping("/clientes")
	public Page<Cliente> getClientes(Pageable paginacao){
		return clienteRepository.findAll(paginacao);
	}
	
	@GetMapping("/clientes/email/{email}")
	public Cliente getClienteLikeEmail(@PathVariable String email) {
		return clienteRepository.findByEmail(email);
	}
		
	@PostMapping("/cliente")
	@ResponseStatus(HttpStatus.CREATED)
	public ClienteToken gravar(@Valid @RequestBody Cliente cliente) {
		
		String encodedPassword = bCryptPasswordEncoder.encode(cliente.getSenha());
		
		
		Cliente novoCliente = new Cliente();
		cliente.setSenha(encodedPassword);

		novoCliente= clienteRepository.save(cliente);
		
		ClienteToken clienteToken = new ClienteToken();
		List<String> roles = new ArrayList<>();
		String token =  jwtAuthService.createToken(cliente.getEmail(), roles) ;
		clienteToken.setToken(token);
		clienteToken.setEmail(cliente.getEmail());
		clienteToken.setNome(cliente.getNome());
		clienteToken.setCep(cliente.getCep());
		clienteToken.setFotoPerfil(cliente.getFotoPerfil());
		clienteToken.setId(cliente.getId());
		clienteToken.setSenha(cliente.getSenha());
		clienteToken.setTelefone(cliente.getTelefone());
		clienteToken.setSenha(cliente.getSenha());
		clienteToken.setRole(cliente.getRole());
		
		return clienteToken;
	}
	
//	@PostMapping("/cliente/foto")
//	public ResponseEntity uploadFoto(@RequestBody UploadInput fotoUpload) {
////		String url = uploadFoto.upload(fotoUpload);
////		return ResponseEntity.ok(url);
//	}
	
	
}
