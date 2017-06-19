package avicit.hdkf.support.hdkfsupportoutfieldcard.controller;

import java.util.Date;

import avicit.hdkf.support.hdkfsupportoutfieldcard.dto.HdkfSupportOutfieldCardDTO;
import avicit.hdkf.support.hdkfsupportoutfieldcard.service.HdkfSupportOutfieldCardService;
import avicit.platform6.bpm.api.listener.EventListener;
import avicit.platform6.bpm.api.listener.EventListenerExecution;
import avicit.platform6.core.spring.SpringFactory;

public class KfForwardTimeUpdate implements EventListener {

	private static final long serialVersionUID = 7960241402610819033L;

	@Override
	public void notify(EventListenerExecution execution) throws Exception {
		String executionId = (String) execution.getVariable("id");

		HdkfSupportOutfieldCardService cardService = SpringFactory
				.getBean(HdkfSupportOutfieldCardService.class);

		HdkfSupportOutfieldCardDTO cardDto = cardService
				.queryHdkfSupportOutfieldCardByPrimaryKey(executionId);
		cardDto.setKfForwardTime(new Date());
		cardService.updateHdkfSupportOutfieldCardSensitive(cardDto);
	}
}
