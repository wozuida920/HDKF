package avicti.platform6.hdkf.event;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import org.apache.xml.resolver.apps.resolver;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowCallbackHandler;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import avicit.platform6.core.spring.SpringFactory;

public class BpmClientDao {
   private 	JdbcTemplate jdbcTemplate = SpringFactory.getBean(JdbcTemplate.class);
   public   String getCurUserIdByFormId(String formId){
	   String sql = "select t.USERID_ from  BPM_CLIENT_HIST_PROCINST_V  t where t.FORMID_=?";
	  return  this.jdbcTemplate.queryForObject(sql,new Object[] {formId}, java.lang.String.class);
   }
   public BpmClientBean getBpmClientBeanByFormId(String formId){
	   String sql = "select t.USERID_,t.BUSINESSSTATE_,t.ACTIVITYALIAS_,t1.ASSIGNEE_  from  BPM_CLIENT_HIST_PROCINST_V  t," +
	   		"BPM_CLIENT_HIST_TASK_V t1 where t.FORMID_ = t1.TASK_B_ID_ and t1.TASK_FINISHED_=0 and  t.FORMID_='"+formId+"'";
	   final ArrayList<BpmClientBean> colList= new ArrayList<BpmClientBean>();
	   jdbcTemplate.query(sql, new RowCallbackHandler(){

			@Override
			public void processRow(ResultSet rs) throws SQLException {
				// TODO Auto-generated method stub
				BpmClientBean bean = new BpmClientBean();
				bean.setActivityAlias(rs.getString("ACTIVITYALIAS_"));
				bean.setBusinessState(rs.getString("BUSINESSSTATE_"));
				//System.out.println("in Dao...."+rs.getString("ASSIGNEE_"));
				bean.setCurUser(rs.getString("ASSIGNEE_"));
				if(bean.getBusinessState().equals("ended"))
					bean.setCurbpmState("结束");
				else {
					bean.setCurbpmState(bean.getActivityAlias());
				}
				colList.add(bean);
			}
			
		});
	   if(colList.size()>0)
		   return colList.get(0);
	   else{
		   String sql1 = "select t.USERID_,t.BUSINESSSTATE_,t.ACTIVITYALIAS_ from  BPM_CLIENT_HIST_PROCINST_V  t" +
			   		"  where   t.FORMID_='"+formId+"'";
			   final ArrayList<BpmClientBean> colList1= new ArrayList<BpmClientBean>();
			   jdbcTemplate.query(sql1, new RowCallbackHandler(){

					@Override
					public void processRow(ResultSet rs) throws SQLException {
						// TODO Auto-generated method stub
						BpmClientBean bean = new BpmClientBean();
						bean.setActivityAlias(rs.getString("ACTIVITYALIAS_"));
						bean.setBusinessState(rs.getString("BUSINESSSTATE_"));
						//System.out.println("in Dao...."+rs.getString("ASSIGNEE_"));
						bean.setCurUser("");
						if(bean.getBusinessState().equals("ended"))
							bean.setCurbpmState("结束");
						else {
							bean.setCurbpmState(bean.getActivityAlias());
						}
						colList1.add(bean);
					}
					
				});
			   if(colList1.size()>0)
				   return colList1.get(0);
	   }
	   return null;

   }
   
}
