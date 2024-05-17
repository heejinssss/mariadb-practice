package emaillist.dao;

import static org.junit.jupiter.api.Assertions.assertTrue;

import org.junit.jupiter.api.Order;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.TestMethodOrder;
import org.junit.jupiter.api.MethodOrderer;

import emaillist.vo.EmaillistVo;

@TestMethodOrder(MethodOrderer.OrderAnnotation.class)
public class EmailListDaoTest {

	@Test
	@Order(1)
	public void testInsert() {
		EmaillistVo vo = new EmaillistVo();
		vo.setFirstName("우즈마키");
		vo.setLastName("나루토");
		vo.setEmail("naruto@gmail.com");

		boolean result = new EmaillistDao().insert(vo);
		assertTrue(result);
	}

	@Test
	@Order(2)
	public void testDeleteByEmail() {
		boolean result = new EmaillistDao().deleteByEmail("naruto@gmail.com");
		assertTrue(result);
	}
}
