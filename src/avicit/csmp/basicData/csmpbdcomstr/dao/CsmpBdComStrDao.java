package avicit.csmp.basicData.csmpbdcomstr.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import avicit.csmp.basicData.csmpbdcomstr.dto.CsmpBdComStrDTO;
import avicit.csmp.basicData.csmpbdcomstr.dto.CsmpBdStrVo;
import avicit.platform6.core.mybatis.MyBatisRepository;
import avicit.platform6.core.mybatis.pagehelper.Page;
import avicit.platform6.core.sfn.intercept.SelfDefined;
/**
 * @classname: CsmpBdComStrDao
 * @description: 定义  单位结构关系表 持久层 接口
 * 通过@MapperScannerConfigurer扫描目录中的所有接口, 动态在Spring Context中生成实现.
 * 方法名称必须与Mapper.xml中保持一致.
 * @author:  AVICIT DEV
 */
@MyBatisRepository
public interface CsmpBdComStrDao {
    
	/**
	 * 过滤条件查询
	 * @param csmpBdComStrDTO
	 * @param sql
	 * @return
	 */
	public Page<CsmpBdStrVo> searchComStrAndCompByPage(@Param("treeBean")CsmpBdComStrDTO csmpBdComStrDTO) ;
    /**
     * @author AVICIT DEV
     * @description: 分页查询 单位结构关系表
     * @date 2014-12-26 11:13:20
     * @param searchParams
     * @return
     */
    public Page<CsmpBdComStrDTO> searchCsmpBdComStrByPage(@Param("bean")CsmpBdComStrDTO csmpBdComStrDTO,@Param("sfnConditions")SelfDefined sql) ;
    
    
    /**
     * @author AVICIT DEV
     * @description: 结构树的删除查询
     * @date 2014-12-26 11:13:20
     * @param searchParams
     * @return
     */
 /* public List<Map<String, Object>>  searchDel(@Param("treeBean")String  id);*/
  public int  searchDel(String id);
  


    
    /**
     * @author AVICIT DEV
     * @description:查询对象 单位结构关系表
     * @date 2014-12-26 11:13:20
     * @param searchParams
     * @return
     */
    public List<CsmpBdComStrDTO> searchCsmpBdComStr(CsmpBdComStrDTO csmpBdComStrDTO);

    /**
     * @author AVICIT DEV
     * @description:查询对象 单位结构关系表
     * @date 2014-12-26 11:13:20
     * @param id
     * @return
     */
    public CsmpBdComStrDTO findCsmpBdComStrById(String id);
    
        /**
     * @author AVICIT DEV
     * @description: 新增对象 单位结构关系表
     * @date 2014-12-26 11:13:20
     * @param paramMap
     * @return
     */
    public int insertCsmpBdComStr(CsmpBdComStrDTO csmpBdComStrDTO);
    
    /**
     * @author AVICIT DEV
     * @description: 更新对象 单位结构关系表
     * @date 2014-12-26 11:13:20
     * @param paramMap
     */
    public int updateCsmpBdComStrSensitive(CsmpBdComStrDTO csmpBdComStrDTO);
    
    /**
     * @author AVICIT DEV
     * @description: 更新对象 单位结构关系表
     * @date 2014-12-26 11:13:20
     * @param paramMap
     */
    public int updateCsmpBdComStrAll(CsmpBdComStrDTO csmpBdComStrDTO);
    
    
    /**
     * @author AVICIT DEV
     * @description: 按主键删除 单位结构关系表
     * @date 2014-12-26 11:13:20
     * @param ids
     * @return
     */ 
    public int deleteCsmpBdComStrById(String id);
    /**
     * @author AVICIT DEV
     * @description: 信息表删除 同时删除CSMP_BD_COM_STR
     * @date 2014-12-26 11:13:20
     * @param comid
     * @return
     */ 
    public int  deleteCsmpBdComStrBycomIds(String comId);
    /**
     * @author AVICIT DEV
     * @description: 关系表删除时先查询有几个str
     * @date 2014-12-26 11:13:20
     * @param ids
     * @return
     */ 
	public int searchStrByComId(String id);
	/**
     * @author AVICIT DEV
     * @description: 关系表删除时先查询有几个str
     * @date 2014-12-26 11:13:20
     * @param ids
     * @return
     */ 
	public int deleteCsmpBdComStrByStrId(String id);
    }
