package utilities;

import com.github.javafaker.Faker;

import java.util.HashMap;
import java.util.Map;

public class SpartanDataGenerator {

    public static Map<String,Object> createSpartan(){

        Faker faker = new Faker();

        String name = faker.name().firstName();
        String gender = faker.demographic().sex();
        long phone = Long.parseLong(faker.numerify("##########"));

        Map<String,Object> newSpartan = new HashMap<>();
        newSpartan.put("name",name);
        newSpartan.put("gender",gender);
        newSpartan.put("phone",phone);

        return newSpartan;
    }

}
