package test;

import java.util.List;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.plz.service.DogService;
import com.plzdog.vo.Dog;
import com.plzdog.vo.DogImage;

public class DogTest {

	public static void main(String[] args) {
		
		ApplicationContext ctx = new ClassPathXmlApplicationContext("com/plz/config/spring/model-context.xml");
		DogService service = (DogService) ctx.getBean("dogServiceImpl");
//		service.deleteDog(1); service.deleteDog(2); service.deleteDog(3); service.deleteDog(4);
//		service.insertDog(new Dog(0, "꼬미", "말티즈", "수컷", 3.8, new Date(), "soo@naver.com"));
//		service.updateDog(new Dog(4, "꼬미", "말티즈", "투컷", 3.5, new Date(), "soo@naver.com"));
//		service.insertDogImage(new DogImage("꼬미사진1", 4));
//		service.updateDogImage(new DogImage("꼬미사진100", 4), "꼬미사진1");
		/*service.deleteDogImage("꼬미사진");
		List<Dog> list = service.selectDogByEmail("soo@naver.com");
		for(Dog d : list) {
			System.out.println(d);
		}*/
		List<Dog> list = service.selectDogByEmail("soo1@naver.com");
		for(Dog dog : list) {
			System.out.println(dog);
		}
	}
}
