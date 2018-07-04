package com.algaworks.pedidovenda.repository.filter;

import java.io.Serializable;

import com.algaworks.pedidovenda.model.TipoPessoa;

public class ClienteFilter implements Serializable {

	private static final long serialVersionUID = 1L;

	private Long id;
	private String nome;
	private String email;
	private String documentoReceitaFederal;
	private TipoPessoa tipo;
	private String numeroCartaoFidelidade;
	
	
	
	public String getNumeroCartaoFidelidade() {
		return numeroCartaoFidelidade;
	}
	public void setNumeroCartaoFidelidade(String numeroCartaoFidelidade) {
		this.numeroCartaoFidelidade = numeroCartaoFidelidade;
	}
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getDocumentoReceitaFederal() {
		return documentoReceitaFederal;
	}
	public void setDocumentoReceitaFederal(String documentoReceitaFederal) {
		this.documentoReceitaFederal = documentoReceitaFederal;
	}
	public TipoPessoa getTipo() {
		return tipo;
	}
	public void setTipo(TipoPessoa tipo) {
		this.tipo = tipo;
	}
	
	

}