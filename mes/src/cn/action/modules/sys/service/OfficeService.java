package cn.action.modules.sys.service;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.action.common.service.TreeService;
import cn.action.modules.sys.dao.OfficeDao;
import cn.action.modules.sys.entity.Office;

@Service
@Transactional(readOnly = true)
public class OfficeService extends TreeService<OfficeDao, Office> {

}