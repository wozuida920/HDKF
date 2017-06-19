package avicit.hdkf.support.hdkfsupportpersondetail.dao;

import java.util.List;

import avicit.platform6.core.mybatis.MyBatisRepository;

import org.apache.ibatis.annotations.Param;
import avicit.platform6.core.sfn.intercept.SelfDefined;
import avicit.platform6.core.mybatis.pagehelper.Page;
import avicit.hdkf.support.hdkfsupportborrowpersoninf.dto.HdkfSupportBorrowPersonInfDTO;
import avicit.hdkf.support.hdkfsupportpersondetail.dto.HdkfSupportPersonDetailDTO;
/**
 * @classname:  HdkfSupportPersonDetailDao
 * @description: 定义  HDKF_SUPPORT_PERSON_DETAIL 持久层 接口
 * 通过@MapperScannerConfigurer扫描目录中的所有接口, 动态在Spring Context中生成实现.
 * 方法名称必须与Mapper.xml中保持一致.
 * @author:   AVICIT DEV
 */
@MyBatisRepository
public interface HdkfSupportPersonDetailDao {
	/**
     * @author AVICIT DEV
     * @description: 根据borrowInfoId查询与之关联的HdkfSupportBorrowPersonInfDTO
     * @date 2014-12-26 11:13:20
     * @param borrowInfoId
     * @return
     */
	public List<HdkfSupportPersonDetailDTO> searchHdkfSupportPersonDetailByParentId(String borrowInfoId);
	
    /**
     * @author AVICIT DEV
     * @description: 分页查询HDKF_SUPPORT_PERSON_DETAIL
     * @date 2014-12-26 11:13:20
     * @param searchParams
     * @return
     */
    public Page<HdkfSupportPersonDetailDTO> searchHdkfSupportPersonDetailByPage(@Param("bean")HdkfSupportPersonDetailDTO hdkfSupportPersonDetailDTO,@Param("sfnConditions")SelfDefined sql) ;
    
  
    /**
     * @author AVICIT DEV
     * @description:查询对象 HDKF_SUPPORT_PERSON_DETAIL
     * @date 2014-12-26 11:13:20
     * @param id
     * @return
     */
    public HdkfSupportPersonDetailDTO findHdkfSupportPersonDetailById(String id);
    
         /**
     * @author AVICIT DEV
     * @description: 新增对象HDKF_SUPPORT_PERSON_DETAIL
     * @date 2014-12-26 11:13:20
     * @param paramMap
     * @return
     */
    public int insertHdkfSupportPersonDetail(HdkfSupportPersonDetailDTO hdkfSupportPersonDetailDTO);
    
    /**
     * @author AVICIT DEV
     * @description: 更新对象HDKF_SUPPORT_PERSON_DETAIL
     * @date 2014-12-26 11:13:20
     * @param paramMap
     */
    public int updateHdkfSupportPersonDetailSensitive(HdkfSupportPersonDetailDTO hdkfSupportPersonDetailDTO);
    
    /**
     * @author AVICIT DEV
     * @description: 更新对象HDKF_SUPPORT_PERSON_DETAIL
     * @date 2014-12-26 11:13:20
     * @param paramMap
     */
    public int updateHdkfSupportPersonDetailAll(HdkfSupportPersonDetailDTO hdkfSupportPersonDetailDTO);
    
    
    /**
     * @author AVICIT DEV
     * @description: 按主键删除HDKF_SUPPORT_PERSON_DETAIL
     * @date 2014-12-26 11:13:20
     * @param ids
     * @return
     */ 
    public int deleteHdkfSupportPersonDetailById(String id);
    
    /**
     * @author AVICIT DEV
     * @description: 按BorrowInfoId删除HDKF_SUPPORT_PERSON_DETAIL
     * @date 2014-12-26 11:13:20
     * @param borrowInfoId
     * @return
     */ 
    public int deleteHdkfSupportPersonDetailByBorrowInfoId(String borrowInfoId);
    }
