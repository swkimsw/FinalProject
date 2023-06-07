package cc.spring.commons;

import java.time.LocalDate;
import java.util.Map;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.MediaType;
import org.springframework.http.converter.json.Jackson2ObjectMapperBuilder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.reactive.function.BodyInserters;
import org.springframework.web.reactive.function.client.WebClient;

import com.google.gson.Gson;
import com.google.gson.JsonObject;


@Controller
@RequestMapping("/chat/")
public class ChatGPTUtils {
	
	@Value("${CHATGPT-KEY}")
	private String chatGptApiKey;
	
	
	@RequestMapping("toChat")
	public String toChat() {
		return "meal/chatTest";
	}
	
	@ResponseBody
	@RequestMapping(value="sendMsg", produces="text/plain;charset=utf-8")
	public String sendMsg(String sendMsg){
		String apiKey = chatGptApiKey; // API 키로 변경해야 합니다. 
        String prompt = "식단 하루치를 json데이터로 짜줘"; // 적절한 프롬프트로 변경해야 합니다.

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
        Gson g = new Gson();
        Map<String> map = g.fromJson(response, Map<String>);
		return response;
	}
	
}
