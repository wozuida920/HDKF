package avicit.hdkf.esnotice.hdkfesnoticeinfo.dao;

import java.util.List;
import java.util.Map;
import org.apache.ibatis.annotations.Param;
import avicit.platform6.core.sfn.intercept.SelfDefined;
import avicit.platform6.core.mybatis.MyBatisRepository;
import avicit.platform6.core.mybatis.pagehelper.Page;
import avicit.hdkf.esnotice.hdkfesnoticeinfo.dto.HdkfEsNoticeinfoDTO;
/**
 * @classname: HdkfEsNoticeinfoDao
 * @description: 定义  技术通报详细信息表 持久层 接口
 * 通过@MapperScannerConfigurer扫描目录中的所有接口, 动态在Spring Context中生成实现.
 * 方法名称必须与Mapper.xml中保持一致.
 * @author:  AVICIT DEV
 */
@MyBatisRepository
public interface HdkfEsNoticeinfoDao {
	
	/**
	 * @author AVICIT DEV
	 * @description: 分页查询 技术通报详细信息表
	 * @date 2014-12-26 11:13:20
	 * @param searchParams
	 * @return
	 */
	public Page<HdkfEsNoticeinfoDTO> searchHdkfEsNoticeinfoAscByPage(@Param(value="bean") HdkfEsNoticeinfoDTO hdkfEsNoticeinfoDTO,@Param("sfnConditions")SelfDefined sql) ;
	
	/**
	 * @author AVICIT DEV
	 * @description: 分页查询 技术通报详细信息表
	 * @date 2014-12-26 11:13:20
	 * @param searchParams
	 * @return
	 */
	public Page<HdkfEsNoticeinfoDTO> searchHdkfEsNoticeinfoByPage(@Param(value="bean") HdkfEsNoticeinfoDTO hdkfEsNoticeinfoDTO,@Param("sfnConditions")SelfDefined sql) ;
	
	/**
	 * @author AVICIT DEV
	 * @description:查询对象 技术通报详细信息表
	 * @date 2014-12-26 11:13:20
	 * @param id
	 * @return:HdkfEsNoticeinfoDTO
	 */
	public HdkfEsNoticeinfoDTO findHdkfEsNoticeinfoById(String id);
	
	public HdkfEsNoticeinfoDTO findHdkfEsNoticeinfoByBulletinNo(String bulletinNo);
	
	 	/**
	 * @author AVICIT DEV
	 * @description: 新增对象 技术通报详细信息表
	 * @date 2014-12-26 11:13:20
	 * @param paramMap
	 * @return
	 */
	public int insertHdkfEsNoticeinfo(HdkfEsNoticeinfoDTO hdkfEsNoticeinfoDTO);
	
	/**
	 * @author AVICIT DEV
	 * @description: 更新对象 技术通报详细信息表
	 * @date 2014-12-26 11:13:20
	 * @param paramMap
	 */
	public int updateHdkfEsNoticeinfoSensitive(HdkfEsNoticeinfoDTO hdkfEsNoticeinfoDTO);
	
	/**
	 * @author AVICIT DEV
	 * @description: 更新对象 技术通报详细信息表
	 * @date 2014-12-26 11:13:20
	 * @param paramMap
	 */
	public int updateHdkfEsNoticeinfoAll(HdkfEsNoticeinfoDTO hdkfEsNoticeinfoDTO);
	
	
	/**
	 * @author AVICIT DEV
	 * @description: 按主键删除 技术通报详细信息表
	 * @date 2014-12-26 11:13:20
	 * @param ids
	 * @return
	 */ 
	public int deleteHdkfEsNoticeinfoById(String id);
	 /**
     * 传入的主表Id根据批架次分组统计查询子表数据
     * 2016-6-28
     * @param id
     * @return
     * TODO
     * Administrator
     */
	public String findCsmpEsNoticeinfoDetailByIdCountBatchNo(String id);


	 /**
     * 传入的主表Id根据用户分组统计查询子表数据
     * 2016-6-28
     * @param id
     * @return
     * TODO
     * Administrator
     */
	public String findCsmpEsNoticeinfoDetailByIdCountName(String id);


	/**
	 * 技术通报实施页面用户执行数量统计
	 * 2016-7-7
	 * @param id
	 * @return
	 * Administrator
	 */
	public String findCsmpEsNoticeinfoDetailByIdCountNameYesNo(String id);
	
	
	/**
	 * @author AVICIT DEV
	 * @description:查询对象 技术通报详细信息表
	 * @date 2014-12-26 11:13:20
	 * @param id
	 * @return
	 */
	public List<HdkfEsNoticeinfoDTO> findHdkfEsNoticeinfoTrackReportById(String id);
	

	}
