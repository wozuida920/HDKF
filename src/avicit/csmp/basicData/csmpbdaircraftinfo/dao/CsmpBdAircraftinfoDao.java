package avicit.csmp.basicData.csmpbdaircraftinfo.dao;

import java.util.List;
import java.util.Map;

import avicit.platform6.core.mybatis.MyBatisRepository;
import org.apache.ibatis.annotations.Param;
import avicit.platform6.core.sfn.intercept.SelfDefined;
import avicit.platform6.core.mybatis.pagehelper.Page;
import avicit.csmp.basicData.csmpbdaircraftinfo.dto.CsmpBdAircraftinfoDTO;
/**
 * @classname: CsmpBdAircraftinfoDao
 * @description: 定义  飞机信息表 持久层 接口
 * 通过@MapperScannerConfigurer扫描目录中的所有接口, 动态在Spring Context中生成实现.
 * 方法名称必须与Mapper.xml中保持一致.
 * @author:  AVICIT DEV
 */
@MyBatisRepository
public interface CsmpBdAircraftinfoDao {
    
    /**
     * @author AVICIT DEV
     * @description: 分页查询 飞机信息表
     * @date 2014-12-26 11:13:20
     * @param searchParams
     * @return
     */
    public Page<CsmpBdAircraftinfoDTO> searchCsmpBdAircraftinfoByPage(@Param("bean")CsmpBdAircraftinfoDTO csmpBdAircraftinfoDTO,@Param("sfnConditions")SelfDefined sql) ;
   //当进行查询的根节点的时候返回的数据
    public Page<CsmpBdAircraftinfoDTO> searchGenByPage(@Param("bean1")CsmpBdAircraftinfoDTO csmpBdAircraftinfoDTO,@Param("sfnConditions")SelfDefined sql) ;
    
    /**
     * @author AVICIT DEV
     * @description:查询对象 飞机信息表
     * @date 2014-12-26 11:13:20
     * @param searchParams
     * @return
     */
    public List<CsmpBdAircraftinfoDTO> searchCsmpBdAircraftinfo(CsmpBdAircraftinfoDTO csmpBdAircraftinfoDTO);

    /**
     * @author AVICIT DEV
     * @description:查询对象 飞机信息表
     * @date 2014-12-26 11:13:20
     * @param id
     * @return
     */
    public CsmpBdAircraftinfoDTO findCsmpBdAircraftinfoById(String id);
    
        /**
     * @author AVICIT DEV
     * @description: 新增对象 飞机信息表
     * @date 2014-12-26 11:13:20
     * @param paramMap
     * @return
     */
    public int insertCsmpBdAircraftinfo(CsmpBdAircraftinfoDTO csmpBdAircraftinfoDTO);
    
    /**
     * @author AVICIT DEV
     * @description: 更新对象 飞机信息表
     * @date 2014-12-26 11:13:20
     * @param paramMap
     */
    public int updateCsmpBdAircraftinfoSensitive(CsmpBdAircraftinfoDTO csmpBdAircraftinfoDTO);
    
    /**
     * @author AVICIT DEV
     * @description: 更新对象 飞机信息表
     * @date 2014-12-26 11:13:20
     * @param paramMap
     */
    public int updateCsmpBdAircraftinfoAll(CsmpBdAircraftinfoDTO csmpBdAircraftinfoDTO);
    
    
    /**
     * @author AVICIT DEV
     * @description: 按主键删除 飞机信息表
     * @date 2014-12-26 11:13:20
     * @param ids
     * @return
     */ 
    public int deleteCsmpBdAircraftinfoById(String id);
    
    /**
     * 按照id进行查找飞机信息表中飞机架批次
     * @param id
     * @return
     */
    public int countBatchno(String id);

	public List<CsmpBdAircraftinfoDTO> searchCsmpBdAircraftinfoById(String id);
	
	/**
	 * 根据公司的id来查询返回一个公司地下对应的所有的飞机
	 * @param comId
	 * @return
	 */
	public List<CsmpBdAircraftinfoDTO> CompanyIdInfoByAircraft(String comId);

	/**
	 * 查询有效的机型架次信息
	 * 2016-7-7
	 * @param queryReqBean
	 * @param sfnConditions
	 * @return
	 * Administrator
	 */
	public Page<CsmpBdAircraftinfoDTO> searchCsmpBdAircraftinfoValidFlagByPage(
			@Param("bean")CsmpBdAircraftinfoDTO searchParams, @Param("sfnConditions")SelfDefined parseSql);
	
	
	
	public Page<CsmpBdAircraftinfoDTO> searchGenModelByPage(
			@Param("bean")CsmpBdAircraftinfoDTO csmpBdAircraftinfoDTO,@Param("sfnConditions")SelfDefined sql);
	public Page<CsmpBdAircraftinfoDTO> searchCsmpBdAircraftModelinfoByPage(
			@Param("bean")CsmpBdAircraftinfoDTO csmpBdAircraftinfoDTO,@Param("sfnConditions")SelfDefined sql);

    }
