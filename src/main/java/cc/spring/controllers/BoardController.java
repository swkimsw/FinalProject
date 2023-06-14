package cc.spring.controllers;



import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import cc.spring.dto.BoardAnnouncementDTO;
import cc.spring.dto.BoardFreeDTO;
import cc.spring.dto.BoardReviewDTO;
import cc.spring.services.BoardService;
import cc.spring.services.FileService;

@Controller
@RequestMapping("/board/")
public class BoardController {

	@Autowired
	private BoardService boardservice;

	@Autowired
	private FileService fileservice;

	@Autowired
	private HttpSession session;
	
	
	
		    private ServletContext servletContext;


	    @Autowired
	    public BoardController(ServletContext servletContext) {
	        this.servletContext = servletContext;
	    }
	
	@Autowired
	private HttpServletRequest request;
	
	
	


	//자유게시판으로 가기
	@RequestMapping("free")
	public String list_free() {
		String user =  (String)session.getAttribute("loginID"); //로그인한 사람의 세션 가져오기 (관리자 빼고 모두 글 작성할수있는 버튼보여야함)
		request.setAttribute("user", user); 
		return "/board/boardFree";
	}

	//공지게시판으로 가기
	@RequestMapping("announcement")
	public String list_Announcement() {
		String user =  (String)session.getAttribute("loginID"); //로그인한 사람의 세션 가져오기 (관리자만 글 작성할수있는 버튼보여야함)
		request.setAttribute("user", user); 
		return "/board/boardAnnouncement";
	}

	//후기게시판으로 가기
	@RequestMapping("review")
	public String list_review() {
		String user =  (String)session.getAttribute("loginID"); //로그인한 사람의 세션 가져오기 (일반회원만 글 작성할수있는 버튼보여야함)
		request.setAttribute("user", user); 
		return "/board/boardReview";
	}

//===============================================================================
	//자유게시판 글 작성 으로 가기
	@RequestMapping("freeWrite")
	public String free_write() {
		return "/board/boardFreeWrite";
	}

	//공지게시판 글 작성 으로 가기
	@RequestMapping("announcementWrite")
	public String announcement_write() {
		return "/board/boardAnnouncementWrite";
	}

	//후기게시판 글 작성 으로 가기
	@RequestMapping("reviewWrite")
	public String review_write() {
		return "/board/boardReviewWrite";
	}

//===============================================================================
	
	//자유게시판 글 작성하기
	@RequestMapping("inputFree")
	public String inputFree(BoardFreeDTO dto) {
		
		String writer =  (String)session.getAttribute("loginID"); //로그인한 사람의 세션 가져오기 (일반회원)
		boardservice.insertFree(dto,writer);
		return "redirect:/board/free"; //자유게시판으로 가기
	}
		
	
	//공지게시판 글 작성하기
		@RequestMapping("inputAnnouncement")
		public String inputAnnouncement(BoardAnnouncementDTO dto) {
			
			String writer = (String)session.getAttribute("loginID"); //로그인한 사람의 세션 가져오기 (일반회원)
			boardservice.insertAnnouncement(dto,writer);
			return "redirect:/board/announcement"; //자유게시판으로 가기
		}

		
		
		
		
	//후기게시판 글 작성하기
	@RequestMapping("inputReview")
	public String inputReview(BoardReviewDTO dto ,MultipartFile[]  file_list) throws Exception {

		String writer =  (String)session.getAttribute("loginID"); //로그인한 사람의 세션 가져오기 (일반회원)

		int parent_seq = boardservice.selectReviewSeq(); //후기 게시판 작성할때 작성되는 글의 고유 번호 가져오기

		boardservice.insertReview(dto,writer,parent_seq); //후기 게시판 작성

		String realPath = session.getServletContext().getRealPath("contentFile"); //사진 집어넣기(파일)
		System.out.println(realPath);
		fileservice.insertReviewImage(realPath,file_list,parent_seq) ;

		return "redirect: /board/review" ;
	}
	
	@PostMapping("uploadImage")
	@ResponseBody
	public List<UploadImageResponse> uploadImage(@RequestParam("image") MultipartFile[] images) {
	  List<UploadImageResponse> responses = new ArrayList<>();

	  for (MultipartFile image : images) {
	    if (image != null && !image.isEmpty()) {
	      try {
	        String originalFilename = image.getOriginalFilename();
	        System.out.println(originalFilename); //
	        
	        String extension = StringUtils.getFilenameExtension(originalFilename);
	        System.out.println(extension);
	        
	        String fileName = UUID.randomUUID().toString() + "." + extension;
	        System.out.println(fileName);
	        
	        String uploadPath = servletContext.getRealPath("/contentImg");
	        System.out.println(uploadPath);

	        File uploadDir = new File(uploadPath);
	        if (!uploadDir.exists()) {
	          uploadDir.mkdirs();
	        }

	        String filePath = uploadPath + File.separator + fileName;

	        image.transferTo(new File(filePath));

	        String imageUrl = servletContext.getContextPath() + "/contentImg/" + fileName;
	        responses.add(new UploadImageResponse(imageUrl));
	        System.out.println(imageUrl);
	        
	      } catch (Exception e) {
	        e.printStackTrace();
	      }
	    } else {
	      responses.add(new UploadImageResponse(null));
	    }
	  }

	  return responses;
	}

	
	

 
}
    

