package br.senai.sp.backend.resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import br.senai.sp.backend.model.Especialidades;
import br.senai.sp.backend.repository.EspecialidadeRepository;

@RestController
@RequestMapping("/photo")

@CrossOrigin
public class EspecialidadeResource {
    @Autowired
	private EspecialidadeRepository especialidadeRepo;
	
	@GetMapping("/especialidades")
	public Page<Especialidades> getEspecialidades(Pageable paginacao){
		return especialidadeRepo.findAll(paginacao);
	}
}