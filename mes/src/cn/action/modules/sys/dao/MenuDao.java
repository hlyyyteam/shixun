package cn.action.modules.sys.dao;

import java.util.List;

import cn.action.common.persistence.CrudDao;
import cn.action.modules.sys.entity.Menu;

public interface MenuDao extends CrudDao<Menu> {
	//根据上级菜单的ids模糊查找菜单
	public List<Menu> findByParentIdsLike(Menu menu);
	//根据用户查找菜单
	public List<Menu> findByUserId(Menu menu);
	//更新菜单父级编号
	public int updateParentIds(Menu menu);
	//更新菜单排序号
	public int updateSort(Menu menu);
}
