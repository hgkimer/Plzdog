import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

public class MakePwd {
	public static void main(String[] args) {
		BCryptPasswordEncoder e = new BCryptPasswordEncoder();
		System.out.println(e.encode("1111"));
	}
}
