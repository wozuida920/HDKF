package avicit.hdkf.support.hdkfsupportoutfieldcard.controller;

import java.util.Date;

import avicit.hdkf.support.hdkfsupportoutfieldcard.dto.HdkfSupportOutfieldCardDTO;
import avicit.hdkf.support.hdkfsupportoutfieldcard.service.HdkfSupportOutfieldCardService;
import avicit.platform6.bpm.api.listener.EventListener;
import avicit.platform6.bpm.api.listener.EventListenerExecution;
import avicit.platform6.core.spring.SpringFactory;

public class SendtoKfTimeUpdate implements EventListener {

	private static final long serialVersionUID = 753679955844847954L;

	@Override
	public void notify(EventListenerExecution execution) throws Exception {
		String executionId = (String) execution.getVariable("id");

		HdkfSupportOutfieldCardService cardService = SpringFactory
				.getBean(HdkfSupportOutfieldCardService.class);

		HdkfSupportOutfieldCardDTO cardDto = cardService
				.queryHdkfSupportOutfieldCardByPrimaryKey(executionId);
		cardDto.setSendtoKfTime(new Date());
		if(cardDto.getDoneTime()==null)
			cardDto.setDoneTime(new Date());
		cardService.updateHdkfSupportOutfieldCardSensitive(cardDto);		
	}

}
