package com.gaon.service.email;

import com.gaon.domain.email.EmailDTO;

public interface EmailService {
	public void sendMail(EmailDTO eDto);
}
