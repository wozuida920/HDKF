package avicit.csmp.basicData.csmpbdcompanystructure.dao;

import java.util.List;
import java.util.Map;

import avicit.platform6.core.mybatis.MyBatisRepository;
import avicit.csmp.basicData.csmpbdcompanystructure.dto.CsmpBdCompanystructureDTO;

/**
 * @classname: CsmpBdCompanystructureDao
 * @description: 定义 单位信息结构表 持久层 接口 通过@MapperScannerConfigurer扫描目录中的所有接口,
 *               动态在Spring Context中生成实现. 方法名称必须与Mapper.xml中保持一致.
 * @author: AVICIT DEV
 */
@MyBatisRepository
public interface CsmpBdCompanystructureDao {

	/**
	 * @author AVICIT DEV
	 * @description: 按照父id查询数据
	 * @date 2014-12-26 11:13:20
	 * @param searchParams
	 * @return
	 */
	public List<Map<String, Object>> getCsmpBdCompanystructureByPid(String id);
	/**
	 * @author AVICIT DEV
	 * @description: 按照父id查询数据
	 * @date 2014-12-26 11:13:20
	 * @param searchParams
	 * @return
	 */
	public List<Map<String, Object>> getCsmpBdCompanystructureCanUseByPid(String id);

	/**
	 * @author AVICIT DEV
	 * @description:查询对象 单位信息结构表
	 * @date 2014-12-26 11:13:20
	 * @param text
	 * @return
	 */
	public List<Map<String, Object>> searchCsmpBdCompanystructure(String CatalogName);
	/**
	 * @author AVICIT DEV
	 * @description:查询对象 单位信息结构表
	 * @date 2014-12-26 11:13:20
	 * @param text
	 * @return
	 */
	public List<Map<String, Object>> searchCsmpBdCompanystructureValid(String CatalogName);


	/**
	 * @author AVICIT DEV
	 * @description:查询对象 单位信息结构表
	 * @date 2014-12-26 11:13:20
	 * @param id
	 * @return
	 */
	public CsmpBdCompanystructureDTO getNodeById(String id);

	/**
	 * @author AVICIT DEV
	 * @description: 按照父id查询子节点 单位信息结构表
	 * @date 2014-12-26 11:13:20
	 * @param paramMap
	 * @return
	 */
	public List<CsmpBdCompanystructureDTO> getNodeByPid(String Pid);
	
	/**
	 * @author AVICIT DEV
	 * @description: 按照父id查询子节点 单位信息结构表
	 * @date 2014-12-26 11:13:20
	 * @param paramMap
	 * @return
	 */
	public List<CsmpBdCompanystructureDTO> getAllNodeByPid(String Pid);

	/**
	 * @author AVICIT DEV
	 * @description: 更新对象 单位信息结构表
	 * @date 2014-12-26 11:13:20
	 * @param paramMap
	 */
	public int insertCsmpBdCompanystructure(CsmpBdCompanystructureDTO tree);

	/**
	 * @author AVICIT DEV
	 * @description: 更新对象 单位信息结构表
	 * @date 2014-12-26 11:13:20
	 * @param paramMap
	 */
	public int updateCsmpBdCompanystructureSensitive(CsmpBdCompanystructureDTO tree);

	/**
	 * @author AVICIT DEV
	 * @description: 按主键删除 单位信息结构表
	 * @date 2014-12-26 11:13:20
	 * @param ids
	 * @return
	 */
	public int deleteCsmpBdCompanystructureById(String id);
	
	
	public List<Map<String, Object>> getUnitList(String compID);
}
