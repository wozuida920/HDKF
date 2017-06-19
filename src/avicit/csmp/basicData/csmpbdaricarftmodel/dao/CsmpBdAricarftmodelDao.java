package avicit.csmp.basicData.csmpbdaricarftmodel.dao;

import java.util.List;
import java.util.Map;

import avicit.platform6.core.mybatis.MyBatisRepository;
import org.apache.ibatis.annotations.Param;
import avicit.platform6.core.sfn.intercept.SelfDefined;
import avicit.platform6.core.mybatis.pagehelper.Page;
import avicit.csmp.basicData.csmpbdaricarftmodel.dto.CsmpBdAricarftmodelDTO;
/**
 * @classname: CsmpBdAricarftmodelDao
 * @description: 定义  飞机机型管理 持久层 接口
 * 通过@MapperScannerConfigurer扫描目录中的所有接口, 动态在Spring Context中生成实现.
 * 方法名称必须与Mapper.xml中保持一致.
 * @author:  AVICIT DEV
 */
@MyBatisRepository
public interface CsmpBdAricarftmodelDao {
    
    /**
     * @author AVICIT DEV
     * @description: 分页查询 飞机机型管理
     * @date 2014-12-26 11:13:20
     * @param searchParams
     * @return
     */
    public Page<CsmpBdAricarftmodelDTO> searchCsmpBdAricarftmodelByPage(@Param("bean")CsmpBdAricarftmodelDTO csmpBdAricarftmodelDTO,@Param("sfnConditions")SelfDefined sql) ;
    
   /**
    * 查询的公共弹出页面
    * @param csmpBdAricarftmodelDTO
    * @param sql
    * @return
    */
    public Page<CsmpBdAricarftmodelDTO> searchmodelByPage(@Param("bean1")CsmpBdAricarftmodelDTO csmpBdAricarftmodelDTO,@Param("sfnConditions")SelfDefined sql) ;
    
    
    /**
     * @author AVICIT DEV
     * @description:查询对象 飞机机型管理
     * @date 2014-12-26 11:13:20
     * @param searchParams
     * @return
     */
    public List<CsmpBdAricarftmodelDTO> searchCsmpBdAricarftmodel(CsmpBdAricarftmodelDTO csmpBdAricarftmodelDTO);

    /**
     * @author AVICIT DEV
     * @description:查询对象 飞机机型管理
     * @date 2014-12-26 11:13:20
     * @param id
     * @return
     */
    public CsmpBdAricarftmodelDTO findCsmpBdAricarftmodelById(String id);
    
        /**
     * @author AVICIT DEV
     * @description: 新增对象 飞机机型管理
     * @date 2014-12-26 11:13:20
     * @param paramMap
     * @return
     */
    public int insertCsmpBdAricarftmodel(CsmpBdAricarftmodelDTO csmpBdAricarftmodelDTO);
    
    /**
     * @author AVICIT DEV
     * @description: 更新对象 飞机机型管理
     * @date 2014-12-26 11:13:20
     * @param paramMap
     */
    public int updateCsmpBdAricarftmodelSensitive(CsmpBdAricarftmodelDTO csmpBdAricarftmodelDTO);
    
    /**
     * @author AVICIT DEV
     * @description: 更新对象 飞机机型管理
     * @date 2014-12-26 11:13:20
     * @param paramMap
     */
    public int updateCsmpBdAricarftmodelAll(CsmpBdAricarftmodelDTO csmpBdAricarftmodelDTO);
    
    
    /**
     * @author AVICIT DEV
     * @description: 按主键删除 飞机机型管理
     * @date 2014-12-26 11:13:20
     * @param ids
     * @return
     */ 
    public int deleteCsmpBdAricarftmodelById(String id);
    


    /**
     * 查询列表
     * @param csmpBdAricarftmodelDTO
     * @return
     */
    public List<CsmpBdAricarftmodelDTO>   selectTree(); 
    
}
