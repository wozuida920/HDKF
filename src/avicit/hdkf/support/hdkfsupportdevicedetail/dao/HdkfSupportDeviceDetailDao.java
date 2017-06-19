package avicit.hdkf.support.hdkfsupportdevicedetail.dao;


import avicit.platform6.core.mybatis.MyBatisRepository;

import org.apache.ibatis.annotations.Param;
import avicit.platform6.core.sfn.intercept.SelfDefined;
import avicit.platform6.core.mybatis.pagehelper.Page;
import avicit.hdkf.support.hdkfsupportdevicedetail.dto.HdkfSupportDeviceDetailDTO;
/**
 * @classname:  HdkfSupportDeviceDetailDao
 * @description: 定义  HDKF_SUPPORT_DEVICE_DETAIL 持久层 接口
 * 通过@MapperScannerConfigurer扫描目录中的所有接口, 动态在Spring Context中生成实现.
 * 方法名称必须与Mapper.xml中保持一致.
 * @author:   AVICIT DEV
 */
@MyBatisRepository
public interface HdkfSupportDeviceDetailDao {
    
    /**
     * @author AVICIT DEV
     * @description: 分页查询HDKF_SUPPORT_DEVICE_DETAIL
     * @date 2014-12-26 11:13:20
     * @param searchParams
     * @return
     */
    public Page<HdkfSupportDeviceDetailDTO> searchHdkfSupportDeviceDetailByPage(@Param("bean")HdkfSupportDeviceDetailDTO hdkfSupportDeviceDetailDTO,@Param("sfnConditions")SelfDefined sql) ;
    
  
    /**
     * @author AVICIT DEV
     * @description:查询对象 HDKF_SUPPORT_DEVICE_DETAIL
     * @date 2014-12-26 11:13:20
     * @param id
     * @return
     */
    public HdkfSupportDeviceDetailDTO findHdkfSupportDeviceDetailById(String id);
    
         /**
     * @author AVICIT DEV
     * @description: 新增对象HDKF_SUPPORT_DEVICE_DETAIL
     * @date 2014-12-26 11:13:20
     * @param paramMap
     * @return
     */
    public int insertHdkfSupportDeviceDetail(HdkfSupportDeviceDetailDTO hdkfSupportDeviceDetailDTO);
    
    /**
     * @author AVICIT DEV
     * @description: 更新对象HDKF_SUPPORT_DEVICE_DETAIL
     * @date 2014-12-26 11:13:20
     * @param paramMap
     */
    public int updateHdkfSupportDeviceDetailSensitive(HdkfSupportDeviceDetailDTO hdkfSupportDeviceDetailDTO);
    
    /**
     * @author AVICIT DEV
     * @description: 更新对象HDKF_SUPPORT_DEVICE_DETAIL
     * @date 2014-12-26 11:13:20
     * @param paramMap
     */
    public int updateHdkfSupportDeviceDetailAll(HdkfSupportDeviceDetailDTO hdkfSupportDeviceDetailDTO);
    
    
    /**
     * @author AVICIT DEV
     * @description: 按主键删除HDKF_SUPPORT_DEVICE_DETAIL
     * @date 2014-12-26 11:13:20
     * @param ids
     * @return
     */ 
    public int deleteHdkfSupportDeviceDetailById(String id);
    }
