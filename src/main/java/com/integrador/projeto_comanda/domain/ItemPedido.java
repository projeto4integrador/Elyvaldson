package com.integrador.projeto_comanda.domain;

import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.validation.constraints.NotNull;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
public class ItemPedido {

	@JsonIgnore
	@EmbeddedId
	private ItemPedidoProduto id = new ItemPedidoProduto();
	
	@NotNull
	private Integer quantidade;
	
	private Double valortotal;
	private String observacao;
	
	public ItemPedido() {
		
	}

	public ItemPedido(Pedido pedido, Produto produto, Integer quantidade, String observacao) {
		super();
		id.setPedido(pedido);
		id.setProduto(produto);
		this.quantidade = quantidade;
		this.valortotal = this.quantidade * produto.getValor();
		this.observacao = observacao;
	}

	@JsonIgnore
	public Pedido getPedido() {
		return id.getPedido();
	}
	
	public Produto getProduto() {
		return id.getProduto();
	}
	
	public ItemPedidoProduto getId() {
		return id;
	}
	
	public void setId(ItemPedidoProduto id) {
		this.id = id;
	}
	
	public Integer getQuantidade() {
		return quantidade;
	}

	public void setQuantidade(Integer quantidade) {
		this.quantidade = quantidade;
	}

	public Double getValortotal() {
		return valortotal;
	}

	public void setValortotal(Double valortotal) {
		this.valortotal = valortotal;
	}

	public String getObservacao() {
		return observacao;
	}

	public void setObservacao(String observacao) {
		this.observacao = observacao;
	}
}
