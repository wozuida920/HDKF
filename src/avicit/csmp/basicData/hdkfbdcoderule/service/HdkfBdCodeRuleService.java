package avicit.csmp.basicData.hdkfbdcoderule.service;

import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;
import java.util.Locale;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import avicit.platform6.commons.utils.ComUtil;
import avicit.platform6.commons.utils.PojoUtil;
import avicit.platform6.core.properties.PlatformConstant.OpType;
import avicit.platform6.core.exception.DaoException;
import avicit.platform6.core.sfn.intercept.SelfDefinedQuery;
import avicit.platform6.core.mybatis.pagehelper.Page;
import avicit.platform6.core.mybatis.pagehelper.PageHelper;
import avicit.platform6.core.rest.msg.QueryReqBean;
import avicit.platform6.core.rest.msg.QueryRespBean;
import avicit.csmp.basicData.csmpbdaricarftmodel.dao.CsmpBdAricarftmodelDao;
import avicit.csmp.basicData.csmpbdaricarftmodel.dto.CsmpBdAricarftmodelDTO;
import avicit.csmp.basicData.hdkfbdcoderule.dao.HdkfBdCodeRuleDao;
import avicit.csmp.basicData.hdkfbdcoderule.dto.HdkfBdCodeRuleDTO;
import avicit.hdkf.support.hdkfsupportrequestinfo.dao.HdkfSupportRequestInfoDao;
import avicit.hdkf.support.hdkfsupportrequestinfo.dto.HdkfSupportRequestInfoDTO;
import avicit.platform6.modules.system.syslog.service.SysLogUtil;

/**
 * @classname: HdkfBdCodeRuleService
 * @description: 定义 HDKF_BD_CODE_RULE实现类
 * @author: AVICIT DEV
 */
@Service
public class HdkfBdCodeRuleService implements Serializable {

	private static final Logger logger = LoggerFactory
			.getLogger(HdkfBdCodeRuleService.class);

	private static final long serialVersionUID = 1L;

	@Autowired
	private HdkfBdCodeRuleDao dao;

	@Autowired
	private HdkfSupportRequestInfoDao requestInfoDao;

	@Autowired
	private CsmpBdAricarftmodelDao aricarftModeDao;

	// 外场前缀
	private static final String OUTFIELD_CARD_PREFIX = "LC";

	// 任务书前缀
	private static final String TASK_PREFIX = "WR";

	private static final String FAX_INFO_PREFIX = "DC";

	// 自定义编码连接符
	private static final String STRING_CONNECTIVES = "-";

	/**
	 * 按条件分页查询
	 * 
	 * @param queryReqBean
	 * @return
	 * @throws Exception
	 */
	public QueryRespBean<HdkfBdCodeRuleDTO> searchHdkfBdCodeRuleByPage(
			QueryReqBean<HdkfBdCodeRuleDTO> queryReqBean, String sfnConditions)
			throws Exception {
		try {
			PageHelper.startPage(queryReqBean.getPageParameter());
			HdkfBdCodeRuleDTO searchParams = queryReqBean.getSearchParams();
			SelfDefinedQuery sdc = new SelfDefinedQuery(sfnConditions, "t1");
			Page<HdkfBdCodeRuleDTO> dataList = dao.searchHdkfBdCodeRuleByPage(
					searchParams, sdc.parseSql());
			QueryRespBean<HdkfBdCodeRuleDTO> queryRespBean = new QueryRespBean<HdkfBdCodeRuleDTO>();

			queryRespBean.setResult(dataList);
			return queryRespBean;
		} catch (DaoException e) {
			logger.error("searchHdkfBdCodeRuleByPaging出错：", e);
			throw e;
		}
	}

	/**
	 * 按条件查询，不分页
	 * 
	 * @param queryReqBean
	 * @return
	 * @throws Exception
	 */
	public List<HdkfBdCodeRuleDTO> searchHdkfBdCodeRule(
			QueryReqBean<HdkfBdCodeRuleDTO> queryReqBean) throws Exception {
		try {
			HdkfBdCodeRuleDTO searchParams = queryReqBean.getSearchParams();
			List<HdkfBdCodeRuleDTO> dataList = dao
					.searchHdkfBdCodeRule(searchParams);
			return dataList;
		} catch (Exception e) {
			logger.error("searchHdkfBdCodeRule出错：", e);
			throw new DaoException("", e);
		}
	}

	/**
	 * 通过主键查询单条记录
	 * 
	 * @param id
	 * @param logBase
	 * @return
	 * @throws Exception
	 */
	public HdkfBdCodeRuleDTO queryHdkfBdCodeRuleByPrimaryKey(String id)
			throws Exception {
		try {
			HdkfBdCodeRuleDTO dto = dao.findHdkfBdCodeRuleById(id);
			// 记录日志
			SysLogUtil.log4Query(dto);
			return dto;
		} catch (Exception e) {
			logger.error("searchHdkfBdCodeRule出错：", e);
			throw new DaoException("", e);
		}
	}

