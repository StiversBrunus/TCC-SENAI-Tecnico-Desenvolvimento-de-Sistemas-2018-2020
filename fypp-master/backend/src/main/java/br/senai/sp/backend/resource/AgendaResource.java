package br.senai.sp.backend.resource;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Date;
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

import br.senai.sp.backend.dto.AgendaDTO;
import br.senai.sp.backend.dto.EnderecoToken;
import br.senai.sp.backend.model.Agenda;
import br.senai.sp.backend.model.Endereco;
import br.senai.sp.backend.model.Fotografo;
import br.senai.sp.backend.repository.AgendaRepository;


@RestController
@RequestMapping("/photo")
@CrossOrigin
public class AgendaResource {

	@Autowired
	private AgendaRepository agendaRepository;
	
	// listar todos os fotografos
	@GetMapping("/agendas")
	public Page<Agenda> getagendas(Pageable paginacao) {
		return agendaRepository.findAll(paginacao);
	}
	
	//criar agenda
	
	@PostMapping("/agenda")
	@ResponseStatus(HttpStatus.CREATED)
	public AgendaDTO gravar(@Valid @RequestBody Agenda agenda) {
		
					Agenda newAgenda = new Agenda();
		
					newAgenda= agendaRepository.save(agenda);
			
					AgendaDTO listagemAgenda = new AgendaDTO(); 
				List<String> roles = new ArrayList<>();
	
				listagemAgenda.setData(agenda.getData());
				listagemAgenda.setHorario_inicio(agenda.getHorario_inicio());
				listagemAgenda.setHorario_fim(agenda.getHorario_fim());
				listagemAgenda.setId(agenda.getId());
				listagemAgenda.setStatus(agenda.getStatus());
		

		return listagemAgenda;
}
}
