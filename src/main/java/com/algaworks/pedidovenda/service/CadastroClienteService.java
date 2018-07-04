package com.algaworks.pedidovenda.service;

import java.io.Serializable;
import java.util.List;

import javax.inject.Inject;

import com.algaworks.pedidovenda.model.Cliente;
import com.algaworks.pedidovenda.model.Produto;
import com.algaworks.pedidovenda.model.TipoPessoa;
import com.algaworks.pedidovenda.repository.Clientes;
import com.algaworks.pedidovenda.util.jpa.Transactional;

public class CadastroClienteService implements Serializable {

	private static final long serialVersionUID = 1L;

	@Inject
	private Clientes clientes;
	
	private String tipo;
	
	@Transactional
	public Cliente salvar(Cliente cliente) {
		List<Cliente> clienteExistente = clientes.porEmail(cliente.getEmail());
		
		if (clienteExistente != null && clienteExistente.size() > 0) {
			throw new NegocioException("Já existe um cliente com o email informado.");
		}
		if(tipo != null){
			if(tipo.equals("fisica")){
				cliente.setTipo(TipoPessoa.FISICA);
			} else if(tipo.equals("juridica")){
				cliente.setTipo(TipoPessoa.JURIDICA);
			}
		}else{
			cliente.setTipo(TipoPessoa.FISICA);
		}
		return clientes.guardar(cliente);
				
	}
	
	
}