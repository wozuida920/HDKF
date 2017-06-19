package avicit.csmp.basicData.csmpbdsparepart.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import avicit.csmp.basicData.csmpbdsparepart.dto.CsmpBdSparepartDTO;
import avicit.platform6.core.mybatis.MyBatisRepository;
import avicit.platform6.core.mybatis.pagehelper.Page;
import avicit.platform6.core.sfn.intercept.SelfDefined;

/**
 * @classname: CsmpBdSparepartDao
 * @description: 定义  备件信息表 持久层 接口
 * 通过@MapperScannerConfigurer扫描目录中的所有接口, 动态在Spring Context中生成实现.
 * 方法名称必须与Mapper.xml中保持一致.
 * @author:  AVICIT DEV
 */
/**
 * @author Administrator
 * 
 */
@MyBatisRepository
public interface CsmpBdSparepartDao {

	/**
	 * @author AVICIT DEV
	 * @description: 分页查询 备件信息表
	 * @date 2014-12-26 11:13:20
	 * @param searchParams
	 * @return
	 */
	public Page<CsmpBdSparepartDTO> searchCsmpBdSparepartByPage(@Param("bean") CsmpBdSparepartDTO csmpBdSparepartDTO, @Param("sfnConditions") SelfDefined sql);

	/**
	 * @author AVICIT DEV
	 * @description:查询对象 备件信息表
	 * @date 2014-12-26 11:13:20
	 * @param searchParams
	 * @return
	 */
	public List<CsmpBdSparepartDTO> searchCsmpBdSparepart(CsmpBdSparepartDTO csmpBdSparepartDTO);

	/**
	 * @author AVICIT DEV
	 * @description:查询对象 备件信息表
	 * @date 2014-12-26 11:13:20
	 * @param id
	 * @return
	 */
	public CsmpBdSparepartDTO findCsmpBdSparepartById(String id);

	/**
	 * @author AVICIT DEV
	 * @description: 新增对象 备件信息表
	 * @date 2014-12-26 11:13:20
	 * @param paramMap
	 * @return
	 */
	public int insertCsmpBdSparepart(CsmpBdSparepartDTO csmpBdSparepartDTO);

	/**
	 * @author AVICIT DEV
	 * @description: 更新对象 备件信息表
	 * @date 2014-12-26 11:13:20
	 * @param paramMap
	 */
	public int updateCsmpBdSparepartSensitive(CsmpBdSparepartDTO csmpBdSparepartDTO);

	/**
	 * @author AVICIT DEV
	 * @description: 更新对象 备件信息表
	 * @date 2014-12-26 11:13:20
	 * @param paramMap
	 */
	public int updateCsmpBdSparepartAll(CsmpBdSparepartDTO csmpBdSparepartDTO);

	/**
	 * @author AVICIT DEV
	 * @description: 按主键删除 备件信息表
	 * @date 2014-12-26 11:13:20
	 * @param ids
	 * @return
	 */
	public int deleteCsmpBdSparepartById(String id);

	/**
	 * 根据某个字段来查询一个对象（用在了验证中）
	 * 
	 * @param csmpBdSparepartDTO
	 * @return
	 */
	public List<CsmpBdSparepartDTO> seleCsmpBdSparepart(@Param("bean") CsmpBdSparepartDTO csmpBdSparepartDTO);

	/**
	 * 备件购物查询
	 */
	public Page<CsmpBdSparepartDTO> searchCsmpBdSparepartByPage4shopCart(@Param("bean") CsmpBdSparepartDTO csmpBdSparepartDTO);

	/**
	 * 查询该表中是否含有该图号名字
	 * @param drawingNo
	 * @return
	 */
	public int  checkedByNumber(String drawingNo);
}
