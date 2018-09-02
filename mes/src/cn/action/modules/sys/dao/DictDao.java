package cn.action.modules.sys.dao;

import java.util.List;

import cn.action.common.persistence.CrudDao;
import cn.action.modules.sys.entity.Dict;
/**
 * 字典DAO接口
 * @author Administrator
 *
 */
public interface DictDao extends CrudDao<Dict> {
	
	/**
	 * 查找字典类型列表
	 * @param dict
	 * @return
	 */
	public List<String> findTypeList(Dict dict);
}

