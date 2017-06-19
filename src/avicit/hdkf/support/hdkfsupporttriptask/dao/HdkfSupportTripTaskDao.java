package avicit.hdkf.support.hdkfsupporttriptask.dao;

import java.util.List;
import java.util.Map;

import avicit.platform6.core.mybatis.MyBatisRepository;
import avicit.platform6.core.mybatis.pagehelper.Page;
import org.apache.ibatis.annotations.Param;
import avicit.platform6.core.sfn.intercept.SelfDefined;
import avicit.hdkf.support.hdkfsupporttriptask.dto.HdkfSupportTripTaskDTO;
/**
 * @classname: HdkfSupportTripTaskDao
 * @description: 定义  HDKF_SUPPORT_TRIP_TASK持久层 接口
 * 通过@MapperScannerConfigurer扫描目录中的所有接口, 动态在Spring Context中生成实现.
 * 方法名称必须与Mapper.xml中保持一致.
 * @author:   AVICIT DEV
 */
@MyBatisRepository
public interface HdkfSupportTripTaskDao {
    
    /**
     * @author AVICIT DEV
     * @description: 分页查询 HDKF_SUPPORT_TRIP_TASK
     * @param searchParams
     * @return
     */
    public Page<HdkfSupportTripTaskDTO> searchHdkfSupportTripTaskByPage(@Param("bean")HdkfSupportTripTaskDTO hdkfSupportTripTaskDTO,@Param("sfnConditions")SelfDefined sql) ;
    
    /**
     * @author  AVICIT DEV
     * @description:查询对象HDKF_SUPPORT_TRIP_TASK
     * @date 2014-12-26 11:13:20
     * @param searchParams
     * @return
     */
    public List<HdkfSupportTripTaskDTO> searchHdkfSupportTripTask(HdkfSupportTripTaskDTO hdkfSupportTripTaskDTO);

    /**
     * @author AVICIT DEV
     * @description:查询对象 HDKF_SUPPORT_TRIP_TASK
     * @date 2014-12-26 11:13:20
     * @param id
     * @return
     */
    public HdkfSupportTripTaskDTO findHdkfSupportTripTaskById(String id);
    
         /**
     * @author AVICIT DEV
     * @description: 新增对象 HDKF_SUPPORT_TRIP_TASK
     * @date 2014-12-26 11:13:20
     * @param paramMap
     * @return
     */
    public int insertHdkfSupportTripTask(HdkfSupportTripTaskDTO hdkfSupportTripTaskDTO);
    
    /**
     * @author AVICIT DEV
     * @description: 更新对象 HDKF_SUPPORT_TRIP_TASK
     * @date 2014-12-26 11:13:20
     * @param paramMap
     */
    public int updateHdkfSupportTripTaskSensitive(HdkfSupportTripTaskDTO hdkfSupportTripTaskDTO);
    
    /**
     * @author AVICIT DEV
     * @description: 更新对象 HDKF_SUPPORT_TRIP_TASK
     * @date 2014-12-26 11:13:20
     * @param paramMap
     */
    public int updateHdkfSupportTripTaskAll(HdkfSupportTripTaskDTO hdkfSupportTripTaskDTO);
    
    
    /**
     * @author AVICIT DEV
     * @description: 按主键删除 HDKF_SUPPORT_TRIP_TASK
     * @date 2014-12-26 11:13:20
     * @param ids
     * @return
     */ 
    public int deleteHdkfSupportTripTaskById(String id);
    }
