package avicit.hdkf.esnotice.hdkfesnoticeinfomaterial.dao;

import avicit.platform6.core.mybatis.MyBatisRepository;

import org.apache.ibatis.annotations.Param;
import avicit.platform6.core.sfn.intercept.SelfDefined;
import avicit.platform6.core.mybatis.pagehelper.Page;
import avicit.hdkf.esnotice.hdkfesnoticeinfomaterial.dto.HdkfEsNoticeinfoMaterialDTO;
/**
 * @classname:  HdkfEsNoticeinfoMaterialDao
 * @description: 定义  技术通报涉及材料表 持久层 接口
 * 通过@MapperScannerConfigurer扫描目录中的所有接口, 动态在Spring Context中生成实现.
 * 方法名称必须与Mapper.xml中保持一致.
 * @author:   AVICIT DEV
 */
@MyBatisRepository
public interface HdkfEsNoticeinfoMaterialDao {
    
    /**
     * @author AVICIT DEV
     * @description: 分页查询技术通报涉及材料表
     * @date 2014-12-26 11:13:20
     * @param searchParams
     * @return
     */
    public Page<HdkfEsNoticeinfoMaterialDTO> searchHdkfEsNoticeinfoMaterialByPage(@Param("bean")HdkfEsNoticeinfoMaterialDTO hdkfEsNoticeinfoMaterialDTO,@Param("sfnConditions")SelfDefined sql) ;
    
  
    /**
     * @author AVICIT DEV
     * @description:查询对象 技术通报涉及材料表
     * @date 2014-12-26 11:13:20
     * @param id
     * @return
     */
    public HdkfEsNoticeinfoMaterialDTO findHdkfEsNoticeinfoMaterialById(String id);
    
         /**
     * @author AVICIT DEV
     * @description: 新增对象技术通报涉及材料表
     * @date 2014-12-26 11:13:20
     * @param paramMap
     * @return
     */
    public int insertHdkfEsNoticeinfoMaterial(HdkfEsNoticeinfoMaterialDTO hdkfEsNoticeinfoMaterialDTO);
    
    /**
     * @author AVICIT DEV
     * @description: 更新对象技术通报涉及材料表
     * @date 2014-12-26 11:13:20
     * @param paramMap
     */
    public int updateHdkfEsNoticeinfoMaterialSensitive(HdkfEsNoticeinfoMaterialDTO hdkfEsNoticeinfoMaterialDTO);
    
    /**
     * @author AVICIT DEV
     * @description: 更新对象技术通报涉及材料表
     * @date 2014-12-26 11:13:20
     * @param paramMap
     */
    public int updateHdkfEsNoticeinfoMaterialAll(HdkfEsNoticeinfoMaterialDTO hdkfEsNoticeinfoMaterialDTO);
    
    
    /**
     * @author AVICIT DEV
     * @description: 按主键删除技术通报涉及材料表
     * @date 2014-12-26 11:13:20
     * @param ids
     * @return
     */ 
    public int deleteHdkfEsNoticeinfoMaterialById(String id);
    }
