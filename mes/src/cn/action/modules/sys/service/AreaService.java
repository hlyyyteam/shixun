package cn.action.modules.sys.service;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.action.common.service.TreeService;
import cn.action.modules.sys.dao.AreaDao;
import cn.action.modules.sys.entity.Area;

@Service
@Transactional(readOnly = true)
public class AreaService extends TreeService<AreaDao, Area> {

}