package com.algaworks.pedidovenda.controller;

import java.io.Serializable;

import javax.faces.bean.ViewScoped;
import javax.inject.Inject;
import javax.inject.Named;

import com.algaworks.pedidovenda.model.Cliente;
import com.algaworks.pedidovenda.service.CadastroClienteService;
import com.algaworks.pedidovenda.util.jsf.FacesUtil;

@Named
@ViewScoped
public class CadastroClienteBean implements Serializable {

	private static final long serialVersionUID = 1L;

	@Inject
	private CadastroClienteService cadastroClienteService;
	
	private Cliente cliente;
	
	public CadastroClienteBean() {
		limpar();
	}
	
	public void inicializar() {
		if (FacesUtil.isNotPostback()) {
			
		}
	}
	
	
	private void limpar() {
		cliente = new Cliente();
	}
	
	public void salvar() {
		this.cliente = cadastroClienteService.salvar(this.cliente);
		limpar();
		
		FacesUtil.addInfoMessage("Cliente salvo com sucesso!");
	}

	public Cliente getCliente() {
		return cliente;
	}
	
	public void setCliente(Cliente cliente) {
		this.cliente = cliente;		
	}

	public boolean isEditando() {
		return this.cliente.getId() != null;
	}

}