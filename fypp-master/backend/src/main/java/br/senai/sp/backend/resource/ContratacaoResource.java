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
import br.senai.sp.backend.dto.ContratoDTO;
import br.senai.sp.backend.model.Address;
import br.senai.sp.backend.model.Billing;
import br.senai.sp.backend.model.Cliente;
import br.senai.sp.backend.model.Contratacao;
import br.senai.sp.backend.model.Customer;
import br.senai.sp.backend.model.Documents;
import br.senai.sp.backend.model.Items;
import br.senai.sp.backend.model.Portfolio;
import br.senai.sp.backend.repository.AddressRepository;
import br.senai.sp.backend.repository.BillingRepository;
import br.senai.sp.backend.repository.ContratacaoRepository;
import br.senai.sp.backend.repository.CustomerRepository;
import br.senai.sp.backend.repository.DocumentsRepository;
import br.senai.sp.backend.repository.ItemsRepository;

@RestController
@RequestMapping("/photo")

@CrossOrigin
public class ContratacaoResource {

	@Autowired
	private ContratacaoRepository contratacaoRepository;
	
	@Autowired
	private CustomerRepository customerRepository;
	
	@Autowired
	private DocumentsRepository documentsRepository;
	
	@Autowired
	private BillingRepository billingRepository;
	
	@Autowired
	private AddressRepository addressRepository;
	
	@Autowired
	private ItemsRepository itemsRepository;
	
	
	//listar os contratos
	@GetMapping("/contratacoes")
	public Page<Contratacao> getContratacoes(Pageable paginacao){
		return contratacaoRepository.findAll(paginacao);
	}
	
	// listar os contratos por name
	@GetMapping("/contratacoes/name/{card_holder_name}")
	public Contratacao getContratacaoLikeId(@PathVariable String card_holder_name) {
		  Contratacao contrato=contratacaoRepository.findByName(card_holder_name);	
		    
			return contrato;
	}
	
	//listar portfolio pelo id
		@GetMapping("/contratacoes/{id}")
		public Contratacao getcontrato(@PathVariable(value = "id")Long id) {
			return contratacaoRepository.findByIdContrato(id);
		}
		
	@PostMapping("/contratacao")
	@ResponseStatus(HttpStatus.CREATED)
	public ContratoDTO gravar(@Valid @RequestBody ContratoDTO contratoDTO) {
	
		Contratacao novaContratacao = new Contratacao();
		Customer novoCustomer = new Customer();		
		Documents novoDocuments = new Documents();		
		Billing novoBilling = new Billing();		
		Address novoAddress = new Address();		
		Items novoItems = new Items();
		
		
		novaContratacao.setAmount(contratoDTO.getAmount());
		novaContratacao.setCard_number(contratoDTO.getCard_number());
		novaContratacao.setCard_cvv(contratoDTO.getCard_cvv());
		novaContratacao.setCard_expiration_date(contratoDTO.getCard_expiration_date());
		novaContratacao.setCard_holder_name(contratoDTO.getCard_holder_name());
		
		novoCustomer.setExternal_id(contratoDTO.getExternal_id());
		novoCustomer.setName(contratoDTO.getName());
		novoCustomer.setType(contratoDTO.getType());
		novoCustomer.setCountry(contratoDTO.getCountry());
		novoCustomer.setEmail(contratoDTO.getEmail());
		
		novoDocuments.setNumber(contratoDTO.getNumber());
		novoDocuments.setType(contratoDTO.getDocuments_type());
		
		novoBilling.setName(contratoDTO.getBilling_name());
		
		novoAddress.setCountry(contratoDTO.getAddress_country());
		novoAddress.setState(contratoDTO.getState());
		novoAddress.setCity(contratoDTO.getCity());
		novoAddress.setNeighborhood(contratoDTO.getNeighborhood());
		novoAddress.setStreet(contratoDTO.getStreet());
		novoAddress.setZipcode(contratoDTO.getZipcode());
		
		novoItems.setId(contratoDTO.getId());
		novoItems.setTitle(contratoDTO.getTitle());
		novoItems.setUnit_price(contratoDTO.getUnit_price());
		novoItems.setQuantity(contratoDTO.getQuantity());
		novoItems.setTangible(contratoDTO.isTangible());
	
		
		novaContratacao = contratacaoRepository.save(novaContratacao);
		novoCustomer = customerRepository.save(novoCustomer);
		novoDocuments = documentsRepository.save(novoDocuments);
		novoBilling = billingRepository.save(novoBilling);
		novoAddress = addressRepository.save(novoAddress);
		novoItems = itemsRepository.save(novoItems);
	
		ContratoDTO contratoToken = new ContratoDTO();
		List<String> roles = new ArrayList<>();
		
		contratoToken.setId_contrato(novaContratacao.getId());
		contratoToken.setAmount(contratoDTO.getAmount());
		contratoToken.setCard_number(contratoDTO.getCard_number());
		contratoToken.setCard_cvv(contratoDTO.getCard_cvv());
		contratoToken.setCard_expiration_date(contratoDTO.getCard_expiration_date());
		contratoToken.setCard_holder_name(contratoDTO.getCard_holder_name());
		contratoToken.setExternal_id(contratoDTO.getExternal_id());
		contratoToken.setName(contratoDTO.getName());
		contratoToken.setType(contratoDTO.getType());
		contratoToken.setCountry(contratoDTO.getCountry());
		contratoToken.setEmail(contratoDTO.getEmail());
		contratoToken.setNumber(contratoDTO.getNumber());
		contratoToken.setType(contratoDTO.getDocuments_type());
		contratoToken.setName(contratoDTO.getBilling_name());
		contratoToken.setCountry(contratoDTO.getAddress_country());
		contratoToken.setState(contratoDTO.getState());
		contratoToken.setCity(contratoDTO.getCity());
		contratoToken.setNeighborhood(contratoDTO.getNeighborhood());
		contratoToken.setStreet(contratoDTO.getStreet());
		contratoToken.setZipcode(contratoDTO.getZipcode());
		contratoToken.setId(contratoDTO.getId());
		contratoToken.setTitle(contratoDTO.getTitle());
		contratoToken.setUnit_price(contratoDTO.getUnit_price());
		contratoToken.setQuantity(contratoDTO.getQuantity());
		contratoToken.setTangible(contratoDTO.isTangible());
		
		return contratoToken;
	}
}
