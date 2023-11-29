package com.universestay.project.common;


import java.util.Objects;
import java.util.UUID;

public final class Uuid {

    private Uuid() {
    }

    /**
     * [Hashcode] 해싱 알고리즘을 이용하여 userId에 대한 해시값을 얻습니다.
     *
     * @param argument
     * @return Integer
     */
    private static Integer getHashcode(String argument) {

        return Objects.hashCode(argument);
    }

    /**
     * [임의의 숫자] MAC 주소 대신에 임의의 48비트 숫자를 생성합니다.(보안 우려로 이를 대체합니다)
     *
     * @param argument
     * @return long
     */
    private static long getUniqueBit(String argument) {
        long variant3BitFlag = 0x5000000000000000L;
        return getHashcode(argument) | variant3BitFlag;
    }

    /**
     * UUID v1을 생성하여 반환합니다.(임의의 숫자, Object.hashCode 조합)
     *
     * @param argument
     * @return String
     */
    public static String generateUUID(String argument) {
        long uniqueBit = getUniqueBit(argument);
        return new UUID(uniqueBit,
                getHashcode(argument)).toString(); // 50000000-0033-9763-0000-000000339763
    }
}
