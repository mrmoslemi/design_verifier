package utils;

import org.jetbrains.annotations.NotNull;

public class IntegerParser {
    @NotNull
    public static Integer parseInt(@NotNull String number) {
        if (number.matches("[0-9]+")) {
            return Integer.parseInt(number);
        } else if (number.matches("0x[0-9A-Fa-f]+")) {
            String toParse = number.substring(2).toLowerCase();
            int toReturn = 0;
            for (int i = 0; i < toParse.length(); i++) {
                toReturn *= 16;
                char current = toParse.charAt(i);
                int toAdd = 0;
                switch (current) {
                    case '0':
                        toAdd = 0;
                        break;
                    case '1':
                        toAdd = 1;
                        break;
                    case '2':
                        toAdd = 2;
                        break;
                    case '3':
                        toAdd = 3;
                        break;
                    case '4':
                        toAdd = 4;
                        break;
                    case '5':
                        toAdd = 5;
                        break;
                    case '6':
                        toAdd = 6;
                        break;
                    case '7':
                        toAdd = 7;
                        break;
                    case '8':
                        toAdd = 8;
                        break;
                    case '9':
                        toAdd = 9;
                        break;
                    case 'a':
                        toAdd = 10;
                        break;
                    case 'b':
                        toAdd = 11;
                        break;
                    case 'c':
                        toAdd = 12;
                        break;
                    case 'd':
                        toAdd = 13;
                        break;
                    case 'e':
                        toAdd = 14;
                        break;
                    case 'f':
                        toAdd = 15;
                        break;
                }
                toReturn += toAdd;
            }
            return toReturn;
        }
        throw new NumberFormatException(number);
    }
}
