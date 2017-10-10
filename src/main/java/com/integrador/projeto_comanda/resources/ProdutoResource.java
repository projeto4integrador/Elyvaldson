package com.integrador.projeto_comanda.resources;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.integrador.projeto_comanda.domain.Produto;
import com.integrador.projeto_comanda.repositories.ProdutoRepository;

@RestController
@RequestMapping("/produto")
public class ProdutoResource {
	
	@Autowired
	private ProdutoRepository produtoDAO;
	
	@GetMapping
	public List<Produto> listar() {
		return produtoDAO.findAll();
	}	
	
	@GetMapping("/{id}")
	public ResponseEntity<Produto> buscarPeloCodigo(@PathVariable Long id){
		
		Produto produto = produtoDAO.findOne(id);
		
		if(produto != null){
			return ResponseEntity.ok().body(produto);
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
