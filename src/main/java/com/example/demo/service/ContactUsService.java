package com.example.demo.service;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.repository.ContactUsRepository;
import com.example.demo.vo.ContactArtist;
import com.example.demo.vo.ContactConcert;
import com.example.demo.vo.ResultData;

import net.nurigo.sdk.NurigoApp;
import net.nurigo.sdk.message.exception.NurigoMessageNotReceivedException;
import net.nurigo.sdk.message.model.Message;
import net.nurigo.sdk.message.service.DefaultMessageService;

@Service
public class ContactUsService {

	@Autowired
	private ContactUsRepository contactUsRepository;

	// 문자메시지에 날짜 입력
	LocalDateTime now = LocalDateTime.now();
	DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
	String timestamp = now.format(formatter);

	public ResultData<Integer> signup(String name, String fullemail, String cellphoneNum, String concertdate,
			String postcode, String fulladdress, String inquiry, int check) {

		contactUsRepository.signup(name, fullemail, cellphoneNum, concertdate, postcode, fulladdress, inquiry, check);
		int id = contactUsRepository.getLastInsertId();

		return ResultData.from("S-1", "연주문의가 완료되었습니다", "id", id);
	}

	public ResultData<Integer> join(String name, String birth, String gender, String cellphoneNum, String fullemail,
			String postcode, String fulladdress, String major, String sns, String introduction, int check) {

		contactUsRepository.join(name, birth, gender, cellphoneNum, fullemail, postcode, fulladdress, major, sns,
				introduction, check);
		int id = contactUsRepository.getLastInsertId();

		return ResultData.from("S-1", "연주자 가입신청이 완료되었습니다.", "id", id);
	}

	public int getCurrentPressId() {
		return contactUsRepository.getCurrentPressId();
	}

	public void sendjoinMessage(String cellphoneNum, String name) {

		String text = name + "님의 가입신청이 완료되었습니다.\n" + "검토 후 연락드리겠습니다.\n" + "- IMMusic&Art -";
		if (cellphoneNum.equals("01030841288")) {
			text = name + "님의 가입신청이 완료되었습니다.\n" + "확인바랍니다.\n" + "- IMMusic&Art -";
		}

		DefaultMessageService messageService = NurigoApp.INSTANCE.initialize("api_key", "secret_key",
				"https://api.coolsms.co.kr");

		LocalDateTime now = LocalDateTime.now();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
		String timestamp = now.format(formatter);

		// Message 패키지가 중복될 경우 net.nurigo.sdk.message.model.Message로 치환하여 주세요
		Message message = new Message();

		message.setFrom("01030841288");
		message.setTo(cellphoneNum);
		message.setText(name + "님의 연주자 가입신청이 완료되었습니다.\n" + "검토 후 연락드리겠습니다.\n" + "- IMMusic&Art -");

		try {
			// send 메소드로 ArrayList<Message> 객체를 넣어도 동작합니다!
			messageService.send(message);
		} catch (NurigoMessageNotReceivedException exception) {
			// 발송에 실패한 메시지 목록을 확인할 수 있습니다!
			System.out.println(exception.getFailedMessageList());
			System.out.println(exception.getMessage());
		} catch (Exception exception) {
			System.out.println(exception.getMessage());
		}
	}

	public void sendsignupMessage(String cellphoneNum, String name) {

		String text = name + "님의 연주문의가 완료되었습니다.\n" + "검토 후 연락드리겠습니다.\n" + "- IMMusic&Art -";
		if (cellphoneNum.equals("01030841288")) {
			text = name + "님의 연주문의가 완료되었습니다.\n" + "확인바랍니다.\n" + "- IMMusic&Art -";
		}

		DefaultMessageService messageService = NurigoApp.INSTANCE.initialize("api_key", "secret_key",
				"https://api.coolsms.co.kr");

		// Message 패키지가 중복될 경우 net.nurigo.sdk.message.model.Message로 치환하여 주세요
		Message message = new Message();

		message.setFrom("01030841288");
		message.setTo(cellphoneNum);
		message.setText(text);

		try {
			// send 메소드로 ArrayList<Message> 객체를 넣어도 동작합니다!
			messageService.send(message);
		} catch (NurigoMessageNotReceivedException exception) {
			// 발송에 실패한 메시지 목록을 확인할 수 있습니다!
			System.out.println(exception.getFailedMessageList());
			System.out.println(exception.getMessage());
		} catch (Exception exception) {
			System.out.println(exception.getMessage());
		}

	}

	public void sendsignupMessageToAdmin(String cellphoneNum, String name) {

		sendsignupMessage(cellphoneNum, name);

	}

	public void sendjoinMessageToAdmin(String cellphoneNum, String name) {

		sendjoinMessage(cellphoneNum, name);
	}

	public List<ContactArtist> getContactArtistList() {

		List<ContactArtist> contactArtists = contactUsRepository.getContactArtistList();

		return contactArtists;
	}

	public List<ContactConcert> getContactConcertList() {

		List<ContactConcert> contactConcerts = contactUsRepository.getContactConcertList();

		return contactConcerts;
	}

}