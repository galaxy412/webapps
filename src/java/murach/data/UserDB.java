package murach.data;

import java.io.*;
import murach.business.User;

public class UserDB {

    private static final String FILE_NAME = "email_list.csv"; 

    public static void insert(User user) {
        try {

            FileWriter fw = new FileWriter(FILE_NAME, true);
            PrintWriter out = new PrintWriter(fw);
            
            out.println(user.getFirstName() + ","
                      + user.getLastName() + ","
                      + user.getEmail());
            
            out.close();
        } catch (IOException e) {

            System.err.println(e);

        }
    }

}