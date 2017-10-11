package com.integrador.projeto_comanda.domain;

import java.util.LinkedList;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

import com.integrador.projeto_comanda.domain.enums.StatusPedido;

@Entity
@Table(name = "web_pedido")
public class Pedido {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	
	@NotNull
	private Double valor;
	
	@NotNull
	private StatusPedido estado;
	
	@OneToMany(mappedBy = "id.pedido")
	private List<ItemPedido> itens = new LinkedList<>();
	
	public Pedido() {
		
	}

	public Pedido(Integer id, Double valor, StatusPedido estado, ItemPedido item) {
		super();
		this.id = id;
		this.valor = valor;
		this.estado = estado;
		this.itens.add(item);
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Double getValor() {
		return valor;
	}

	public void setValor(Double valor) {
		this.valor = valor;
	}

	public StatusPedido getEstado() {
		return estado;
	}

	public void setEstado(StatusPedido estado) {
		this.estado = estado;
	}

	public List<ItemPedido> getItens() {
		return itens;
	}

	public void setItens(List<ItemPedido> itens) {
		this.itens = itens;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((id == null) ? 0 : id.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Pedido other = (Pedido) obj;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		return true;
	}
}
