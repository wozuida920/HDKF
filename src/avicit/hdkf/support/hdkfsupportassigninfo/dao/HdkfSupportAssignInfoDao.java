package avicit.hdkf.support.hdkfsupportassigninfo.dao;

import java.util.List;
import java.util.Map;

import avicit.platform6.core.mybatis.MyBatisRepository;
import org.apache.ibatis.annotations.Param;
import avicit.platform6.core.sfn.intercept.SelfDefined;
import avicit.platform6.core.mybatis.pagehelper.Page;
import avicit.hdkf.support.hdkfsupportassigninfo.dto.HdkfSupportAssignInfoDTO;
/**
 * @classname: HdkfSupportAssignInfoDao
 * @description: 定义  HDKF_SUPPORT_ASSIGN_INFO 持久层 接口
 * 通过@MapperScannerConfigurer扫描目录中的所有接口, 动态在Spring Context中生成实现.
 * 方法名称必须与Mapper.xml中保持一致.
 * @author:  AVICIT DEV
 */
@MyBatisRepository
public interface HdkfSupportAssignInfoDao {
    
    /**
     * @author AVICIT DEV
     * @description: 分页查询 HDKF_SUPPORT_ASSIGN_INFO
     * @date 2014-12-26 11:13:20
     * @param searchParams
     * @return
     */
    public Page<HdkfSupportAssignInfoDTO> searchHdkfSupportAssignInfoByPage(@Param("bean")HdkfSupportAssignInfoDTO hdkfSupportAssignInfoDTO,@Param("sfnConditions")SelfDefined sql) ;
    
    /**
     * @author AVICIT DEV
     * @description:查询对象 HDKF_SUPPORT_ASSIGN_INFO
     * @date 2014-12-26 11:13:20
     * @param searchParams
     * @return
     */
    public List<HdkfSupportAssignInfoDTO> searchHdkfSupportAssignInfo(HdkfSupportAssignInfoDTO hdkfSupportAssignInfoDTO);

    /**
     * @author AVICIT DEV
     * @description:查询对象 HDKF_SUPPORT_ASSIGN_INFO
     * @date 2014-12-26 11:13:20
     * @param id
     * @return
     */
    public HdkfSupportAssignInfoDTO findHdkfSupportAssignInfoById(String id);
    
        /**
     * @author AVICIT DEV
     * @description: 新增对象 HDKF_SUPPORT_ASSIGN_INFO
     * @date 2014-12-26 11:13:20
     * @param paramMap
     * @return
     */
    public int insertHdkfSupportAssignInfo(HdkfSupportAssignInfoDTO hdkfSupportAssignInfoDTO);
    
    /**
     * @author AVICIT DEV
     * @description: 更新对象 HDKF_SUPPORT_ASSIGN_INFO
     * @date 2014-12-26 11:13:20
     * @param paramMap
     */
    public int updateHdkfSupportAssignInfoSensitive(HdkfSupportAssignInfoDTO hdkfSupportAssignInfoDTO);
    
    /**
     * @author AVICIT DEV
     * @description: 更新对象 HDKF_SUPPORT_ASSIGN_INFO
     * @date 2014-12-26 11:13:20
     * @param paramMap
     */
    public int updateHdkfSupportAssignInfoAll(HdkfSupportAssignInfoDTO hdkfSupportAssignInfoDTO);
    
    
    /**
     * @author AVICIT DEV
     * @description: 按主键删除 HDKF_SUPPORT_ASSIGN_INFO
     * @date 2014-12-26 11:13:20
     * @param ids
     * @return
     */ 
    public int deleteHdkfSupportAssignInfoById(String id);
    }
