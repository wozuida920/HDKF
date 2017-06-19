package avicit.hdkf.support.hdkfsupportdealbykf.dao;

import java.util.List;
import java.util.Map;

import avicit.platform6.core.mybatis.MyBatisRepository;
import avicit.platform6.core.mybatis.pagehelper.Page;
import org.apache.ibatis.annotations.Param;
import avicit.platform6.core.sfn.intercept.SelfDefined;
import avicit.hdkf.support.hdkfsupportdealbykf.dto.HdkfSupportDealByKfDTO;
/**
 * @classname: HdkfSupportDealByKfDao
 * @description: 定义  HDKF_SUPPORT_DEAL_BY_KF持久层 接口
 * 通过@MapperScannerConfigurer扫描目录中的所有接口, 动态在Spring Context中生成实现.
 * 方法名称必须与Mapper.xml中保持一致.
 * @author:   AVICIT DEV
 */
@MyBatisRepository
public interface HdkfSupportDealByKfDao {
    
    /**
     * @author AVICIT DEV
     * @description: 分页查询 HDKF_SUPPORT_DEAL_BY_KF
     * @param searchParams
     * @return
     */
    public Page<HdkfSupportDealByKfDTO> searchHdkfSupportDealByKfByPage(@Param("bean")HdkfSupportDealByKfDTO hdkfSupportDealByKfDTO,@Param("sfnConditions")SelfDefined sql) ;
    
    /**
     * @author  AVICIT DEV
     * @description:查询对象HDKF_SUPPORT_DEAL_BY_KF
     * @date 2014-12-26 11:13:20
     * @param searchParams
     * @return
     */
    public List<HdkfSupportDealByKfDTO> searchHdkfSupportDealByKf(HdkfSupportDealByKfDTO hdkfSupportDealByKfDTO);

    /**
     * @author AVICIT DEV
     * @description:查询对象 HDKF_SUPPORT_DEAL_BY_KF
     * @date 2014-12-26 11:13:20
     * @param id
     * @return
     */
    public HdkfSupportDealByKfDTO findHdkfSupportDealByKfById(String id);
    
         /**
     * @author AVICIT DEV
     * @description: 新增对象 HDKF_SUPPORT_DEAL_BY_KF
     * @date 2014-12-26 11:13:20
     * @param paramMap
     * @return
     */
    public int insertHdkfSupportDealByKf(HdkfSupportDealByKfDTO hdkfSupportDealByKfDTO);
    
    /**
     * @author AVICIT DEV
     * @description: 更新对象 HDKF_SUPPORT_DEAL_BY_KF
     * @date 2014-12-26 11:13:20
     * @param paramMap
     */
    public int updateHdkfSupportDealByKfSensitive(HdkfSupportDealByKfDTO hdkfSupportDealByKfDTO);
    
    /**
     * @author AVICIT DEV
     * @description: 更新对象 HDKF_SUPPORT_DEAL_BY_KF
     * @date 2014-12-26 11:13:20
     * @param paramMap
     */
    public int updateHdkfSupportDealByKfAll(HdkfSupportDealByKfDTO hdkfSupportDealByKfDTO);
    
    
    /**
     * @author AVICIT DEV
     * @description: 按主键删除 HDKF_SUPPORT_DEAL_BY_KF
     * @date 2014-12-26 11:13:20
     * @param ids
     * @return
     */ 
    public int deleteHdkfSupportDealByKfById(String id);
    }
