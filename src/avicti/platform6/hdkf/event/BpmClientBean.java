package avicti.platform6.hdkf.event;

public class BpmClientBean {
private String curUser,businessState,activityAlias,curbpmState;

public String getCurbpmState() {
	return curbpmState;
}

public void setCurbpmState(String curbpmState) {
	this.curbpmState = curbpmState;
}

public String getCurUser() {
	return curUser;
}

public void setCurUser(String curUser) {
	this.curUser = curUser;
}

public String getBusinessState() {
	return businessState;
}

public void setBusinessState(String businessState) {
	this.businessState = businessState;
}

public String getActivityAlias() {
	return activityAlias;
}

public void setActivityAlias(String activityAlias) {
	this.activityAlias = activityAlias;
}
}
