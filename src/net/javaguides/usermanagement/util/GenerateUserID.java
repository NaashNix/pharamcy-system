package net.javaguides.usermanagement.util;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.UUID;

public class GenerateUserID {
    public String generateNewId(){
        LocalDateTime localDateTime = LocalDateTime.now();
        DateTimeFormatter format = DateTimeFormatter.ofPattern("ssddMMyyyymmHH");
        return localDateTime.format(format);
    }
}
