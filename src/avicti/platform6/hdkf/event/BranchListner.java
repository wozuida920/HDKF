package avicti.platform6.hdkf.event;

import avicit.hdkf.support.hdkfsupportoutfieldcard.dto.HdkfSupportOutfieldCardDTO;
import avicit.hdkf.support.hdkfsupportoutfieldcard.service.HdkfSupportOutfieldCardService;
import avicit.platform6.bpm.api.listener.EventListener;
import avicit.platform6.bpm.api.listener.EventListenerExecution;
import avicit.platform6.core.spring.SpringFactory;
//avicti.platform6.hdkf.event.BranchListner
public class BranchListner  implements EventListener{
	

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	String msg;
	@Override
	public void notify(EventListenerExecution execution) throws Exception {
		// TODO Auto-generated method stub
		String id = (String) execution.getVariable("id");
		HdkfSupportOutfieldCardService service = SpringFactory
				.getBean(HdkfSupportOutfieldCardService.class);
		//attribute03
		HdkfSupportOutfieldCardDTO dto = service.queryHdkfSupportOutfieldCardByPrimaryKey(id);
		if(msg.equals("0")||msg.equals("1")){			
			dto.setAttribute03("N");
			service.updateHdkfSupportOutfieldCardSensitive(dto);		
			
		}
		else if(msg.equals("2")){
			dto.setAttribute03("Y");
			service.updateHdkfSupportOutfieldCardSensitive(dto);
		}
	}

}
