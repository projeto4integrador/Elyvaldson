package com.integrador.projeto_comanda.resources;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.integrador.projeto_comanda.domain.Categoria;
import com.integrador.projeto_comanda.repositories.CategoriaRepository;

@RestController
@RequestMapping("/categorias")
public class CategoriaResource {
	
	@Autowired
	private CategoriaRepository categoriaDAO;
	
	@GetMapping
	public List<Categoria> listar() {
		return categoriaDAO.findAll();
	}	
	
	@GetMapping("/{id}")
	public ResponseEntity<Categoria> buscarPeloCodigo(@PathVariable Long id){
		
		Categoria categoria = categoriaDAO.findOne(id);
		
		if(categoria != null){
			return ResponseEntity.ok().body(categoria);
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
