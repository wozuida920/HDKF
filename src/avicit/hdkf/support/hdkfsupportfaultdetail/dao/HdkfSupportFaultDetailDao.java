package avicit.hdkf.support.hdkfsupportfaultdetail.dao;

import java.util.List;
import java.util.Map;

import avicit.platform6.core.mybatis.MyBatisRepository;
import org.apache.ibatis.annotations.Param;
import avicit.platform6.core.sfn.intercept.SelfDefined;
import avicit.platform6.core.mybatis.pagehelper.Page;
import avicit.hdkf.support.hdkfsupportfaultdetail.dto.HdkfSupportFaultDetailDTO;
/**
 * @classname: HdkfSupportFaultDetailDao
 * @description: 定义  HDKF_SUPPORT_FAULT_DETAIL 持久层 接口
 * 通过@MapperScannerConfigurer扫描目录中的所有接口, 动态在Spring Context中生成实现.
 * 方法名称必须与Mapper.xml中保持一致.
 * @author:  AVICIT DEV
 */
@MyBatisRepository
public interface HdkfSupportFaultDetailDao {
    
    /**
     * @author AVICIT DEV
     * @description: 分页查询 HDKF_SUPPORT_FAULT_DETAIL
     * @date 2014-12-26 11:13:20
     * @param searchParams
     * @return
     */
    public Page<HdkfSupportFaultDetailDTO> searchHdkfSupportFaultDetailByPage(@Param("bean")HdkfSupportFaultDetailDTO hdkfSupportFaultDetailDTO,@Param("sfnConditions")SelfDefined sql) ;
    
    /**
     * @author AVICIT DEV
     * @description:查询对象 HDKF_SUPPORT_FAULT_DETAIL
     * @date 2014-12-26 11:13:20
     * @param searchParams
     * @return
     */
    public List<HdkfSupportFaultDetailDTO> searchHdkfSupportFaultDetail(HdkfSupportFaultDetailDTO hdkfSupportFaultDetailDTO);

    /**
     * @author AVICIT DEV
     * @description:查询对象 HDKF_SUPPORT_FAULT_DETAIL
     * @date 2014-12-26 11:13:20
     * @param id
     * @return
     */
    public HdkfSupportFaultDetailDTO findHdkfSupportFaultDetailById(String id);
    
        /**
     * @author AVICIT DEV
     * @description: 新增对象 HDKF_SUPPORT_FAULT_DETAIL
     * @date 2014-12-26 11:13:20
     * @param paramMap
     * @return
     */
    public int insertHdkfSupportFaultDetail(HdkfSupportFaultDetailDTO hdkfSupportFaultDetailDTO);
    
    /**
     * @author AVICIT DEV
     * @description: 更新对象 HDKF_SUPPORT_FAULT_DETAIL
     * @date 2014-12-26 11:13:20
     * @param paramMap
     */
    public int updateHdkfSupportFaultDetailSensitive(HdkfSupportFaultDetailDTO hdkfSupportFaultDetailDTO);
    
    /**
     * @author AVICIT DEV
     * @description: 更新对象 HDKF_SUPPORT_FAULT_DETAIL
     * @date 2014-12-26 11:13:20
     * @param paramMap
     */
    public int updateHdkfSupportFaultDetailAll(HdkfSupportFaultDetailDTO hdkfSupportFaultDetailDTO);
    
    
    /**
     * @author AVICIT DEV
     * @description: 按主键删除 HDKF_SUPPORT_FAULT_DETAIL
     * @date 2014-12-26 11:13:20
     * @param ids
     * @return
     */ 
    public int deleteHdkfSupportFaultDetailById(String id);
    
/**
 * 按机型查询
 * @description:TODO
 * @data 2015-12-17
 * @param dto
 * @return
 */
public List<HdkfSupportFaultDetailDTO> seachCsmpFmFaultreportToFlightModelQuery(
		HdkfSupportFaultDetailDTO dto);
/**
 * 按机型分页查询
 * @description:TODO
 * @data 2015-12-17
 * @param dto
 * @return
 */
public Page<HdkfSupportFaultDetailDTO> seachFlightModelQueryFormByPage(
		HdkfSupportFaultDetailDTO searchParams);
/**
 * 按批架次查询
 * @description:TODO
 * @data 2015-12-17
 * @param dto
 * @return
 */
public Page<HdkfSupportFaultDetailDTO> seachBatchNoQueryFormByPage(
		HdkfSupportFaultDetailDTO searchParams);
/**
 * 按客戶查询
 * @description:TODO
 * @data 2015-12-17
 * @param dto
 * @return
 */
public List<HdkfSupportFaultDetailDTO> seachCsmpFmFaultreportToCustomerQuery(
		HdkfSupportFaultDetailDTO dto);
}




