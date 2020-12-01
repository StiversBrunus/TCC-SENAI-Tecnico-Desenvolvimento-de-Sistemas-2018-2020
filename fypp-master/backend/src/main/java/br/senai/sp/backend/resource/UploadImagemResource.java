package br.senai.sp.backend.resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import br.senai.sp.backend.upload.FirebaseStorageService;
import br.senai.sp.backend.upload.UploadInput;

@RestController
@RequestMapping("/photo")

@CrossOrigin
public class UploadImagemResource {
    
	@Autowired
    private FirebaseStorageService uploadFoto;
    
    @PostMapping("/upload/imagem")
	public ResponseEntity uploadFoto(@RequestBody final UploadInput fotoUpload) {
        final String url = uploadFoto.upload(fotoUpload);
		return ResponseEntity.ok(url);
	}

}