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
	    System.out.println(". ˚\r\n"
	    		+ "*  * 　　　 ⊹  ˚  .    　　.\r\n"
	    		+ "⊹  ·  ✧ 　　　*    *\r\n"
	    		+ ". 　　  ⊹  ✦  　 ✵  　　　　　*\r\n"
	    		+ "* .　  ·"
	    		);

		Scanner scanner = new Scanner(System.in);
		
		while (true) {
			System.out.println();
			System.out.println("✧····················*﹡❋ ❋ ❋﹡*····················✧");
			System.out.println("  [1] 전체 회원 조회 [2] 회원정보 삭제 [3] 회원가입 [4] 나가기  ");
			System.out.println("✧····················*﹡❋ ❋ ❋﹡*····················✧");
			String command = scanner.nextLine();

			if ("1".equals(command)) { // R
				doList();
			} else if ("2".equals(command)) { // D
				/* 이메일 존재 여부 검토 코드 필요 */
				System.out.print("삭제하실 이메일을 입력하세요: ");
				String email = scanner.nextLine(); // 이메일
				doDelete(email);
			} else if ("3".equals(command)) { // C
				/* 이메일 형식 검토 코드 필요 */
				System.out.print("성 >> ");
				String firstName = scanner.nextLine(); // 성
				System.out.print("이름 >> ");
				String lastName = scanner.nextLine(); // 이름
				System.out.print("이메일 >> ");
				String email = scanner.nextLine(); // 이메일
				doInsert(firstName, lastName, email);
			} else if ("4".equals(command)) {
				System.out.println("✿°•∘ɷ∘•°✿ ... ✿°•∘ɷ∘•°✿ 또 봐요 ✿°•∘ɷ∘•°✿ ... ✿°•∘ɷ∘•°✿");
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
		System.out.println("。　♡ 。　　♡。　　♡\r\n"
				+ "♡。　＼　　｜　　／。　♡\r\n"
				+ "　 "+vo.getLastName()+"님! 환영합니다!\r\n"
				+ "♡。　／　　｜　　＼。　♡\r\n"
				+ "。　♡。 　　。　　♡"
				+ "");
	}

	private static void doDelete(String email) {
		EmaillistDao dao = new EmaillistDao();
		dao.deleteByEmail(email);
		System.out.println(vo.getLastName() + "님의 회원정보가 삭제되었습니다...");
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

    private static void doList() {
        List<EmaillistVo> result = dao.findAll();
        System.out.println("▐░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░▌");
        for (EmaillistVo vo : result) {
            System.out.println(" [" + vo.getNo() + "] " + vo.getFirstName() + " " + vo.getLastName() + " (" + vo.getEmail() + ")");
            System.out.println("▐░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░▌");
        }
    }
}
