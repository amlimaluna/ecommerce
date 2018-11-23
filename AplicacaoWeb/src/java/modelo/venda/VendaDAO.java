/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo.venda;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
import static config.Configuracao.JDBC_SENHA;
import static config.Configuracao.JDBC_URL;
import static config.Configuracao.JDBC_USUARIO;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import modelo.produto.ProdutoDAO;
import modelo.venda_produto.VendaProduto;

/**
 *
 * @author leoomoreira
 */
public class VendaDAO {

    public int obterId() // throws Exception
    {
        int id = 0;
        try {
            Class.forName("org.postgresql.Driver");
            Connection connection = DriverManager.getConnection(JDBC_URL, JDBC_USUARIO, JDBC_SENHA);
            String sql = "SELECT nextval('venda_id_seq') AS id";
            PreparedStatement stmt = connection.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                id = rs.getInt("id");
            }
            rs.close();
            stmt.close();
            connection.close();
        } catch (Exception ex) {
            return id;
        }
        return id;
    }

    public boolean inserir(int id, String usuarioLogin) {
        boolean resultado = false;
        try {
            Class.forName("org.postgresql.Driver");
            Connection connection = DriverManager.getConnection(JDBC_URL, JDBC_USUARIO, JDBC_SENHA);
            PreparedStatement preparedStatement = connection.prepareStatement("INSERT INTO venda (id, usuario_login) VALUES (?, ?)");
            preparedStatement.setInt(1, id);
            preparedStatement.setString(2, usuarioLogin);
            resultado = (preparedStatement.executeUpdate() > 0);
            preparedStatement.close();
            connection.close();
        } catch (Exception ex) {
            return false;
        }
        return resultado;

    }

    public boolean inserirVendaProduto(int vendaId, int produtoId, int quantidade) {
        boolean resultado = false;
        try {
            Class.forName("org.postgresql.Driver");
            Connection connection = DriverManager.getConnection(JDBC_URL, JDBC_USUARIO, JDBC_SENHA);
            PreparedStatement preparedStatement = connection.prepareStatement("INSERT INTO venda_produto (venda_id, produto_id, quantidade) VALUES (?, ?, ?)");
            preparedStatement.setInt(1, vendaId);
            preparedStatement.setInt(2, produtoId);
            preparedStatement.setInt(3, quantidade);
            resultado = (preparedStatement.executeUpdate() > 0);
            preparedStatement.close();
            connection.close();
        } catch (Exception ex) {
            return false;
        }
        return resultado;
    }

    public List<Venda> obterTodas() {
        List<Venda> resultado = new ArrayList<Venda>();
        try {
            Class.forName("org.postgresql.Driver");
            Connection connection = DriverManager.getConnection(JDBC_URL, JDBC_USUARIO, JDBC_SENHA);
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery("SELECT id, usuario_login FROM venda");
            while (resultSet.next()) {
                Venda venda = new Venda();
                venda.setId(resultSet.getInt("id"));
                venda.setUsuarioLogin(resultSet.getString("usuario_login"));
                venda.setProdutos(obterVendasProdutos(venda.getId()));
                resultado.add(venda);
            }
            resultSet.close();
            statement.close();
            connection.close();
        } catch (Exception ex) {
            return new ArrayList<Venda>();
        }
        return resultado;
    }

    public List<VendaProduto> obterVendasProdutos(int vendaId) {
        List<VendaProduto> resultado = new ArrayList<VendaProduto>();
        try {
            Class.forName("org.postgresql.Driver");
            Connection connection = DriverManager.getConnection(JDBC_URL, JDBC_USUARIO, JDBC_SENHA);
            PreparedStatement statement = connection.prepareStatement("SELECT venda_id, produto_id, quantidade FROM venda_produto WHERE venda_id = ?");
            statement.setInt(1, vendaId);
            ResultSet resultSet = statement.executeQuery();
            ProdutoDAO produtoDAO = new ProdutoDAO();
            while (resultSet.next()) {
                VendaProduto vendaProduto = new VendaProduto();
                vendaProduto.setVendaId(resultSet.getInt("venda_id"));
                vendaProduto.setProdutoId(resultSet.getInt("produto_id"));
                vendaProduto.setQuantidade(resultSet.getInt("quantidade"));
                vendaProduto.setProduto(produtoDAO.obterProduto(vendaProduto.getProdutoId()));
                resultado.add(vendaProduto);
            }
            resultSet.close();
            statement.close();
            connection.close();
        } catch (Exception ex) {
            return new ArrayList<VendaProduto>();
        }
        return resultado;
    }

    public boolean excluir(int vendaId) {
        boolean resultado = false;
        try {
            excluirVendaProduto(vendaId);
            Class.forName("org.postgresql.Driver");
            Connection connection = DriverManager.getConnection(JDBC_URL, JDBC_USUARIO, JDBC_SENHA);
            PreparedStatement preparedStatement = connection.prepareStatement("DELETE FROM venda WHERE id = ?");
            preparedStatement.setInt(1, vendaId);
            resultado = (preparedStatement.executeUpdate() > 0);
            preparedStatement.close();
            connection.close();
        } catch (Exception ex) {
            return false;
        }
        return resultado;
    }

    public boolean excluirProdutoDaVendaProduto(int produtoId) {
        boolean resultado = false;
        try {
            Class.forName("org.postgresql.Driver");
            Connection connection = DriverManager.getConnection(JDBC_URL, JDBC_USUARIO, JDBC_SENHA);
            PreparedStatement preparedStatement = connection.prepareStatement("DELETE FROM venda_produto WHERE produto_id = ?");
            preparedStatement.setInt(1, produtoId);
            resultado = (preparedStatement.executeUpdate() > 0);
            preparedStatement.close();
            connection.close();
        } catch (Exception ex) {
            ex.printStackTrace();
            return false;
        }
        return resultado;
    }

    public boolean excluirVendaProduto(int vendaId) {
        boolean resultado = false;
        try {
            Class.forName("org.postgresql.Driver");
            Connection connection = DriverManager.getConnection(JDBC_URL, JDBC_USUARIO, JDBC_SENHA);
            PreparedStatement preparedStatement = connection.prepareStatement("DELETE FROM venda_produto WHERE venda_id = ?");
            preparedStatement.setInt(1, vendaId);
            resultado = (preparedStatement.executeUpdate() > 0);
            preparedStatement.close();
            connection.close();
        } catch (Exception ex) {
            return false;
        }
        return resultado;
    }

    public List<Venda> obterPorUsuario(String usuario_login) {
        List<Venda> resultado = new ArrayList<Venda>();
        try {
            Class.forName("org.postgresql.Driver");
            Connection connection = DriverManager.getConnection(JDBC_URL, JDBC_USUARIO, JDBC_SENHA);
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery("SELECT id, usuario_login FROM venda WHERE usuario_login='" + usuario_login + "'");
            while (resultSet.next()) {
                Venda venda = new Venda();
                venda.setId(resultSet.getInt("id"));
                venda.setUsuarioLogin(resultSet.getString("usuario_login"));
                venda.setProdutos(obterVendasProdutos(venda.getId()));
                resultado.add(venda);
            }
            resultSet.close();
            statement.close();
            connection.close();
        } catch (Exception ex) {
            return new ArrayList<Venda>();
        }
        return resultado;
    }

}
