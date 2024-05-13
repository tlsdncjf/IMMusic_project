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
	public ResultData<Integer> writePress(String title, String body) {
		pressRepository.writePress(title, body);
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

		controlForPrintData(loginedMemberId, press);

		return press;
	}
	
	private void controlForPrintData(Integer loginedMemberId, Press press) {
		
		ResultData userCanModifyRd = userCanModify(loginedMemberId, press);
		press.setUserCanModify(userCanModifyRd.isSuccess());
		
		ResultData userCanDeleteRd = userCanDelete(loginedMemberId, press);
		press.setUserCanDelete(userCanDeleteRd.isSuccess());

	}
	
	public ResultData userCanModify(Integer loginedMemberId, Press press) {

		//System.err.println("loginedMemberId: " + loginedMemberId);
		if (loginedMemberId == 0) {
			return ResultData.from("F-2", Ut.f("%d번 글에 대한 권한이 없습니다", press.getId()));
		}

		return ResultData.from("S-1", Ut.f("%d번 글을 수정했습니다", press.getId()));
	}

	public ResultData userCanDelete(Integer loginedMemberId, Press press) {

		if (loginedMemberId == 0) {
			return ResultData.from("F-2", Ut.f("%d번 글에 대한 수정 권한이 없습니다", press.getId()));
		}

		return ResultData.from("S-1", "글이 삭제 되었습니다");
	}
	
	public int getCurrentPressId() {
		return pressRepository.getCurrentPressId();

	}

}