package example;

import com.github.javafaker.Faker;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Date;


public class DataBaseConnection {
    public static void main(String[] args) {
        Connection connection = null;
        PreparedStatement statement = null;
        Faker faker = new Faker();
        try {

            Class.forName("org.postgresql.Driver");

            String url = "jdbc:postgresql://localhost:5432/postgres";
            String username = "postgres";
            String password = "";

            connection = DriverManager.getConnection(url, username, password);
            System.out.println("Открыли");

            String query = "INSERT INTO fan (first_name, last_name, patronymic, birth_date, profession, nationality, phone_number, email) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
            statement = connection.prepareStatement(query);


            for (int i = 0; i < 1000; i++) {
                String name = faker.name().firstName();
                String lastName = faker.name().lastName();
                String patronymic = faker.name().firstName();
                Date birth_date = faker.date().birthday();
                String profession = faker.job().title();
                String nationality = faker.nation().nationality();
                String phone_number = faker.phoneNumber().phoneNumber();
                String email = faker.internet().emailAddress();
                statement.setString(1, name);
                statement.setString(2,lastName);
                statement.setString(3, patronymic);
                java.sql.Date sqlDate = new java.sql.Date(birth_date.getTime());
                statement.setDate(4, sqlDate);
                statement.setString(5, profession);
                statement.setString(6,nationality);
                statement.setString(7,phone_number);
                statement.setString(8,email);
                statement.executeUpdate();
            }

            connection.close();
            System.out.println("ЗАкрыли");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
