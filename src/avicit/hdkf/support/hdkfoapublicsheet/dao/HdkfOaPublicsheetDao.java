package avicit.hdkf.support.hdkfoapublicsheet.dao;

import java.util.List;
import java.util.Map;

import avicit.platform6.core.mybatis.MyBatisRepository;
import avicit.platform6.core.mybatis.pagehelper.Page;
import org.apache.ibatis.annotations.Param;
import avicit.platform6.core.sfn.intercept.SelfDefined;
import avicit.hdkf.support.hdkfoapublicsheet.dto.HdkfOaPublicsheetDTO;
/**
 * @classname: HdkfOaPublicsheetDao
 * @description: 定义  公用笺信息表持久层 接口
 * 通过@MapperScannerConfigurer扫描目录中的所有接口, 动态在Spring Context中生成实现.
 * 方法名称必须与Mapper.xml中保持一致.
 * @author:   AVICIT DEV
 */
@MyBatisRepository
public interface HdkfOaPublicsheetDao {
    
    /**
     * @author AVICIT DEV
     * @description: 分页查询 公用笺信息表
     * @param searchParams
     * @return
     */
    public Page<HdkfOaPublicsheetDTO> searchHdkfOaPublicsheetByPage(@Param("bean")HdkfOaPublicsheetDTO hdkfOaPublicsheetDTO,@Param("sfnConditions")SelfDefined sql) ;
    
    /**
     * @author  AVICIT DEV
     * @description:查询对象公用笺信息表
     * @date 2014-12-26 11:13:20
     * @param searchParams
     * @return
     */
    public List<HdkfOaPublicsheetDTO> searchHdkfOaPublicsheet(HdkfOaPublicsheetDTO hdkfOaPublicsheetDTO);

    /**
     * @author AVICIT DEV
     * @description:查询对象 公用笺信息表
     * @date 2014-12-26 11:13:20
     * @param id
     * @return
     */
    public HdkfOaPublicsheetDTO findHdkfOaPublicsheetById(String id);
    
         /**
     * @author AVICIT DEV
     * @description: 新增对象 公用笺信息表
     * @date 2014-12-26 11:13:20
     * @param paramMap
     * @return
     */
    public int insertHdkfOaPublicsheet(HdkfOaPublicsheetDTO hdkfOaPublicsheetDTO);
    
    /**
     * @author AVICIT DEV
     * @description: 更新对象 公用笺信息表
     * @date 2014-12-26 11:13:20
     * @param paramMap
     */
    public int updateHdkfOaPublicsheetSensitive(HdkfOaPublicsheetDTO hdkfOaPublicsheetDTO);
    
    /**
     * @author AVICIT DEV
     * @description: 更新对象 公用笺信息表
     * @date 2014-12-26 11:13:20
     * @param paramMap
     */
    public int updateHdkfOaPublicsheetAll(HdkfOaPublicsheetDTO hdkfOaPublicsheetDTO);
    
    
    /**
     * @author AVICIT DEV
     * @description: 按主键删除 公用笺信息表
     * @date 2014-12-26 11:13:20
     * @param ids
     * @return
     */ 
    public int deleteHdkfOaPublicsheetById(String id);
    }
