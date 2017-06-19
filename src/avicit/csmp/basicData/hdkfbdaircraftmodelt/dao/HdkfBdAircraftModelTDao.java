package avicit.csmp.basicData.hdkfbdaircraftmodelt.dao;

import java.util.List;
import java.util.Map;

import avicit.platform6.core.mybatis.MyBatisRepository;
import avicit.csmp.basicData.hdkfbdaircraftmodelt.dto.HdkfBdAircraftModelTDTO;
/**
 * @classname: HdkfBdAircraftModelTDao
 * @description: 定义  HDKF_BD_AIRCRAFT_MODEL_T 持久层 接口
 * 通过@MapperScannerConfigurer扫描目录中的所有接口, 动态在Spring Context中生成实现.
 * 方法名称必须与Mapper.xml中保持一致.
 * @author:  AVICIT DEV
 */
@MyBatisRepository
public interface HdkfBdAircraftModelTDao {
    
    /**
     * @author AVICIT DEV
     * @description: 按照父id查询数据
     * @date 2014-12-26 11:13:20
     * @param searchParams
     * @return
     */
     public List<Map<String,Object>> getHdkfBdAircraftModelTByFatherId(String id);
    
    /**
     * @author AVICIT DEV
     * @description:查询对象 HDKF_BD_AIRCRAFT_MODEL_T
     * @date 2014-12-26 11:13:20
     * @param text
     * @return
     */
    public List<Map<String,Object>> searchHdkfBdAircraftModelT(String AircraftName);

    /**
     * @author AVICIT DEV
     * @description:查询对象 HDKF_BD_AIRCRAFT_MODEL_T
     * @date 2014-12-26 11:13:20
     * @param id
     * @return
     */
    public HdkfBdAircraftModelTDTO getNodeById(String id);
    public HdkfBdAircraftModelTDTO getNodeByModelId(String modelId);
    /**
     * @author AVICIT DEV
     * @description: 按照父id查询子节点 HDKF_BD_AIRCRAFT_MODEL_T
     * @date 2014-12-26 11:13:20
     * @param paramMap
     * @return
     */
    public List<HdkfBdAircraftModelTDTO> getNodeByFatherId(String FatherId);
    
        /**
     * @author AVICIT DEV
     * @description: 更新对象 HDKF_BD_AIRCRAFT_MODEL_T
     * @date 2014-12-26 11:13:20
     * @param paramMap
     */
   public int insertHdkfBdAircraftModelT(HdkfBdAircraftModelTDTO tree);
    
    /**
     * @author AVICIT DEV
     * @description: 更新对象 HDKF_BD_AIRCRAFT_MODEL_T
     * @date 2014-12-26 11:13:20
     * @param paramMap
     */
    public int updateHdkfBdAircraftModelTSensitive(HdkfBdAircraftModelTDTO tree);
    
    
    /**
     * @author AVICIT DEV
     * @description: 按主键删除 HDKF_BD_AIRCRAFT_MODEL_T
     * @date 2014-12-26 11:13:20
     * @param ids
     * @return
     */ 
   public int deleteHdkfBdAircraftModelTById(String id);
   }
