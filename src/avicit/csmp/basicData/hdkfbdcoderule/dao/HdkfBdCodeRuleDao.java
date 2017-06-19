package avicit.csmp.basicData.hdkfbdcoderule.dao;

import java.util.List;
import java.util.Map;

import avicit.platform6.core.mybatis.MyBatisRepository;
import org.apache.ibatis.annotations.Param;
import avicit.platform6.core.sfn.intercept.SelfDefined;
import avicit.platform6.core.mybatis.pagehelper.Page;
import avicit.csmp.basicData.hdkfbdcoderule.dto.HdkfBdCodeRuleDTO;
/**
 * @classname: HdkfBdCodeRuleDao
 * @description: 定义  HDKF_BD_CODE_RULE 持久层 接口
 * 通过@MapperScannerConfigurer扫描目录中的所有接口, 动态在Spring Context中生成实现.
 * 方法名称必须与Mapper.xml中保持一致.
 * @author:  AVICIT DEV
 */
@MyBatisRepository
public interface HdkfBdCodeRuleDao {
    
    /**
     * @author AVICIT DEV
     * @description: 分页查询 HDKF_BD_CODE_RULE
     * @date 2014-12-26 11:13:20
     * @param searchParams
     * @return
     */
    public Page<HdkfBdCodeRuleDTO> searchHdkfBdCodeRuleByPage(@Param("bean")HdkfBdCodeRuleDTO hdkfBdCodeRuleDTO,@Param("sfnConditions")SelfDefined sql) ;
    
    /**
     * @author AVICIT DEV
     * @description:查询对象 HDKF_BD_CODE_RULE
     * @date 2014-12-26 11:13:20
     * @param searchParams
     * @return
     */
    public List<HdkfBdCodeRuleDTO> searchHdkfBdCodeRule(HdkfBdCodeRuleDTO hdkfBdCodeRuleDTO);

    /**
     * @author AVICIT DEV
     * @description:查询对象 HDKF_BD_CODE_RULE
     * @date 2014-12-26 11:13:20
     * @param id
     * @return
     */
    public HdkfBdCodeRuleDTO findHdkfBdCodeRuleById(String id);
    
        /**
     * @author AVICIT DEV
     * @description: 新增对象 HDKF_BD_CODE_RULE
     * @date 2014-12-26 11:13:20
     * @param paramMap
     * @return
     */
    public int insertHdkfBdCodeRule(HdkfBdCodeRuleDTO hdkfBdCodeRuleDTO);
    
    /**
     * @author AVICIT DEV
     * @description: 更新对象 HDKF_BD_CODE_RULE
     * @date 2014-12-26 11:13:20
     * @param paramMap
     */
    public int updateHdkfBdCodeRuleSensitive(HdkfBdCodeRuleDTO hdkfBdCodeRuleDTO);
    
    /**
     * @author AVICIT DEV
     * @description: 更新对象 HDKF_BD_CODE_RULE
     * @date 2014-12-26 11:13:20
     * @param paramMap
     */
    public int updateHdkfBdCodeRuleAll(HdkfBdCodeRuleDTO hdkfBdCodeRuleDTO);
    
    
    /**
     * @author AVICIT DEV
     * @description: 按主键删除 HDKF_BD_CODE_RULE
     * @date 2014-12-26 11:13:20
     * @param ids
     * @return
     */ 
    public int deleteHdkfBdCodeRuleById(String id);
    }
