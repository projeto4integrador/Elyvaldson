package com.integrador.projeto_comanda.resources;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.integrador.projeto_comanda.domain.Adicional;
import com.integrador.projeto_comanda.repositories.AdicionalRepository;

@RestController
@RequestMapping("/adicional")
public class AdicionalResource {
	
	@Autowired
	private AdicionalRepository adicionalDAO;
	
	@GetMapping
	public List<Adicional> listar() {
		return adicionalDAO.findAll();
	}	
	
	@GetMapping("/{id}")
	public ResponseEntity<Adicional> buscarPeloCodigo(@PathVariable Long id){
		
		Adicional adicional = adicionalDAO.findOne(id);
		
		if(adicional != null){
			return ResponseEntity.ok().body(adicional);
		}else {
			return ResponseEntity.notFound().build(); // retorna 404
		}
	}

/*	@DeleteMapping("/{id}")
	@ResponseStatus(HttpStatus.NO_CONTENT)
	public void remover(@PathVariable Long id){
		categoriaDAO.delete(id);
	}*/	
	
}
