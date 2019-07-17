package com.gaon.scheduler;

import java.io.IOException;
import java.util.List;

import javax.inject.Inject;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.gaon.domain.member.MemberDTO;
import com.gaon.service.member.MemberService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Component
public class Scheduler {
	
	@Inject 
	private MemberService service;
	
	@Transactional
	@Scheduled(cron = "0 0 12 * * *")
	public void cronTest() throws IOException {
		List<MemberDTO> list = service.list();
		for (MemberDTO mDTO : list) {
			log.info(mDTO.toString());
		}
	}
}
