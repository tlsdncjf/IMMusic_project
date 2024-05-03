package com.example.demo.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartRequest;

import com.example.demo.service.PressService;
import com.example.demo.service.BoardService;
import com.example.demo.service.GenFileService;
import com.example.demo.service.ReactionPointService;
import com.example.demo.service.ReplyService;
import com.example.demo.util.Ut;
import com.example.demo.vo.Press;
import com.example.demo.vo.Board;
import com.example.demo.vo.Page;
import com.example.demo.vo.Reply;
import com.example.demo.vo.ResultData;
import com.example.demo.vo.Rq;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class UsrPressController {

	@Autowired
	private Rq rq;

	@Autowired
	private PressService pressService;

	@Autowired
	private BoardService boardService;

	@Autowired
	private ReactionPointService reactionPointService;

	@Autowired
	private ReplyService replyService;

	@Autowired
	private GenFileService genFileService;
	
	// 액션 메소드
	@RequestMapping("/usr/press/detail")
	public String getPressAction(Integer id, Model model) { // null 체크하려고 Integer로 바꿨다.

		// 그냥 article/detail 치고 들어오는 경우 체크
		if (id == null) {
			model.addAttribute("checkUrlId", "게시글 번호를 입력하세요");
			return "usr/press/detail";
		}

		// 게시글 db에서 가져오기 + 로그인 중인 아이디 권한체크까지 다 끝내고 가져온다.
		Press press = pressService.getForPrintPress(rq.getLoginedMemberId(), id);

		System.err.println(press.getTitle());
		// 댓글 db에서 가져오기
		List<Reply> replies = replyService.getForPrintReplies(rq.getLoginedMemberId(), "press", id);

		// 댓글 개수
		int repliesCount = replies.size();

		// 좋아요 싫어요 중 가능한 거 판단
		ResultData usersReactionRd = reactionPointService.usersReaction(rq.getLoginedMemberId(), "press", id);

		if (usersReactionRd.isSuccess()) {
			model.addAttribute("userCanMakeReaction", usersReactionRd.isSuccess());
		}

		model.addAttribute("press", press);
		model.addAttribute("replies", replies);
		model.addAttribute("repliesCount", repliesCount);
		// 좋아요 싫어요 기능 위한 데이터
		model.addAttribute("isAlreadyAddGoodRp",
				reactionPointService.isAlreadyAddGoodRp(rq.getLoginedMemberId(), id, "press"));
		model.addAttribute("isAlreadyAddBadRp",
				reactionPointService.isAlreadyAddBadRp(rq.getLoginedMemberId(), id, "press"));

		return "usr/press/detail";
	}

	@RequestMapping("/usr/press/doIncreaseHitCountRd")
	@ResponseBody
	public ResultData doIncreaseHitCountRd(int id) {

		// 조회수 증가
		ResultData increaseHitCountRd = pressService.increaseHitCount(id);

		// 가져올 게시글 없는 경우 체크
		if (increaseHitCountRd.isFail()) {
			return increaseHitCountRd;
		}

		ResultData rd = ResultData.newData(increaseHitCountRd, "hitCount", pressService.getPressHitCount(id));

		rd.setData2("id", id);

		return rd;
	}

	@RequestMapping("/usr/press/list")
	public String showList(Model model, @RequestParam(defaultValue = "1") int page,
			@RequestParam(defaultValue = "title,body") String searchKeywordTypeCode,
			@RequestParam(defaultValue = "") String searchKeyword) {

		// 게시글 전체 개수 구하기
		int pressesCount = pressService.getPressesCount(searchKeywordTypeCode, searchKeyword);

		Page pagination = new Page(pressesCount, page);



		// 게시판 번호로 게시글 가져오기 및 페이지네이션
		List<Press> press = pressService.getForPrintPresses(pagination.getItemsInAPage(), page,
				searchKeywordTypeCode, searchKeyword);


		model.addAttribute("press", press);
		model.addAttribute("pressesCount", pressesCount);
		model.addAttribute("page", page);
		model.addAttribute("pagination", pagination);

		return "usr/press/list";
	}

	@RequestMapping("/usr/press/modify")
	public String showModify(Integer id, Model model) {

		// 로그인 정보 가져오기
//		Rq rq = (Rq) req.getAttribute("rq");

		// 게시글 존재여부 체크
		if (id == null) {
			return rq.historyBackOnView("없는 게시글이야");
		}

		Press press = pressService.getForPrintPress(rq.getLoginedMemberId(), id);

		model.addAttribute("press", press);

		return "usr/press/modify";
	}

	// 로그인 체크 -> 유무 체크 -> 권한 체크 -> 수정
	@RequestMapping("/usr/press/doModify")
	@ResponseBody
	public String doModify(int id, String title, String body) {
		// 로그인 상태 체크 - 인터셉터에서

		Press press = pressService.getPress(id); // 해당 게시글 가져오기

		// 로그인 정보 가져오기
//		Rq rq = (Rq) req.getAttribute("rq");

		// 로그인 중인 아이디 권한체크(서비스에 요청)
		ResultData loginedMemberCanModifyRd = pressService.userCanModify(rq.getLoginedMemberId(), press);

		// 글 수정 작업
		if (loginedMemberCanModifyRd.isSuccess()) {
			pressService.modifyPress(id, title, body);
		}
		return Ut.jsReplace(loginedMemberCanModifyRd.getResultCode(), loginedMemberCanModifyRd.getMsg(),
				"../press/detail?id=" + id);
	}

	// 로그인 체크 -> 유무 체크 -> 권한 체크 -> 삭제
	@RequestMapping("/usr/press/doDelete")
	@ResponseBody
	public String doDelete(int id) {
		// 로그인 상태 체크 - 인터셉터에서

		Press press = pressService.getPress(id);

		// 게시글 존재여부 체크
		if (press == null) {
			return Ut.jsHistoryBack("F-1", Ut.f("%d번 글은 존재하지 않습니다", id));
		}

		// 로그인 정보 가져오기
//		Rq rq = (Rq) req.getAttribute("rq");

		// 로그인 중인 아이디 권한체크(서비스에 요청)
		ResultData loginedMemberCanDeleteRd = pressService.userCanDelete(rq.getLoginedMemberId(), press);

		// 글 삭제 작업
		if (loginedMemberCanDeleteRd.isSuccess()) {
			pressService.deletePress(id);
		}
		return Ut.jsReplace(loginedMemberCanDeleteRd.getResultCode(), loginedMemberCanDeleteRd.getMsg(),
				"../press/list");
	}

	@RequestMapping("/usr/press/write")
	public String showJoin(Model model) {

		int currentId = pressService.getCurrentPressId();

		model.addAttribute("currentId", currentId);
		return "usr/press/write";
	}

	@RequestMapping("/usr/press/doWrite")
	@ResponseBody
	public String doWrite(HttpServletRequest req, int boardId, String title, String body, String replaceUri,
			MultipartRequest multipartRequest) {
		// 로그인 상태 체크 - 인터셉터에서

		// 제목 내용 빈 칸 확인
		if (Ut.isNullOrEmpty(title)) {
			return Ut.jsHistoryBack("F-1", "제목을 입력해주세요");
		}
		if (Ut.isNullOrEmpty(body)) {
			return Ut.jsHistoryBack("F-2", "내용을 입력해주세요");
		}

		// 로그인 정보 가져오기
//		Rq rq = (Rq) req.getAttribute("rq");

		// 게시글 작성 작업
		ResultData<Integer> writePressRd = pressService.writePress(title, body, rq.getLoginedMemberId(), boardId);

		// 작성된 게시글 번호 가져오기
		int id = (int) writePressRd.getData1();
		System.err.println("multipartRequest: " + multipartRequest);
		
		// 이미지 업로드
		Map<String, MultipartFile> fileMap = multipartRequest.getFileMap();

		System.err.println("fileMap" + fileMap);
		
		for (String fileInputName : fileMap.keySet()) {
			MultipartFile multipartFile = fileMap.get(fileInputName);

			if (multipartFile.isEmpty() == false) {
				genFileService.save(multipartFile, id);
			}
		}

		return Ut.jsReplace(writePressRd.getResultCode(), writePressRd.getMsg(), "../press/detail?id=" + id);
	}

}
