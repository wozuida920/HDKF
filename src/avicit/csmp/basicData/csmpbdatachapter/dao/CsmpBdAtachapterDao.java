package avicit.csmp.basicData.csmpbdatachapter.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import avicit.platform6.core.mybatis.MyBatisRepository;
import avicit.csmp.basicData.csmpbdaircraftinfo.dto.CsmpBdAircraftinfoDTO;
import avicit.csmp.basicData.csmpbdatachapter.dto.CsmpBdAtachapterDTO;
/**
 * @classname: CsmpBdAtachapterDao
 * @description: 定义  ATM章节号管理 持久层 接口
 * 通过@MapperScannerConfigurer扫描目录中的所有接口, 动态在Spring Context中生成实现.
 * 方法名称必须与Mapper.xml中保持一致.
 * @author:  AVICIT DEV
 */
@MyBatisRepository
public interface CsmpBdAtachapterDao {
    
    /**
     * @author AVICIT DEV
     * @description: 按照父id查询数据
     * @date 2014-12-26 11:13:20
     * @param searchParams
     * @return
     */
     public List<Map<String,Object>> getCsmpBdAtachapterByParentClassId(@Param("id")String id,@Param("validFlag")String validFlag);
    
    /**
     * @author AVICIT DEV
     * @description:查询对象 ATM章节号管理
     * @date 2014-12-26 11:13:20
     * @param text
     * @return
     */
    public List<Map<String,Object>> searchCsmpBdAtachapter(String AtaName);

    /**
     * @author AVICIT DEV
     * @description:查询对象 ATM章节号管理
     * @date 2014-12-26 11:13:20
     * @param id
     * @return
     */
    public CsmpBdAtachapterDTO getNodeById(String id);
    
    /**
     * @author AVICIT DEV
     * @description: 按照父id查询子节点 ATM章节号管理
     * @date 2014-12-26 11:13:20
     * @param paramMap
     * @return
     */
    public List<CsmpBdAtachapterDTO> getNodeByParentClassId(String ParentClassId);
    
        /**
     * @author AVICIT DEV
     * @description: 更新对象 ATM章节号管理
     * @date 2014-12-26 11:13:20
     * @param paramMap
     */
   public int insertCsmpBdAtachapter(CsmpBdAtachapterDTO tree);
    
    /**
     * @author AVICIT DEV
     * @description: 更新对象 ATM章节号管理
     * @date 2014-12-26 11:13:20
     * @param paramMap
     */
    public int updateCsmpBdAtachapterSensitive(CsmpBdAtachapterDTO tree);
    
    /**
     * @author AVICIT DEV
     * @description:查询对象 飞机信息表
     * @date 2014-12-26 11:13:20
     * @param searchParams
     * @return
     */
    public List<CsmpBdAtachapterDTO> searchCsmpBdAtachapterinfo(CsmpBdAtachapterDTO csmpBdAtachapterDTO);

   
    /**
     * @author AVICIT DEV
     * @description: 按主键删除 ATM章节号管理
     * @date 2014-12-26 11:13:20
     * @param ids
     * @return
     */ 
   public int deleteCsmpBdAtachapterById(String id);
   }
