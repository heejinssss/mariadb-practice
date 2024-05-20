package emaillist.dao;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertTrue;

import java.util.List;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.MethodOrderer;
import org.junit.jupiter.api.Order;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.TestMethodOrder;

import emaillist.vo.EmaillistVo;

@TestMethodOrder(MethodOrderer.OrderAnnotation.class)
public class EmailListDaoTest {

	private static int count = 0;

	@BeforeAll
	public static void setUp() {
		List<EmaillistVo> list = new EmaillistDao().findAll();
		count = list.size(); // 기존 테이블 row 개수 저장
	}

	@Test
	@Order(1)
	public void testInsert() {
		EmaillistVo vo = new EmaillistVo();
		vo.setFirstName("우즈마키");
		vo.setLastName("나루토");
		vo.setEmail("naruto@gmail.com");
		
//		new EmaillistDao().insert(vo);
//		assertNotNull(vo.getNo());
		
		boolean result = new EmaillistDao().insert(vo);
		assertTrue(result);
	}

	@Test
	@Order(2)
	public void testFindAll() {
		List<EmaillistVo> list = new EmaillistDao().findAll();
		assertEquals(count + 1, list.size()); // 인스턴스 추가 성공 여부 확인
	}

	@Test
	@Order(3)
	public void testDeleteByEmail() {
		boolean result = new EmaillistDao().deleteByEmail("naruto@gmail.com");
		assertTrue(result);
	}

	@AfterAll
	public static void cleanup() {
		// 자원 정리
	}
}
