package avicit.hdkf.support.hdkfsupportfaxinfo.dao;

import java.util.List;
import java.util.Map;

import avicit.platform6.core.mybatis.MyBatisRepository;
import avicit.platform6.core.mybatis.pagehelper.Page;
import org.apache.ibatis.annotations.Param;
import avicit.platform6.core.sfn.intercept.SelfDefined;
import avicit.hdkf.support.hdkfsupportfaxinfo.dto.HdkfSupportFaxInfoDTO;
/**
 * @classname: HdkfSupportFaxInfoDao
 * @description: 定义  传真持久层 接口
 * 通过@MapperScannerConfigurer扫描目录中的所有接口, 动态在Spring Context中生成实现.
 * 方法名称必须与Mapper.xml中保持一致.
 * @author:   AVICIT DEV
 */
@MyBatisRepository
public interface HdkfSupportFaxInfoDao {
    
    /**
     * @author AVICIT DEV
     * @description: 分页查询 传真
     * @param searchParams
     * @return
     */
    public Page<HdkfSupportFaxInfoDTO> searchHdkfSupportFaxInfoByPage(@Param("bean")HdkfSupportFaxInfoDTO hdkfSupportFaxInfoDTO,@Param("sfnConditions")SelfDefined sql) ;
    
    /**
     * @author  AVICIT DEV
     * @description:查询对象传真
     * @date 2014-12-26 11:13:20
     * @param searchParams
     * @return
     */
    public List<HdkfSupportFaxInfoDTO> searchHdkfSupportFaxInfo(HdkfSupportFaxInfoDTO hdkfSupportFaxInfoDTO);

    /**
     * @author AVICIT DEV
     * @description:查询对象 传真
     * @date 2014-12-26 11:13:20
     * @param id
     * @return
     */
    public HdkfSupportFaxInfoDTO findHdkfSupportFaxInfoById(String id);
    
         /**
     * @author AVICIT DEV
     * @description: 新增对象 传真
     * @date 2014-12-26 11:13:20
     * @param paramMap
     * @return
     */
    public int insertHdkfSupportFaxInfo(HdkfSupportFaxInfoDTO hdkfSupportFaxInfoDTO);
    
    /**
     * @author AVICIT DEV
     * @description: 更新对象 传真
     * @date 2014-12-26 11:13:20
     * @param paramMap
     */
    public int updateHdkfSupportFaxInfoSensitive(HdkfSupportFaxInfoDTO hdkfSupportFaxInfoDTO);
    
    /**
     * @author AVICIT DEV
     * @description: 更新对象 传真
     * @date 2014-12-26 11:13:20
     * @param paramMap
     */
    public int updateHdkfSupportFaxInfoAll(HdkfSupportFaxInfoDTO hdkfSupportFaxInfoDTO);
    
    
    /**
     * @author AVICIT DEV
     * @description: 按主键删除 传真
     * @date 2014-12-26 11:13:20
     * @param ids
     * @return
     */ 
    public int deleteHdkfSupportFaxInfoById(String id);
    }
