package com.universestay.project;


import lombok.AllArgsConstructor;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
import lombok.ToString;


@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
//@RequiredArgsConstructor
@EqualsAndHashCode
@ToString
//@Data
public class LombokTestClass {

    private String name;
    private String age;

}

class initLombok {
    public static void main(String[] args) {
        LombokTestClass lombok1 = new LombokTestClass();

        // setter
        lombok1.setName("nick");
        lombok1.setAge("30");

        // getter
        System.out.println(lombok1.getName()); // nick
        System.out.println(lombok1.getAge()); // 30

        // equals
        LombokTestClass lombok2 = new LombokTestClass("nick", "30");
        System.out.println("lombok1.equals(lombok2) = " + lombok1.equals(lombok2)); // lombok1.equals(lombok2) = true
        
        // hashcode
        System.out.println("lombok1.hashCode() = " + lombok1.hashCode()); // lombok1.hashCode() = 199489479
        System.out.println("lombok2.hashCode() = " + lombok2.hashCode()); // lombok2.hashCode() = 199489479

        // toString
        System.out.println(lombok1.toString()); // LombokTestClass(name=nick, age=30)
    }

}
