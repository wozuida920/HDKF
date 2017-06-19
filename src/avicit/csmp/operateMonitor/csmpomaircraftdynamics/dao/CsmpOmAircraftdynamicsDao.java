package avicit.csmp.operateMonitor.csmpomaircraftdynamics.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import avicit.csmp.basicData.csmpbdaircraftinfo.dto.CsmpBdAircraftinfoDTO;
import avicit.csmp.operateMonitor.csmpomaircraftdynamics.dto.CsmpOMDTO;
import avicit.csmp.operateMonitor.csmpomaircraftdynamics.dto.CsmpOmAircraftdynamicsDTO;
import avicit.platform6.core.mybatis.MyBatisRepository;
import avicit.platform6.core.mybatis.pagehelper.Page;
import avicit.platform6.core.sfn.intercept.SelfDefined;
/**
 * @classname: CsmpOmAircraftdynamicsDao
 * @description: 定义  飞机动态维护表 持久层 接口
 * 通过@MapperScannerConfigurer扫描目录中的所有接口, 动态在Spring Context中生成实现.
 * 方法名称必须与Mapper.xml中保持一致.
 * @author:  AVICIT DEV
 */
@MyBatisRepository
public interface CsmpOmAircraftdynamicsDao {
    
    /**
     * @author AVICIT DEV
     * @description: 分页查询 飞机动态维护表
     * @date 2014-12-26 11:13:20
     * @param searchParams
     * @return
     */
    public Page<CsmpOmAircraftdynamicsDTO> searchCsmpOmAircraftdynamicsByPage(@Param("bean")CsmpOmAircraftdynamicsDTO csmpOmAircraftdynamicsDTO,@Param("sfnConditions")SelfDefined sql) ;
    
    /**
     * @author AVICIT DEV
     * @description:查询对象 飞机动态维护表
     * @date 2014-12-26 11:13:20
     * @param searchParams
     * @return
     */
    public List<CsmpOmAircraftdynamicsDTO> searchCsmpOmAircraftdynamics(CsmpOmAircraftdynamicsDTO csmpOmAircraftdynamicsDTO);

    /**
     * @author AVICIT DEV
     * @description:查询对象 飞机动态维护表
     * @date 2014-12-26 11:13:20
     * @param id
     * @return
     */
    public CsmpOmAircraftdynamicsDTO findCsmpOmAircraftdynamicsById(String id);
    
        /**
     * @author AVICIT DEV
     * @description: 新增对象 飞机动态维护表
     * @date 2014-12-26 11:13:20
     * @param paramMap
     * @return
     */
    public int insertCsmpOmAircraftdynamics(CsmpOmAircraftdynamicsDTO csmpOmAircraftdynamicsDTO);
    
    /**
     * @author AVICIT DEV
     * @description: 更新对象 飞机动态维护表
     * @date 2014-12-26 11:13:20
     * @param paramMap
     */
    public int updateCsmpOmAircraftdynamicsSensitive(CsmpOmAircraftdynamicsDTO csmpOmAircraftdynamicsDTO);
    
    /**
     * @author AVICIT DEV
     * @description: 更新对象 飞机动态维护表
     * @date 2014-12-26 11:13:20
     * @param paramMap
     */
    public int updateCsmpOmAircraftdynamicsAll(CsmpOmAircraftdynamicsDTO csmpOmAircraftdynamicsDTO);
    
    
    /**
     * @author AVICIT DEV
     * @description: 按主键删除 飞机动态维护表
     * @date 2014-12-26 11:13:20
     * @param ids
     * @return
     */ 
    public int deleteCsmpOmAircraftdynamicsById(String id);
    
    
    /**
     * 根据公司来查询所有的飞机和故障故障
     */
    public Page<CsmpBdAircraftinfoDTO>    selectByAircraft(@Param("bean1")CsmpBdAircraftinfoDTO csmpBdAircraftinfoDTO,@Param("sfnConditions")SelfDefined sql);
    
    /**
     * 按照客户来查询所有的飞机率
     */
    public List<CsmpOMDTO> searchAllCustomerAir();
    
    
    /**
     * 按照批架次来查询所有的正常飞机率
     * @param airStrat
     * @return
     */
    public List<CsmpOMDTO> searchAllByNUM();
    
    
    /**
     * 按照机型来查询所有的正常的飞机
     * @param airStrat
     * @return
     */
    public List<CsmpOMDTO>  searchAllByModel();

    
    
    }
