package avicit.csmp.basicData.csmpbdsparepart.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.ServletRequestUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import avicit.csmp.basicData.csmpbdsparepart.dto.CsmpBdSparepartDTO;
import avicit.csmp.basicData.csmpbdsparepart.service.CsmpBdSparepartService;
import avicit.csmp.basicData.csmpbdsparepart.service.ExcelExcutorImpl;
import avicit.platform6.api.session.SessionHelper;
import avicit.platform6.commons.utils.ComUtil;
import avicit.platform6.commons.utils.JsonHelper;
import avicit.platform6.core.excel.imp.ExcelImport;
import avicit.platform6.core.excel.imp.inf.ImportOpt;
import avicit.platform6.core.excel.imp.inf.Validate;
import avicit.platform6.modules.system.excelimport.orguser.AbstractExcelImport;

import com.fasterxml.jackson.core.type.TypeReference;

@Controller
@Scope("prototype")
@RequestMapping(value = "csmp/basicData/AxcelImportController")
public class AxcelImportController extends AbstractExcelImport {

	@Autowired
	private CsmpBdSparepartService service;

	@RequestMapping(value = "/import",method = RequestMethod.POST)
	public Map<String, String> exportImport(HttpServletRequest request) throws Exception {
		Map<String, String> map = new HashMap<String, String>(2);
		String datas = ServletRequestUtils.getStringParameter(request, "datas","");
		Map<String, String> param = JsonHelper.getInstance().readValue(datas,
				new TypeReference<HashMap<String, String>>() {
				});
		// 创建公共Excel导入器
		ExcelImport excelImport = new ExcelImport();

		// 添加导入执行需要的参数
		excelImport.setInfo(param);
		// 创建业务自己的导入执行器
		// 用户导入执行器该类是自己创建的
		ExcelExcutorImpl employeeApplyInfoExecutor = new ExcelExcutorImpl("用户导入");
		excelImport.setExcutor(employeeApplyInfoExecutor);
		// 验证器
		
		Validate name = new Validate() {
			@Override
			public String getErrorMag() {
				// TODO Auto-generated method stub
				return "该产品名称不能重复！";
			}
			//需要验证的字段
			@Override
			public String getField() {
				// TODO Auto-generated method stub
				return "productName";
			}
			//返回true说明有错，返回false说明没错
			@Override
			public boolean validate(Object value) {
			CsmpBdSparepartDTO csmpBd = new CsmpBdSparepartDTO();
				csmpBd.setProductName(value.toString());
			 int num=	service.findcsmpBdSparepartDTO(csmpBd);
			 if(num>0){
				 return true;
			 }
				return false/*sysUserLoader.checkUserNo(value.toString())*/;
			}


		};
		employeeApplyInfoExecutor.addValidate(name);
		
		/*
		 * Validate v = new Validate() {
		 * 
		 * @Override public boolean validate(Object arg0) { return false; }
		 * 
		 * @Override public String getField() { // TODO Auto-generated method
		 * stub return null; }
		 * 
		 * @Override public String getErrorMag() { // TODO Auto-generated method
		 * stub return null; } }; // 把验证器添加到执行器中
		 * employeeApplyInfoExecutor.addValidate(v);
		 */

		// 为执行器添加持久化方法
		employeeApplyInfoExecutor.setImportOpt(new ImportOpt() {

			@Override
			public void import2Db(Map<String, Object> data) throws Exception {
				System.out.println(data);
				// 把map对象转换为json字符串
				String str = JsonHelper.getInstance().writeValueAsString(data);
				// json对象转换为对象
				CsmpBdSparepartDTO dto = JsonHelper.getInstance().readValue(str,CsmpBdSparepartDTO.class);
				dto.setId(ComUtil.getId());
				service.insertCsmpBdSparepart(dto);

			}
		});
		excelImport.importExcel();
		// 保存导入记录到数据中
		super.generate2Db(excelImport.getResult(),
				SessionHelper.getApplicationId(),
				SessionHelper.getSystemDefaultLanguageCode(request),
				SessionHelper.getLoginName(request));
		map.put("flag", "success");
		map.put("msg", excelImport.getResult().getMessage());
		return map;

	}
}
