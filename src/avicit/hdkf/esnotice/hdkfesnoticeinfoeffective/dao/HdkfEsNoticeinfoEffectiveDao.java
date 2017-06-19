package avicit.hdkf.esnotice.hdkfesnoticeinfoeffective.dao;

import avicit.platform6.core.mybatis.MyBatisRepository;

import org.apache.ibatis.annotations.Param;
import avicit.platform6.core.sfn.intercept.SelfDefined;
import avicit.platform6.core.mybatis.pagehelper.Page;
import avicit.csmp.basicData.csmpbdcompanyinfo.dto.CsmpBdCompanyinfoDTO;
import avicit.hdkf.esnotice.hdkfesnoticeinfoeffective.dto.HdkfEsNoticeinfoEffectiveDTO;
/**
 * @classname:  HdkfEsNoticeinfoEffectiveDao
 * @description: 定义  技术通报涉及批架次信息表 持久层 接口
 * 通过@MapperScannerConfigurer扫描目录中的所有接口, 动态在Spring Context中生成实现.
 * 方法名称必须与Mapper.xml中保持一致.
 * @author:   AVICIT DEV
 */
@MyBatisRepository
public interface HdkfEsNoticeinfoEffectiveDao {
    
    /**
     * @author AVICIT DEV
     * @description: 分页查询技术通报涉及批架次信息表
     * @date 2014-12-26 11:13:20
     * @param searchParams
     * @return
     */
    public Page<HdkfEsNoticeinfoEffectiveDTO> searchHdkfEsNoticeinfoEffectiveByPage(@Param("bean")HdkfEsNoticeinfoEffectiveDTO hdkfEsNoticeinfoEffectiveDTO,@Param("sfnConditions")SelfDefined sql) ;
    
  
    /**
     * @author AVICIT DEV
     * @description:查询对象 技术通报涉及批架次信息表
     * @date 2014-12-26 11:13:20
     * @param id
     * @return
     */
    public HdkfEsNoticeinfoEffectiveDTO findHdkfEsNoticeinfoEffectiveById(String id);
    
         /**
     * @author AVICIT DEV
     * @description: 新增对象技术通报涉及批架次信息表
     * @date 2014-12-26 11:13:20
     * @param paramMap
     * @return
     */
    public int insertHdkfEsNoticeinfoEffective(HdkfEsNoticeinfoEffectiveDTO hdkfEsNoticeinfoEffectiveDTO);
    
    /**
     * @author AVICIT DEV
     * @description: 更新对象技术通报涉及批架次信息表
     * @date 2014-12-26 11:13:20
     * @param paramMap
     */
    public int updateHdkfEsNoticeinfoEffectiveSensitive(HdkfEsNoticeinfoEffectiveDTO hdkfEsNoticeinfoEffectiveDTO);
    
    /**
     * @author AVICIT DEV
     * @description: 更新对象技术通报涉及批架次信息表
     * @date 2014-12-26 11:13:20
     * @param paramMap
     */
    public int updateHdkfEsNoticeinfoEffectiveAll(HdkfEsNoticeinfoEffectiveDTO hdkfEsNoticeinfoEffectiveDTO);
    
    
    /**
     * @author AVICIT DEV
     * @description: 按主键删除技术通报涉及批架次信息表
     * @date 2014-12-26 11:13:20
     * @param ids
     * @return
     */ 
    public int deleteHdkfEsNoticeinfoEffectiveById(String id);
    
    
    
    public int resetHdkfEsNoticeinfoEffectiveById(String id);




	public Page<HdkfEsNoticeinfoEffectiveDTO> searchCsmpEsNoticeinfoEffectiveCountbatchNoByPage(
			String bulletinId);


	 public Page<HdkfEsNoticeinfoEffectiveDTO> searchHdkfEsNoticeinfoEffective1ByPage(@Param("bean")HdkfEsNoticeinfoEffectiveDTO hdkfEsNoticeinfoEffectiveDTO,@Param("sfnConditions")SelfDefined sql) ;
	    
    
    
    }
