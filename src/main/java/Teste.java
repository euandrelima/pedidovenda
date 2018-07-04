import java.util.ArrayList;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;

import com.algaworks.pedidovenda.model.Cliente;
import com.algaworks.pedidovenda.model.Endereco;
import com.algaworks.pedidovenda.model.Grupo;
import com.algaworks.pedidovenda.model.TipoPessoa;
import com.algaworks.pedidovenda.model.Usuario;


public class Teste {

	public static void main(String[] args) {
		EntityManagerFactory factory = Persistence.createEntityManagerFactory("pedidovendasPU");
		EntityManager manager = factory.createEntityManager();
		
		EntityTransaction trx = manager.getTransaction();
		trx.begin();
		
		Cliente cliente = new Cliente();
		cliente.setNome("João das Couves2");
		cliente.setEmail("joao@dascouves.com");
		cliente.setDocumentoReceitaFederal("123.123.123-12");
		cliente.setTipo(TipoPessoa.FISICA);
		
		
		
		Endereco endereco = new Endereco();
		endereco.setLogradouro("Rua das Aboboras Vermelhas");
		endereco.setNumero("111");
		endereco.setCidade("Uberlândia");
		endereco.setUf("MG");
		endereco.setCep("38400-000");
		endereco.setCliente(cliente);
		
		cliente.getEnderecos().add(endereco);
		
		manager.persist(cliente);
		
		trx.commit();
		
//		trx.begin();
//		Usuario usuario = new Usuario();
//		usuario.setEmail("mm@mm.com");
//		ArrayList grupos = new ArrayList<>();
//		Grupo grupo = new Grupo();
//		grupo.setId(new Long(7));
//		grupo.setDescricao("ADMINISTRADOR");
//		grupo.setNome("Administrador");
//		grupos.add(grupo);
////		usuario.setGrupos(null);
//		usuario.setId(new Long(7));
//		usuario.setNome("Marcelo");
//		usuario.setSenha("123");
//		manager.persist(usuario);
//		trx.commit();
	}
	
}