package avicit.hdkf.support.hdkfsupporttaskarchive.dao;

import java.util.List;
import java.util.Map;

import avicit.platform6.core.mybatis.MyBatisRepository;
import avicit.platform6.core.mybatis.pagehelper.Page;
import org.apache.ibatis.annotations.Param;
import avicit.platform6.core.sfn.intercept.SelfDefined;
import avicit.hdkf.support.hdkfsupporttaskarchive.dto.HdkfSupportTaskArchiveDTO;
/**
 * @classname: HdkfSupportTaskArchiveDao
 * @description: 定义  HDKF_SUPPORT_TASK_ARCHIVE持久层 接口
 * 通过@MapperScannerConfigurer扫描目录中的所有接口, 动态在Spring Context中生成实现.
 * 方法名称必须与Mapper.xml中保持一致.
 * @author:   AVICIT DEV
 */
@MyBatisRepository
public interface HdkfSupportTaskArchiveDao {
    
    /**
     * @author AVICIT DEV
     * @description: 分页查询 HDKF_SUPPORT_TASK_ARCHIVE
     * @param searchParams
     * @return
     */
    public Page<HdkfSupportTaskArchiveDTO> searchHdkfSupportTaskArchiveByPage(@Param("bean")HdkfSupportTaskArchiveDTO hdkfSupportTaskArchiveDTO,@Param("sfnConditions")SelfDefined sql) ;
    
    /**
     * @author  AVICIT DEV
     * @description:查询对象HDKF_SUPPORT_TASK_ARCHIVE
     * @date 2014-12-26 11:13:20
     * @param searchParams
     * @return
     */
    public List<HdkfSupportTaskArchiveDTO> searchHdkfSupportTaskArchive(HdkfSupportTaskArchiveDTO hdkfSupportTaskArchiveDTO);

    /**
     * @author AVICIT DEV
     * @description:查询对象 HDKF_SUPPORT_TASK_ARCHIVE
     * @date 2014-12-26 11:13:20
     * @param id
     * @return
     */
    public HdkfSupportTaskArchiveDTO findHdkfSupportTaskArchiveById(String id);
    
         /**
     * @author AVICIT DEV
     * @description: 新增对象 HDKF_SUPPORT_TASK_ARCHIVE
     * @date 2014-12-26 11:13:20
     * @param paramMap
     * @return
     */
    public int insertHdkfSupportTaskArchive(HdkfSupportTaskArchiveDTO hdkfSupportTaskArchiveDTO);
    
    /**
     * @author AVICIT DEV
     * @description: 更新对象 HDKF_SUPPORT_TASK_ARCHIVE
     * @date 2014-12-26 11:13:20
     * @param paramMap
     */
    public int updateHdkfSupportTaskArchiveSensitive(HdkfSupportTaskArchiveDTO hdkfSupportTaskArchiveDTO);
    
    /**
     * @author AVICIT DEV
     * @description: 更新对象 HDKF_SUPPORT_TASK_ARCHIVE
     * @date 2014-12-26 11:13:20
     * @param paramMap
     */
    public int updateHdkfSupportTaskArchiveAll(HdkfSupportTaskArchiveDTO hdkfSupportTaskArchiveDTO);
    
    
    /**
     * @author AVICIT DEV
     * @description: 按主键删除 HDKF_SUPPORT_TASK_ARCHIVE
     * @date 2014-12-26 11:13:20
     * @param ids
     * @return
     */ 
    public int deleteHdkfSupportTaskArchiveById(String id);


    }