	/**
	 * 新增对象
	 * 
	 * @param dto
	 * @param logBase
	 * @return
	 * @throws Exception
	 */
	public String insertHdkfBdCodeRule(HdkfBdCodeRuleDTO dto) throws Exception {
		try {
			String id = ComUtil.getId();
			dto.setId(id);
			PojoUtil.setSysProperties(dto, OpType.insert);
			dao.insertHdkfBdCodeRule(dto);
			// 记录日志
			SysLogUtil.log4Insert(dto);
			return id;
		} catch (Exception e) {
			logger.error("insertHdkfBdCodeRule出错：", e);
			throw new DaoException("", e);
		}
	}

	/**
	 * 修改对象全部字段
	 * 
	 * @param dto
	 * @param logBase
	 * @return
	 * @throws Exception
	 */
	public int updateHdkfBdCodeRule(HdkfBdCodeRuleDTO dto) throws Exception {
		// 记录日志
		HdkfBdCodeRuleDTO old = findById(dto.getId());
		SysLogUtil.log4Update(dto, old);
		PojoUtil.setSysProperties(dto, OpType.update);
		PojoUtil.copyProperties(old, dto, true);
		int ret = dao.updateHdkfBdCodeRuleAll(old);
		if (ret == 0) {
			throw new DaoException("数据失效，请从新更新");
		}
		return ret;

	}

	/**
	 * 修改对象部分字段
	 * 
	 * @param dto
	 * @param logBase
	 * @return
	 * @throws Exception
	 */
	public int updateHdkfBdCodeRuleSensitive(HdkfBdCodeRuleDTO dto)
			throws Exception {
		try {
			// 记录日志
			HdkfBdCodeRuleDTO old = findById(dto.getId());
			SysLogUtil.log4Update(dto, old);
			PojoUtil.setSysProperties(dto, OpType.update);
			PojoUtil.copyProperties(old, dto, true);
			int count = dao.updateHdkfBdCodeRuleSensitive(old);
			if (count == 0) {
				throw new DaoException("数据失效，请从新更新");
			}
			return count;
		} catch (Exception e) {
			logger.error("searchDemoBusinessTrip出错：", e);
			throw new DaoException("", e);
		}

	}

	/**
	 * 按主键单条删除
	 * 
	 * @param id
	 * @param logBase
	 * @return
	 * @throws Exception
	 */
	public int deleteHdkfBdCodeRuleById(String id) throws Exception {
		if (StringUtils.isEmpty(id))
			throw new Exception("删除失败！传入的参数主键为null");
		try {
			// 记录日志
			SysLogUtil.log4Delete(findById(id));
			return dao.deleteHdkfBdCodeRuleById(id);
		} catch (Exception e) {
			logger.error("deleteHdkfBdCodeRule出错：", e);
			throw new DaoException("", e);
		}
	}

	/**
	 * 批量删除数据
	 * 
	 * @param ids
	 *            id的数组
	 * @return
	 * @throws Exception
	 */
	public int deleteHdkfBdCodeRuleByIds(String[] ids) throws Exception {
		int result = 0;
		for (String id : ids) {
			deleteHdkfBdCodeRuleById(id);
			result++;
		}
		return result;
	}

	/**
	 * 日志专用，内部方法，不再记录日志
	 */
	private HdkfBdCodeRuleDTO findById(String id) throws Exception {
		try {
			HdkfBdCodeRuleDTO dto = dao.findHdkfBdCodeRuleById(id);
			return dto;
		} catch (DaoException e) {
			logger.error("findHdkfBdCodeRule出错：", e);
			throw e;
		}
	}

