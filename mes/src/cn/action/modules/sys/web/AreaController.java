package cn.action.modules.sys.web;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.common.collect.Lists;
import com.google.common.collect.Maps;

import cn.action.common.utils.StringUtils;
import cn.action.common.utils.UserUtils;
import cn.action.common.web.BaseController;
import cn.action.modules.sys.entity.Area;
import cn.action.modules.sys.service.AreaService;

@Controller
@RequestMapping(value = "/sys/area")
public class AreaController extends BaseController {

	@Autowired
	private AreaService areaService;
	
	@ModelAttribute
	public Area get(@RequestParam(required=false) String id) {
		if (StringUtils.isNotBlank(id)){
			return areaService.get(id);
		}else{
			return new Area();
		}
	}

	@RequestMapping(value = {"list", ""})
	public String list(Area area, Model model) {
		model.addAttribute("list", areaService.findList(new Area()));
		return "modules/sys/areaList";
	}


	@RequestMapping(value = "form")
	public String form(Area area, Model model) {
		if (area.getParent()==null||area.getParent().getId()==null){
			area.setParent(UserUtils.getUser().getOffice().getArea());
		}
		area.setParent(areaService.get(area.getParent().getId()));
		model.addAttribute("area", area);
		return "modules/sys/areaForm";
	}
	

	@RequestMapping(value = "save")
	public String save(Area area, Model model, RedirectAttributes redirectAttributes) {
		areaService.save(area);
		addMessage(redirectAttributes, "保存区域'" + area.getName() + "'成功");
		return "redirect:" + adminPath + "/sys/area/";
	}
	

	@RequestMapping(value = "delete")
	public String delete(Area area, RedirectAttributes redirectAttributes) {
		areaService.delete(area);
		addMessage(redirectAttributes, "删除区域成功");
		return "redirect:" + adminPath + "/sys/area/";
	}


	@ResponseBody
	@RequestMapping(value = "treeData")
	public List<Map<String, Object>> treeData(@RequestParam(required=false) String extId, HttpServletResponse response) {
		List<Map<String, Object>> mapList = Lists.newArrayList();
		List<Area> list = areaService.findList(new Area());
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
}
