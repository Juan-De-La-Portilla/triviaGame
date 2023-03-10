package trivia.game.DAO;

import trivia.game.modelos.Pregunta;
import trivia.game.modelos.Respuesta;
import trivia.game.util.ExcepcionSQL;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class RespuestaDAO implements DAO<Respuesta> {
    private Connection conn;

    public RespuestaDAO(Connection conn) {
        this.conn = conn;
    }

    @Override
    public List<Respuesta> buscar() {
        List<Respuesta> respuestas = new ArrayList<>();
        try (Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery("SELECT r.*, p.pregunta_contenido from public.respuesta r inner join pregunta p on r.pregunta_id = p.pregunta_id")) {
            while (rs.next()) {
                Respuesta respuesta = getRespuesta(rs);
                respuestas.add(respuesta);
            }
        } catch (SQLException e) {
            throw new ExcepcionSQL(e.getMessage(), e.getCause());
        }
        return respuestas;
    }

    @Override
    public Respuesta buscarPorId(Long id) {
        Respuesta respuesta = null;
        try (PreparedStatement stmt = conn.prepareStatement("SELECT r.*, p.pregunta_contenido from public.respuesta r inner join pregunta p on r.pregunta_id = p.pregunta_id where respuesta_id=?")) {
            stmt.setLong(1, id);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    respuesta = getRespuesta(rs);
                }
            }
        } catch (SQLException e) {
            throw new ExcepcionSQL(e.getMessage(), e.getCause());
        }
        return respuesta;
    }

    public ArrayList<Respuesta> buscarPorPregunta(Long id) {
        ArrayList<Respuesta> respuestas = new ArrayList<>();
        try (PreparedStatement stmt = conn.prepareStatement("SELECT * from public.respuesta where pregunta_id=? ORDER BY random()")) {
            stmt.setLong(1, id);

            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    Respuesta respuesta = new Respuesta();

                    respuesta.setId(rs.getLong("respuesta_id"));
                    respuesta.setContenido(rs.getString("respuesta_contenido"));
                    respuesta.setEsCorrecta(rs.getInt("es_correcta"));

                    respuestas.add(respuesta);
                }
            }
        } catch (SQLException e) {
            throw new ExcepcionSQL(e.getMessage(), e.getCause());
        }
        return respuestas;
    }

    @Override
    public void modificar(Respuesta respuesta) {
        String sql;
        if (respuesta.getId() != null && respuesta.getId() > 0) {
            sql = "update public.respuesta set pregunta_id=?, respuesta_contenido=?, es_correcta=? where respuesta_id=?";
        } else {
            sql = "insert into public.respuesta (pregunta_id, respuesta_contenido, es_correcta) values (?,?,?)";
        }

        try (PreparedStatement pst = conn.prepareStatement(sql)) {
            pst.setLong(1, respuesta.getPregunta().getId());
            pst.setString(2, respuesta.getContenido());
            pst.setInt(3, respuesta.getEsCorrecta());
            if (respuesta.getId() != null && respuesta.getId() > 0) {
                pst.setLong(4, respuesta.getId());
            }
            pst.executeUpdate();
        } catch (SQLException e) {
            throw new ExcepcionSQL(e.getMessage(), e.getCause());
        }
    }

    @Override
    public void eliminar(Long id) {
        try (PreparedStatement stmt = conn.prepareStatement("delete from public.respuesta where respuesta_id=?")) {
            stmt.setLong(1, id);
            stmt.executeUpdate();
        } catch (SQLException e) {
            throw new ExcepcionSQL(e.getMessage(), e.getCause());
        }
    }

    public static Respuesta getRespuesta(ResultSet rs) throws SQLException {
        Respuesta r = new Respuesta();
        Pregunta p = new Pregunta();
        r.setId(rs.getLong("respuesta_id"));
        p.setId(rs.getLong("pregunta_id"));
        p.setContenido(rs.getString("pregunta_contenido"));
        r.setPregunta(p);
        r.setContenido(rs.getString("respuesta_contenido"));
        r.setEsCorrecta(rs.getInt("es_correcta"));
        return r;
    }
}
