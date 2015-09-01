package helpers;

import java.security.SecureRandom;
import java.util.Random;

/**
 * Created by Elyor on 8/11/2014.
 */

public final class StringGeneratorHelper {

    public final static String generateString(int length) {

        final StringBuffer buffer = new StringBuffer();
        final String characters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890";
        final Random random = new SecureRandom();

        for (int i = 0; i < length; i++) {
            final int index = random.nextInt(characters.length());

            buffer.append(characters.charAt(index));
        }

        return buffer.toString();
    }
}

