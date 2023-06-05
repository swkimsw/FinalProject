package cc.spring.commons;

import java.time.LocalDate;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.reactive.function.BodyInserters;
import org.springframework.web.reactive.function.client.WebClient;
import reactor.core.publisher.Mono;


@Controller
@RequestMapping("/chat/")
public class ChatGPTUtils {
	
	@RequestMapping("toChat")
	public String toChat() {
		return "meal/chatTest";
	}
	
	@ResponseBody
	@RequestMapping("sendMsg")
	public String sendMsg(String sendMsg){
		String apiKey = "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"; // API 키로 변경해야 합니다. 
        LocalDate today = LocalDate.now();
		String prompt = today+"로부터 3일치의 식단을 날짜를 포함한 한글 JSON 데이터로 만들어줘. 각각의 끼니는 잘 어울리면서 중복되지 않는 하나의 메인메뉴와 두 개의 서브메뉴로 구성해줘."; // 적절한 프롬프트로 변경해야 합니다.
		System.out.println(prompt);
		
        WebClient webClient = WebClient.builder()
                .baseUrl("https://api.openai.com")
                .defaultHeader("Authorization", "Bearer " + apiKey)
                .build();

        String messageJson = String.format("{\"role\":\"user\", \"content\":\"%s\"}", prompt);

        String response = webClient.post()
                .uri("/v1/chat/completions")
                .contentType(MediaType.APPLICATION_JSON)
                .body(BodyInserters.fromValue(
                        "{\"model\":\"gpt-3.5-turbo\", \"messages\":[" + messageJson + "], \"max_tokens\":500, \"temperature\":0.2}"
                ))
                .retrieve()
                .bodyToMono(String.class)
                .block();

       // response.subscribe(System.out::println);
        System.out.println(response);
		return response;
	}
	
}
