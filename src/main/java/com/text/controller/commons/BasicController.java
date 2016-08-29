package com.text.controller.commons;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BasicController {
	
	static Logger log = LoggerFactory.getLogger(BasicController.class);
	
	@RequestMapping("/demo")
	String demo() {
		return "demo";
	}
}
