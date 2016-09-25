package com.github.sourcecase.jooqwithdocker.example;

import org.jooq.DSLContext;
import org.jooq.Record;
import org.jooq.Result;
import org.jooq.SQLDialect;
import org.jooq.impl.DSL;

import java.sql.Connection;
import java.sql.DriverManager;

import static com.github.sourcecase.jooqwithdocker.codegen.Tables.AUTHOR;


/**
 * Created by chris on 25.09.16.
 */
public class Query {

    public static void main(String[] args) {

        String userName = "root";
        String password = "mysqlroot";
        String url = "jdbc:mysql://localhost:3306/library";

        try (Connection conn = DriverManager.getConnection(url, userName, password)) {
            DSLContext create = DSL.using(conn, SQLDialect.MYSQL);
            Result<Record> result = create.select().from(AUTHOR).fetch();

            for (Record r : result) {
                Integer id = r.getValue(AUTHOR.ID);
                String firstName = r.getValue(AUTHOR.FIRST_NAME);
                String lastName = r.getValue(AUTHOR.LAST_NAME);

                System.out.println("ID: " + id + " first name: " + firstName + " last name: " + lastName);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

    }
}
