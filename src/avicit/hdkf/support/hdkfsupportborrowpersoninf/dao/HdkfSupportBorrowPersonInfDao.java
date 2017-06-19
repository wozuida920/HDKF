package avicit.hdkf.support.hdkfsupportborrowpersoninf.dao;

import java.util.List;
import java.util.Map;

import avicit.platform6.core.mybatis.MyBatisRepository;
import avicit.platform6.core.mybatis.pagehelper.Page;
import org.apache.ibatis.annotations.Param;
import avicit.platform6.core.sfn.intercept.SelfDefined;
import avicit.hdkf.support.hdkfsupportborrowpersoninf.dto.HdkfSupportBorrowPersonInfDTO;
/**
 * @classname: HdkfSupportBorrowPersonInfDao
 * @description: 定义  HDKF_SUPPORT_BORROW_PERSON_INF持久层 接口
 * 通过@MapperScannerConfigurer扫描目录中的所有接口, 动态在Spring Context中生成实现.
 * 方法名称必须与Mapper.xml中保持一致.
 * @author:   AVICIT DEV
 */
@MyBatisRepository
public interface HdkfSupportBorrowPersonInfDao {
    
    /**
     * @author AVICIT DEV
     * @description: 分页查询 HDKF_SUPPORT_BORROW_PERSON_INF
     * @param searchParams
     * @return
     */
    public Page<HdkfSupportBorrowPersonInfDTO> searchHdkfSupportBorrowPersonInfByPage(@Param("bean")HdkfSupportBorrowPersonInfDTO hdkfSupportBorrowPersonInfDTO,@Param("sfnConditions")SelfDefined sql) ;
    
    /**
     * @author  AVICIT DEV
     * @description:查询对象HDKF_SUPPORT_BORROW_PERSON_INF
     * @date 2014-12-26 11:13:20
     * @param searchParams
     * @return
     */
    public List<HdkfSupportBorrowPersonInfDTO> searchHdkfSupportBorrowPersonInf(HdkfSupportBorrowPersonInfDTO hdkfSupportBorrowPersonInfDTO);

    /**
     * @author AVICIT DEV
     * @description:查询对象 HDKF_SUPPORT_BORROW_PERSON_INF
     * @date 2014-12-26 11:13:20
     * @param id
     * @return
     */
    public HdkfSupportBorrowPersonInfDTO findHdkfSupportBorrowPersonInfById(String id);
    
         /**
     * @author AVICIT DEV
     * @description: 新增对象 HDKF_SUPPORT_BORROW_PERSON_INF
     * @date 2014-12-26 11:13:20
     * @param paramMap
     * @return
     */
    public int insertHdkfSupportBorrowPersonInf(HdkfSupportBorrowPersonInfDTO hdkfSupportBorrowPersonInfDTO);
    
    /**
     * @author AVICIT DEV
     * @description: 更新对象 HDKF_SUPPORT_BORROW_PERSON_INF
     * @date 2014-12-26 11:13:20
     * @param paramMap
     */
    public int updateHdkfSupportBorrowPersonInfSensitive(HdkfSupportBorrowPersonInfDTO hdkfSupportBorrowPersonInfDTO);
    
    /**
     * @author AVICIT DEV
     * @description: 更新对象 HDKF_SUPPORT_BORROW_PERSON_INF
     * @date 2014-12-26 11:13:20
     * @param paramMap
     */
    public int updateHdkfSupportBorrowPersonInfAll(HdkfSupportBorrowPersonInfDTO hdkfSupportBorrowPersonInfDTO);
    
    
    /**
     * @author AVICIT DEV
     * @description: 按主键删除 HDKF_SUPPORT_BORROW_PERSON_INF
     * @date 2014-12-26 11:13:20
     * @param ids
     * @return
     */ 
    public int deleteHdkfSupportBorrowPersonInfById(String id);
    }
