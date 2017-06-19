package avicit.hdkf.esnotice.hdkfesreporttrack.dao;

import java.util.List;
import java.util.Map;

import avicit.platform6.core.mybatis.MyBatisRepository;
import org.apache.ibatis.annotations.Param;
import avicit.platform6.core.sfn.intercept.SelfDefined;
import avicit.platform6.core.mybatis.pagehelper.Page;
import avicit.hdkf.esnotice.hdkfesreporttrack.dto.HdkfEsReportTrackDTO;
/**
 * @classname: HdkfEsReportTrackDao
 * @description: 定义  上报跟踪表 持久层 接口
 * 通过@MapperScannerConfigurer扫描目录中的所有接口, 动态在Spring Context中生成实现.
 * 方法名称必须与Mapper.xml中保持一致.
 * @author:  AVICIT DEV
 */
@MyBatisRepository
public interface HdkfEsReportTrackDao {
    
    /**
     * @author AVICIT DEV
     * @description: 分页查询 上报跟踪表
     * @date 2014-12-26 11:13:20
     * @param searchParams
     * @return
     */
    public Page<HdkfEsReportTrackDTO> searchHdkfEsReportTrackByPage(@Param("bean")HdkfEsReportTrackDTO hdkfEsReportTrackDTO,@Param("sfnConditions")SelfDefined sql) ;
    
    /**
     * @author AVICIT DEV
     * @description:查询对象 上报跟踪表
     * @date 2014-12-26 11:13:20
     * @param searchParams
     * @return
     */
    public List<HdkfEsReportTrackDTO> searchHdkfEsReportTrack(HdkfEsReportTrackDTO hdkfEsReportTrackDTO);

    /**
     * @author AVICIT DEV
     * @description:查询对象 上报跟踪表
     * @date 2014-12-26 11:13:20
     * @param id
     * @return
     */
    public HdkfEsReportTrackDTO findHdkfEsReportTrackById(String id);
    
        /**
     * @author AVICIT DEV
     * @description: 新增对象 上报跟踪表
     * @date 2014-12-26 11:13:20
     * @param paramMap
     * @return
     */
    public int insertHdkfEsReportTrack(HdkfEsReportTrackDTO hdkfEsReportTrackDTO);
    
    /**
     * @author AVICIT DEV
     * @description: 更新对象 上报跟踪表
     * @date 2014-12-26 11:13:20
     * @param paramMap
     */
    public int updateHdkfEsReportTrackSensitive(HdkfEsReportTrackDTO hdkfEsReportTrackDTO);
    
    /**
     * @author AVICIT DEV
     * @description: 更新对象 上报跟踪表
     * @date 2014-12-26 11:13:20
     * @param paramMap
     */
    public int updateHdkfEsReportTrackAll(HdkfEsReportTrackDTO hdkfEsReportTrackDTO);
    
    
    /**
     * @author AVICIT DEV
     * @description: 按主键删除 上报跟踪表
     * @date 2014-12-26 11:13:20
     * @param ids
     * @return
     */ 
    public int deleteHdkfEsReportTrackById(String id);
    }
