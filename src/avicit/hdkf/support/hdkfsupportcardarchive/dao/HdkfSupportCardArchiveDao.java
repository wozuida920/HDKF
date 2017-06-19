package avicit.hdkf.support.hdkfsupportcardarchive.dao;

import java.util.List;
import java.util.Map;

import avicit.platform6.core.mybatis.MyBatisRepository;
import avicit.platform6.core.mybatis.pagehelper.Page;
import org.apache.ibatis.annotations.Param;
import avicit.platform6.core.sfn.intercept.SelfDefined;
import avicit.hdkf.support.hdkfsupportcardarchive.dto.HdkfSupportCardArchiveDTO;
/**
 * @classname: HdkfSupportCardArchiveDao
 * @description: 定义  HDKF_SUPPORT_CARD_ARCHIVE持久层 接口
 * 通过@MapperScannerConfigurer扫描目录中的所有接口, 动态在Spring Context中生成实现.
 * 方法名称必须与Mapper.xml中保持一致.
 * @author:   AVICIT DEV
 */
@MyBatisRepository
public interface HdkfSupportCardArchiveDao {
    
    /**
     * @author AVICIT DEV
     * @description: 分页查询 HDKF_SUPPORT_CARD_ARCHIVE
     * @param searchParams
     * @return
     */
    public Page<HdkfSupportCardArchiveDTO> searchHdkfSupportCardArchiveByPage(@Param("bean")HdkfSupportCardArchiveDTO hdkfSupportCardArchiveDTO,@Param("sfnConditions")SelfDefined sql) ;
    
    /**
     * @author  AVICIT DEV
     * @description:查询对象HDKF_SUPPORT_CARD_ARCHIVE
     * @date 2014-12-26 11:13:20
     * @param searchParams
     * @return
     */
    public List<HdkfSupportCardArchiveDTO> searchHdkfSupportCardArchive(HdkfSupportCardArchiveDTO hdkfSupportCardArchiveDTO);

    /**
     * @author AVICIT DEV
     * @description:查询对象 HDKF_SUPPORT_CARD_ARCHIVE
     * @date 2014-12-26 11:13:20
     * @param id
     * @return
     */
    public HdkfSupportCardArchiveDTO findHdkfSupportCardArchiveById(String id);
    
         /**
     * @author AVICIT DEV
     * @description: 新增对象 HDKF_SUPPORT_CARD_ARCHIVE
     * @date 2014-12-26 11:13:20
     * @param paramMap
     * @return
     */
    public int insertHdkfSupportCardArchive(HdkfSupportCardArchiveDTO hdkfSupportCardArchiveDTO);
    
    /**
     * @author AVICIT DEV
     * @description: 更新对象 HDKF_SUPPORT_CARD_ARCHIVE
     * @date 2014-12-26 11:13:20
     * @param paramMap
     */
    public int updateHdkfSupportCardArchiveSensitive(HdkfSupportCardArchiveDTO hdkfSupportCardArchiveDTO);
    
    /**
     * @author AVICIT DEV
     * @description: 更新对象 HDKF_SUPPORT_CARD_ARCHIVE
     * @date 2014-12-26 11:13:20
     * @param paramMap
     */
    public int updateHdkfSupportCardArchiveAll(HdkfSupportCardArchiveDTO hdkfSupportCardArchiveDTO);
    
    
    /**
     * @author AVICIT DEV
     * @description: 按主键删除 HDKF_SUPPORT_CARD_ARCHIVE
     * @date 2014-12-26 11:13:20
     * @param ids
     * @return
     */ 
    public int deleteHdkfSupportCardArchiveById(String id);
    }