	// api取值与自动生成固定年份
	public String getAutomicCode(String codeType, String modelId,
			String requestId) throws Exception {
		if (codeType.equals("B") || codeType.equals("C")
				|| codeType.equals("D")) {
			HdkfSupportRequestInfoDTO requestInfoDto = requestInfoDao
					.findHdkfSupportRequestInfoById(requestId);
			if (requestInfoDto != null) {
				modelId = requestInfoDto.getModelId();
			}
		}
		String modelNum = "";
		CsmpBdAricarftmodelDTO aricarftModeDto = aricarftModeDao
				.findCsmpBdAricarftmodelById(modelId);
		if (aricarftModeDto != null) {
			modelNum = aricarftModeDto.getModelNum();
		}
		try {
			HdkfBdCodeRuleDTO searchParams1 = new HdkfBdCodeRuleDTO();
			searchParams1.setCodeType(codeType);
			searchParams1.setAttribute01(modelNum);
			List<HdkfBdCodeRuleDTO> dataList1 = dao
					.searchHdkfBdCodeRule(searchParams1);
			HdkfBdCodeRuleDTO dto = new HdkfBdCodeRuleDTO();
			dto = dataList1.get(0);
			return this.getDynamicCode(codeType, dto.getPlaneCode());
			// String stringCodetype=dto.getCodeType().toString();
			/* String stringPlanecode = dto.getPlaneCode(); */
			/*
			 * String stringCuryear = dto.getCurYear(); String stringMaxno =
			 * Long.toString(dto.getMaxNo()); if (stringMaxno.length() == 1) {
			 * stringMaxno = "00" + stringMaxno; } if (stringMaxno.length() ==
			 * 2) { stringMaxno = "0" + stringMaxno; }
			 */

			/* System.out.println(codeType); */
			/* StringBuffer buffer = null; */
			/*
			 * if (codeType.equals("A")) { buffer = new StringBuffer();
			 * buffer.append(stringPlanecode).append(stringCuryear)
			 * .append(stringMaxno);
			 * 
			 * } if (codeType.equals("B")) { buffer = new StringBuffer();
			 * buffer.append(stringPlanecode).append(stringCuryear)
			 * .append(stringMaxno); } if (codeType.equals("C")) { buffer = new
			 * StringBuffer();
			 * buffer.append(stringPlanecode).append(stringCuryear)
			 * .append(stringMaxno); }
			 */

			/*
			 * dto.setMaxNo(dto.getMaxNo() + 1);
			 * updateHdkfBdCodeRuleSensitive(dto); return buffer.toString();
			 */
		} catch (DaoException e) {
			logger.error("findHdkfBdCodeRule出错：", e);
			throw e;
		}
	}

	// API动态分配年份dynamic
	public String getDynamicCode(String codeType, String planeCode)
			throws Exception {
		try {

			Calendar sysCurtime = Calendar.getInstance();
			int intsysCurtime = sysCurtime.get(Calendar.YEAR);

			HdkfBdCodeRuleDTO searchParams1 = new HdkfBdCodeRuleDTO();
			searchParams1.setCodeType(codeType);
			searchParams1.setPlaneCode(planeCode);
			List<HdkfBdCodeRuleDTO> dataList1 = dao
					.searchHdkfBdCodeRule(searchParams1);
			HdkfBdCodeRuleDTO dto = new HdkfBdCodeRuleDTO();
			String regex = "[\u4E00-\u9FA5]+";

			if (planeCode.matches(regex)) {
				planeCode = ChToEn.cn2pytoEn(planeCode);

			}

			dto = dataList1.get(0);
			dto = dataList1.get(0);

			String stringMaxno = Long.toString(dto.getMaxNo());
			if (stringMaxno.length() == 1) {
				stringMaxno = "00" + stringMaxno;
			}
			if (stringMaxno.length() == 2) {
				stringMaxno = "0" + stringMaxno;
			}

			StringBuffer stringCode = new StringBuffer();
			if (codeType.equals("A")) {
				// 信息卡
				String stringCuryear = null;
				int intCuryear = Integer.valueOf(dto.getCurYear()).intValue();
				if (intsysCurtime > intCuryear) {
					dto.setCurYear(String.valueOf(intsysCurtime));
					stringCuryear = dto.getCurYear();
				} else {
					stringCuryear = dto.getCurYear();
				}

				stringCode.append(planeCode).append(stringCuryear)
						.append(stringMaxno);
			}

			if (codeType.equals("B")) {

				String stringCuryear = null;
				int intCuryear = Integer.valueOf(dto.getCurYear()).intValue();
				if (intsysCurtime > intCuryear) {
					dto.setCurYear(String.valueOf(intsysCurtime));
					stringCuryear = dto.getCurYear();
				} else {
					stringCuryear = dto.getCurYear();
				}

				stringCode.append(OUTFIELD_CARD_PREFIX).append(planeCode)
						.append(STRING_CONNECTIVES).append(stringCuryear)
						.append(stringMaxno);
			}

			if (codeType.equals("C") || codeType.equals("D")) {
				String stringCuryear = dto.getCurYear();
				String yearLast = null;
				int intCuryear = Integer.valueOf(dto.getCurYear()).intValue();
				if (intsysCurtime > intCuryear) {
					yearLast = new SimpleDateFormat("yy", Locale.CHINESE)
							.format(Calendar.getInstance().getTime());

				} else {
					yearLast = stringCuryear.substring(2);
				}
				if (codeType.equals("C")) {
					stringCode.append(TASK_PREFIX).append(planeCode)
							.append(STRING_CONNECTIVES).append(yearLast)
							.append(stringMaxno);
				} else if (codeType.equals("D")) {
					stringCode.append(FAX_INFO_PREFIX).append(planeCode)
							.append(STRING_CONNECTIVES).append(yearLast)
							.append(stringMaxno);
				}
			}

			for (HdkfBdCodeRuleDTO o : dataList1) {

				o.setMaxNo(o.getMaxNo() + 1);
				updateHdkfBdCodeRuleSensitive(o);
			}
			return stringCode.toString();

		} catch (DaoException e) {
			logger.error("findHdkfBdCodeRule出错：", e);
			throw e;
		}
	}

}
