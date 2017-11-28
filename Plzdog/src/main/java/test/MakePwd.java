package test;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

public class MakePwd {
	public static void main(String[] args) {
		BCryptPasswordEncoder p = new BCryptPasswordEncoder();
		String str = p.encode("1111");
		System.out.println(str);
	}
}
