// This class is a part of the 4th "sprint" of the database labs
// running in Saint-Petersburg Academic University in Fall'16
//
// Author: Dmitry Barashev
// License: WTFPL

import com.j256.ormlite.dao.Dao;
import com.j256.ormlite.dao.DaoManager;
import com.j256.ormlite.jdbc.JdbcConnectionSource;
import com.j256.ormlite.misc.TransactionManager;
import com.j256.ormlite.stmt.QueryBuilder;
import com.j256.ormlite.support.DatabaseConnection;
import spark.Request;
import spark.Response;
import spark.Route;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.concurrent.Callable;
import java.util.stream.Collectors;

import static spark.Spark.get;
import static spark.Spark.port;

public class WebApp {
    private static JdbcConnectionSource createConnectionSource() {
        try {
            JdbcConnectionSource connectionSource = new JdbcConnectionSource(
                    "jdbc:postgresql://localhost:12345/postgres?user=postgres&password=foobar"
            );
            connectionSource.getReadWriteConnection(null).setAutoCommit(false);
            return connectionSource;
        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }
    }

    private static Object runTxn(String isolationLevel, JdbcConnectionSource connectionSource, Callable<Object> code)
            throws SQLException, IOException {
        try {
            DatabaseConnection connection = connectionSource.getReadWriteConnection(null);
            Callable<Object> txnWrapper = () -> {
                connection.executeStatement(
                        "set transaction isolation level " + isolationLevel, DatabaseConnection.DEFAULT_RESULT_FLAGS);
                Object result = code.call();
                connection.commit(null);
                return result;
            };
            return TransactionManager.callInTransaction(
                    connection, false, new ProxyDatabaseType(connectionSource.getDatabaseType()), txnWrapper);
        } finally {
            connectionSource.close();
        }
    }

    private static Object getAllDrugs(Request req, Response resp) throws IOException, SQLException {
        final JdbcConnectionSource connectionSource = createConnectionSource();
        resp.type("text/plain; charset=utf-8");
        return runTxn("REPEATABLE READ", connectionSource, () -> {
            Dao<Drug, ?> drugDao = DaoManager.createDao(connectionSource, Drug.class);
            QueryBuilder<Drug, ?> drugQueryBuilder = drugDao.queryBuilder();
            Dao<DosageForm, ?> dosageFormDao = DaoManager.createDao(connectionSource, DosageForm.class);
            QueryBuilder<DosageForm, ?> dosageFormQueryBuilder = dosageFormDao.queryBuilder();
            drugQueryBuilder.join(dosageFormQueryBuilder);

            List<String> drugs = drugQueryBuilder
                    .query()
                    .stream()
                    .map(Drug::toString)
                    .collect(Collectors.toList());
            return String.join("\n", drugs);
        });
    }

    private static Object addNewDrug(Request req, Response resp) throws IOException, SQLException {
        final JdbcConnectionSource connectionSource = createConnectionSource();
        Object success = runTxn("READ COMMITTED", connectionSource, () -> {
            DosageForm dosageForm;
            /* get dosage form */ {
                Dao<DosageForm, ?> dosageFormDao = DaoManager.createDao(connectionSource, DosageForm.class);
                List<DosageForm> list = dosageFormDao
                        .queryForEq("name", req.queryMap("dosage").value());
                if (list.size() == 0) {
                    resp.status(418);
                    return String.format("Wrong dosage form '%s'!", req.queryMap("dosage").value());
                }
                dosageForm = list.get(0);
            }
            Dao<Drug, ?> drugDao = DaoManager.createDao(connectionSource, Drug.class);
            Drug newDrug = new Drug(
                    req.queryMap("trade_name").value(),
                    req.queryMap("inn").value(),
                    dosageForm,
                    null,
                    null
            );
            drugDao.create(newDrug);
            return true;
        });
        if (Boolean.TRUE.equals(success)) {
            resp.redirect("/drug/all");
            return null;
        }
        resp.status(500);
        return "Transaction failed";
    }

    public static void main(String[] args) {
        port(8000);
        get("/drug/all", WebApp.withTry(WebApp::getAllDrugs));
        get("/drug/new", WebApp.withTry(WebApp::addNewDrug));
    }

    private static Route withTry(Route route) {
        return (req, resp) -> {
            try {
                return route.handle(req, resp);
            } catch (Throwable e) {
                e.printStackTrace();
                resp.status(500);
                return "<h1>\uD83D\uDE31</h1>" + e.getMessage();
            }
        };
    }
}
