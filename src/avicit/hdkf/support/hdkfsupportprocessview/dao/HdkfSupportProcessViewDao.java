package avicit.hdkf.support.hdkfsupportprocessview.dao;

import java.util.List;


import avicit.platform6.core.mybatis.MyBatisRepository;
import org.apache.ibatis.annotations.Param;
import avicit.platform6.core.sfn.intercept.SelfDefined;
import avicit.platform6.core.mybatis.pagehelper.Page;
import avicit.hdkf.support.hdkfsupportprocessview.dto.HdkfSupportProcessViewDTO;
/**
 * @classname: HdkfSupportProcessViewDao
 * @description: 定义  HDKF_SUPPORT_PROCESS_VIEW 持久层 接口
 * 通过@MapperScannerConfigurer扫描目录中的所有接口, 动态在Spring Context中生成实现.
 * 方法名称必须与Mapper.xml中保持一致.
 * @author:  AVICIT DEV
 */
@MyBatisRepository
public interface HdkfSupportProcessViewDao {
    
    /**
     * @author AVICIT DEV
     * @description: 分页查询 HDKF_SUPPORT_PROCESS_VIEW
     * @date 2014-12-26 11:13:20
     * @param searchParams
     * @return
     */
    public Page<HdkfSupportProcessViewDTO> searchHdkfSupportProcessViewByPage(@Param("bean")HdkfSupportProcessViewDTO hdkfSupportProcessViewDTO,@Param("sfnConditions")SelfDefined sql) ;
    
    //searchHdkfModelinfoDoingByPage
    public Page<HdkfSupportProcessViewDTO> searchHdkfModelinfoDoingByPage(@Param("bean")HdkfSupportProcessViewDTO hdkfSupportProcessViewDTO,@Param("sfnConditions")SelfDefined sql) ;

    /**
     * @author AVICIT DEV
     * @description:查询对象 HDKF_SUPPORT_PROCESS_VIEW
     * @date 2014-12-26 11:13:20
     * @param searchParams
     * @return
     */
    public List<HdkfSupportProcessViewDTO> searchHdkfSupportProcessView(HdkfSupportProcessViewDTO hdkfSupportProcessViewDTO);

    /**
     * @author AVICIT DEV
     * @description:查询对象 HDKF_SUPPORT_PROCESS_VIEW
     * @date 2014-12-26 11:13:20
     * @param id
     * @return
     */
    public HdkfSupportProcessViewDTO findHdkfSupportProcessViewById(String id);
    
        /**
     * @author AVICIT DEV
     * @description: 新增对象 HDKF_SUPPORT_PROCESS_VIEW
     * @date 2014-12-26 11:13:20
     * @param paramMap
     * @return
     */
    public int insertHdkfSupportProcessView(HdkfSupportProcessViewDTO hdkfSupportProcessViewDTO);
    
    /**
     * @author AVICIT DEV
     * @description: 更新对象 HDKF_SUPPORT_PROCESS_VIEW
     * @date 2014-12-26 11:13:20
     * @param paramMap
     */
    public int updateHdkfSupportProcessViewSensitive(HdkfSupportProcessViewDTO hdkfSupportProcessViewDTO);
    
    /**
     * @author AVICIT DEV
     * @description: 更新对象 HDKF_SUPPORT_PROCESS_VIEW
     * @date 2014-12-26 11:13:20
     * @param paramMap
     */
    public int updateHdkfSupportProcessViewAll(HdkfSupportProcessViewDTO hdkfSupportProcessViewDTO);
    
    
    /**
     * @author AVICIT DEV
     * @description: 按主键删除 HDKF_SUPPORT_PROCESS_VIEW
     * @date 2014-12-26 11:13:20
     * @param ids
     * @return
     */ 
    public int deleteHdkfSupportProcessViewById(String id);

	public List<HdkfSupportProcessViewDTO> seachModelinfoQuery(
			HdkfSupportProcessViewDTO hdkfSupportProcessViewDTO);
	
	
	public List<HdkfSupportProcessViewDTO> seachModelinfoallQuery(
			HdkfSupportProcessViewDTO hdkfSupportProcessViewDTO);

    }
