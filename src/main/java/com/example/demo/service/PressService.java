package com.example.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.repository.PressRepository;
import com.example.demo.util.Ut;
import com.example.demo.vo.Press;
import com.example.demo.vo.ResultData;

@Service
public class PressService {

	@Autowired
	private PressRepository pressRepository;

	public PressService(PressRepository pressRepository) {
		this.pressRepository = pressRepository;
	}

	// 서비스 메서드
	public ResultData<Integer> writePress(String title, String body, int loginedMemberId, int boardId) {
		pressRepository.writePress(title, body, loginedMemberId, boardId);
		int id = pressRepository.getLastInsertId();
		return ResultData.from("S-1", Ut.f("%d번 글이 생성되었습니다", id), "id", id);
	}

	public void deletePress(int id) {
		pressRepository.deletePress(id);
	}

	public void modifyPress(int id, String title, String body) {
		pressRepository.modifyPress(id, title, body);
	}

	public Press getPress(int id) {
		return pressRepository.getPress(id);
	}

	public List<Press> getPresses() {
		return pressRepository.getPresses();
	}

	// 게시판 번호로 가져오기 및 페이지네이션
	public List<Press> getForPrintPresses(int itemsInAPage, int page, String searchKeywordTypeCode,
			String searchKeyword) {
		int limitFrom = (page - 1) * itemsInAPage;
		int limitTake = itemsInAPage;

		return pressRepository.getForPrintPresses(limitFrom, limitTake, searchKeywordTypeCode,
				searchKeyword);
	}

	// 게시글 전체 개수 구하기
	public int getPressesCount(String searchKeywordTypeCode, String searchKeyword) {
		return pressRepository.getPressesCount(searchKeywordTypeCode, searchKeyword);
	}

	// 게시글 가져와서 아이디 권한체크 메소드 실행
	public Press getForPrintPress(int loginedMemberId, int id) {
		Press press = pressRepository.getForPrintPress(id);

		controlForPrintPress(loginedMemberId, press);

		return press;
	}
	
//	public List<Press> getAllPrintPress() {
//		
//		List<Press> press = pressRepository.getAllPrintPress();
//		
//		return press;
//	}

	// PressVO에다가 참,거짓값 심어주기 -> jsp 수정,삭제 버튼 권한체크용
	private void controlForPrintPress(int loginedMemberId, Press press) {
		if (press == null) {
			return;
		}
		ResultData userCanModifyRd = userCanModify(loginedMemberId, press);
		press.setUserCanModify(userCanModifyRd.isSuccess());

		ResultData userCanDeleteRd = userCanDelete(loginedMemberId, press);
		press.setUserCanDelete(userCanDeleteRd.isSuccess());
	}

	// 가져온 게시글 번호와 로그인 중인 아이디 권한체크
	public ResultData userCanModify(int loginedMemberId, Press press) {

		if (press.getMemberId() != loginedMemberId) {
			return ResultData.from("F-2", Ut.f("%d번 글에 대한 수정 권한이 없습니다", press.getId()));
		}
		return ResultData.from("S-1", Ut.f("%d번 글을 수정했습니다", press.getId()));
	}

	public ResultData userCanDelete(int loginedMemberId, Press press) {

		if (press.getMemberId() != loginedMemberId) {
			return ResultData.from("F-2", Ut.f("%d번 글에 대한 삭제 권한이 없습니다", press.getId()));
		}

		return ResultData.from("S-1", Ut.f("%d번 글이 삭제 되었습니다", press.getId()));
	}

	// 조회수 증가
	public ResultData increaseHitCount(int id) {
		int affectedRow = pressRepository.increaseHitCount(id);

		if (affectedRow == 0) {
			return ResultData.from("F-1", "해당 게시물 없음", "id", id);
		}

		return ResultData.from("S-1", "해당 게시물 조회수 증가", "id", id);
	}

	// 조회수 개수
	public Object getPressHitCount(int id) {
		return pressRepository.getPressHitCount(id);
	}

	// 좋아요 증가
	public ResultData increaseGoodReactionPoint(int relId) {
		int affectedRow = pressRepository.increaseGoodReactionPoint(relId);

		if (affectedRow == 0) {
			return ResultData.from("F-1", "없는 게시물");
		}

		return ResultData.from("S-1", "좋아요 증가", "affectedRow", affectedRow);
	}

	// 싫어요 증가
	public ResultData increaseBadReactionPoint(int relId) {
		int affectedRow = pressRepository.increaseBadReactionPoint(relId);

		if (affectedRow == 0) {
			return ResultData.from("F-1", "없는 게시물");
		}

		return ResultData.from("S-1", "싫어요 증가", "affectedRow", affectedRow);
	}

	// 좋아요 취소
	public ResultData decreaseGoodReactionPoint(int relId) {
		int affectedRow = pressRepository.decreaseGoodReactionPoint(relId);

		if (affectedRow == 0) {
			return ResultData.from("F-1", "없는 게시물");
		}

		return ResultData.from("S-1", "좋아요 감소", "affectedRow", affectedRow);
	}

	// 싫어요 취소
	public ResultData decreaseBadReactionPoint(int relId) {
		int affectedRow = pressRepository.decreaseBadReactionPoint(relId);

		if (affectedRow == 0) {
			return ResultData.from("F-1", "없는 게시물");
		}

		return ResultData.from("S-1", "싫어요 감소", "affectedRow", affectedRow);
	}

	public int getGoodRP(int relId) {
		return pressRepository.getGoodRP(relId);
	}

	public int getBadRP(int relId) {
		return pressRepository.getBadRP(relId);
	}
	
	public int getCurrentPressId() {
		return pressRepository.getCurrentPressId();

	}

}