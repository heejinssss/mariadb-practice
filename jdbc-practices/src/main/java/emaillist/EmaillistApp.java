package emaillist;

import java.util.List;
import java.util.Scanner;

import emaillist.dao.EmaillistDao;
import emaillist.vo.EmaillistVo;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class EmaillistApp {
	private static EmaillistVo vo = new EmaillistVo();
	private static EmaillistDao dao = new EmaillistDao();

	public static void main(String[] args) {
		enterMessage();
		Scanner scanner = new Scanner(System.in);
		
		while (true) {
			selectMessage();
			String command = scanner.nextLine();

			if ("1".equals(command)) { // Read
				doList();
			} else if ("2".equals(command)) { // Delete
				/* 이메일 존재 여부 검토 코드 필요 */
				log("삭제하실 이메일을 입력하세요: ");
				String email = scanner.nextLine();
				doDelete(email);
			} else if ("3".equals(command)) { // Create
				/* 이메일 형식 검토 코드 필요 */
				log("성 >> ");
				String firstName = scanner.nextLine();
				log("이름 >> ");
				String lastName = scanner.nextLine();
				log("이메일 >> ");
				String email = scanner.nextLine();
				doInsert(firstName, lastName, email);
			} else if ("4".equals(command)) {
				goodbyeMessage();
				break;
			}
		}

		scanner.close();
	}

	private static void doInsert(String firstName, String lastName, String email) {
		vo.setFirstName(firstName);
		vo.setLastName(lastName);
		vo.setEmail(email);
		dao.insert(vo);
		welcomeMessage(vo.getLastName());
	}

	private static void doDelete(String email) {
		dao.deleteByEmail(email);
		System.out.println("⋆ ˚｡⋆୨ ʚ " + vo.getLastName() + " ɞ ୧⋆ ˚｡⋆" + "님의 회원 정보가 삭제되었습니다.");
		comebackMessage();
	}

	private static void doList() {
		List<EmaillistVo> result = dao.findAll();
		System.out.println();
        System.out.println("▐░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░▌");
        for (EmaillistVo vo : result) {
            System.out.println(" [" + vo.getNo() + "] " + vo.getFirstName() + " " + vo.getLastName() + " (" + vo.getEmail() + ")");
            System.out.println("▐░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░▌");
		}
	}

	private static void selectMessage() {
		System.out.println();
		System.out.println("✧····················*﹡❋ ❋ ❋﹡*····················✧");
		System.out.println("  [1] 전체 회원 조회 [2] 회원정보 삭제 [3] 회원가입 [4] 나가기  ");
		System.out.println("✧····················*﹡❋ ❋ ❋﹡*····················✧");
	}

	private static void log(String message) {
		System.out.print(message);
	}

	private static void enterMessage() {
	    System.out.println(". ˚\r\n"
	    		+ "*  * 　　　 ⊹  ˚  .    　　.\r\n"
	    		+ "⊹  ·  ✧ 　　　*    *\r\n"
	    		+ ". 　　  ⊹  ✦  　 ✵  　　　　　*\r\n"
	    		+ "* .　  ·"
		);
	}

	private static void welcomeMessage(String name) {
		System.out.println();
		System.out.println("。　♡ 。　　♡。　　♡\r\n"
				+ "♡。　＼　　｜　　／。　♡\r\n"
				+ "　 "+name+"님! 환영합니다!\r\n"
				+ "♡。　／　　｜　　＼。　♡\r\n"
				+ "。　♡。 　　。　　♡"
				+ "");
	}
	
	private static void comebackMessage() {
		System.out.println(".");
		System.out.println(".");
		System.out.println(".");
		System.out.println("　　　가\r\n"
				+ "　　 아\r\n"
				+ "　　　지\r\n"
				+ "　　　　마\r\n"
				+ "　　　　 ㅇ\r\n"
				+ "　　　　ㅏ\r\n"
				+ "　 ヽ＼　 /／\r\n"
				+ "　　　 ,､,､　ﾟ｡\r\n"
				+ "　 ﾟ　(ﾟﾛﾟ)っ\r\n"
				+ "　　　(っﾉ\r\n"
				+ "　　　 `Ｊ"
		);
	}

	private static void goodbyeMessage() {
		System.out.println("✿°•∘ɷ∘•°✿ ... ✿°•∘ɷ∘•°✿ 또 봐요 ✿°•∘ɷ∘•°✿ ... ✿°•∘ɷ∘•°✿");
	    System.out.println(". ˚\r\n"
	    		+ "*  * 　　　 ⊹  ˚  .    　　.\r\n"
	    		+ "⊹  ·  ✧ 　　　*    *\r\n"
	    		+ ". 　　  ⊹  ✦  　 ✵  　　　　　*\r\n"
	    		+ "* .　  ·"
		);
	}
}
