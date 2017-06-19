package avicit.csmp.basicData.csmpbdcompanyinfo.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.context.annotation.Bean;

import avicit.csmp.basicData.csmpbdcompanyinfo.dto.CsmpBdCompanyinfoDTO;
import avicit.platform6.core.mybatis.MyBatisRepository;
import avicit.platform6.core.mybatis.pagehelper.Page;
import avicit.platform6.core.sfn.intercept.SelfDefined;

/**
 * @classname: CsmpBdCompanyinfoDao
 * @description: 定义  单位信息表 持久层 接口
 * 通过@MapperScannerConfigurer扫描目录中的所有接口, 动态在Spring Context中生成实现.
 * 方法名称必须与Mapper.xml中保持一致.
 * @author:  AVICIT DEV
 */
@MyBatisRepository
public interface CsmpBdCompanyinfoDao {
    
    /**
     * @author AVICIT DEV
     * @description: 分页查询 单位信息表
     * @date 2014-12-26 11:13:20
     * @param searchParams
     * @return
     */
    public Page<CsmpBdCompanyinfoDTO> searchCsmpBdCompanyinfoByPage(@Param("bean") CsmpBdCompanyinfoDTO csmpBdCompanyinfoDTO,@Param("sfnConditions")SelfDefined sql) ;
    
  /**
     * @author AVICIT DEV
     * @description: 张佳华查询关系表
     * @date 2014-12-26 11:13:20
     * @param searchParams
     * @return
     */
    public Page<CsmpBdCompanyinfoDTO>  searchCompAndStruByPage(@Param("bean")CsmpBdCompanyinfoDTO csmpBdCompanyinfoDTO);
    
    /**
     * @author AVICIT DEV
     * @description:点击根节点时显示关系表中和公司关联为空的数据
     * @date 2014-12-26 11:13:20
     * @param searchParams
     * @return
     */
    public Page<CsmpBdCompanyinfoDTO>  searchCsmpBdCompanyinfoParentByPage(@Param("bean")CsmpBdCompanyinfoDTO csmpBdCompanyinfoDTO);
   
    /**
     * @author AVICIT DEV
     * @description:根节点加载的信息
     * @date 2014-12-26 11:13:20
     * @param searchParams
     * @return
     */
    
    public Page<CsmpBdCompanyinfoDTO>  searchRootCominfos(@Param("bean")CsmpBdCompanyinfoDTO csmpBdCompanyinfoDTO);

    
    /**
     * @author AVICIT DEV
     * @description:查询对象 单位信息表
     * @date 2014-12-26 11:13:20
     * @param searchParams
     * @return
     */
    public List<CsmpBdCompanyinfoDTO> searchCsmpBdCompanyinfo(CsmpBdCompanyinfoDTO csmpBdCompanyinfoDTO);

    /**
     * @author AVICIT DEV
     * @description:查询对象 单位信息表
     * @date 2014-12-26 11:13:20
     * @param id
     * @return
     */
    public CsmpBdCompanyinfoDTO findCsmpBdCompanyinfoById(String id);
    
         /**
     * @author AVICIT DEV
     * @description: 新增对象 单位信息表
     * @date 2014-12-26 11:13:20
     * @param paramMap
     * @return
     */
    public int insertCsmpBdCompanyinfo(CsmpBdCompanyinfoDTO csmpBdCompanyinfoDTO);
    
    /**
     * @author AVICIT DEV
     * @description: 更新对象 单位信息表
     * @date 2014-12-26 11:13:20
     * @param paramMap
     */
    public int updateCsmpBdCompanyinfoSensitive(CsmpBdCompanyinfoDTO csmpBdCompanyinfoDTO);
    
    /**
     * @author AVICIT DEV
     * @description: 更新对象 单位信息表
     * @date 2014-12-26 11:13:20
     * @param paramMap
     */
    public int updateCsmpBdCompanyinfoAll(CsmpBdCompanyinfoDTO csmpBdCompanyinfoDTO);
    
    
    /**
     * @author AVICIT DEV
     * @description: 按主键删除 单位信息表
     * @date 2014-12-26 11:13:20
     * @param ids
     * @return
     */ 
    public int deleteCsmpBdCompanyinfoById(String id);
    
    /**
     * 获取该对象的列表()
     * @return
     */
    public List<CsmpBdCompanyinfoDTO> getTree();
    
    /**
     * 根据一个树的客户类型来查询公司信息列表的名字（此处查的是一个完整的对象）
     * @param treeID
     * @return
     */
    public List<CsmpBdCompanyinfoDTO> selectByTreeId(String catalogType);
    
    
    public List<CsmpBdCompanyinfoDTO> selectCsmpBdCompanyinfoByToComId(String catalogType);
    
    
    
    /**
     * 根据联系人ID查询单位信息
     * @return
     */
    public List<CsmpBdCompanyinfoDTO>  searchInfoByContacts(String id);
    
    public Page<CsmpBdCompanyinfoDTO> searchCsmpEsNoticeinfoEffectiveCountNameByPage(
    		String bulletinId);

    }

