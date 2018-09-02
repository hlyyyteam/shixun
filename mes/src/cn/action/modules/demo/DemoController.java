package cn.action.modules.demo;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.common.collect.Lists;
import com.google.common.collect.Maps;

import cn.action.common.utils.StringUtils;
import cn.action.common.web.BaseController;
import cn.action.modules.sys.entity.Area;

@Controller
@RequestMapping(value = "/demo")
public class DemoController extends BaseController {
	
	
	@RequestMapping("/msg")
	public String testMessage(Model model) {
		addMessage(model, "测试消息");
		System.out.println(adminPath);
		return "modules/demo/msgDemo";
	}
	
	
	
	@ResponseBody
	@RequestMapping(value = "treeData")
	public List<Map<String, Object>> treeData(@RequestParam(required=false) String extId, HttpServletResponse response) {
		List<Map<String, Object>> mapList = Lists.newArrayList();
		
		List<Area> list = initTreeData();
		for (int i=0; i<list.size(); i++){
			Area e = list.get(i);
			if (StringUtils.isBlank(extId) || (extId!=null && !extId.equals(e.getId()) && e.getParentIds().indexOf(","+extId+",")==-1)){
				Map<String, Object> map = Maps.newHashMap();
				map.put("id", e.getId());
				map.put("pId", e.getParentId());
				map.put("name", e.getName());
				mapList.add(map);
			}
		}
		return mapList;
	}

	private List<Area> initTreeData() {
		List<Area> list = Lists.newArrayList();
		Area china = new Area("001");
		china.setCode("001");
		china.setName("中国");
		list.add(china);
		Area shandong = new Area("0001");
		shandong.setCode("0001");
		shandong.setName("山东省");
		shandong.setParent(china);
		list.add(shandong);
		Area yantai = new Area("00001");
		yantai.setCode("00001");
		yantai.setName("烟台市");
		yantai.setParent(shandong);
		list.add(yantai);
		Area weihai = new Area("00002");
		weihai.setCode("00002");
		weihai.setName("威海市");
		weihai.setParent(yantai);
		list.add(weihai);
		return list;
	}
}
