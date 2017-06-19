package avicit.csmp.basicData.csmpbdsparepart.service;

import org.springframework.stereotype.Component;

import avicit.platform6.core.excel.imp.inf.IExcelImportUrl;

@Component(value = "CsmpBdSparepartImpl")
public class CsmpBdImpl implements IExcelImportUrl {
		@Override
		public String getUrl() {
			// 返回执行导入的controller
			return "platform/csmp/basicData/AxcelImportController/import";
		}
	
}
