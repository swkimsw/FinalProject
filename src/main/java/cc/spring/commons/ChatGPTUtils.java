package cc.spring.commons;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.reactive.function.BodyInserters;
import org.springframework.web.reactive.function.client.WebClient;

import reactor.core.publisher.Mono;


@Controller
@RequestMapping("/chat/")
public class ChatGPTUtils {
	
	@RequestMapping("sendMsg")
	public Mono<String> sendMsg(String sendMsg){
		String apiKey = "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"; // API 키로 변경해야 합니다. 
        String prompt = "다이어트 식단 하루치를 json데이터로 짜줘"; // 적절한 프롬프트로 변경해야 합니다.

        WebClient webClient = WebClient.builder()
                .baseUrl("https://api.openai.com")
                .defaultHeader("Authorization", "Bearer " + apiKey)
                .build();

        String messageJson = String.format("{\"role\":\"user\", \"content\":\"%s\"}", prompt);

        Mono<String> response = webClient.post()
                .uri("/v1/chat/completions")
                .contentType(MediaType.APPLICATION_JSON)
                .body(BodyInserters.fromValue(
                        "{\"model\":\"gpt-3.5-turbo\", \"messages\":[" + messageJson + "], \"max_tokens\":500, \"temperature\":0.2}"
                ))
                .retrieve()
                .bodyToMono(String.class);

        response.subscribe(System.out::println);
		return response;
	}
	
}
