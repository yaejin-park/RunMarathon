package data.dto;

public class MenuDTO {
	private String menu_idx;
	private String menu_name;
	private String menu_url;
	private String menu_depth;
	private String parent_idx;
	
	public String getMenu_idx() {
		return menu_idx;
	}
	public void setMenu_idx(String menu_idx) {
		this.menu_idx = menu_idx;
	}
	public String getMenu_name() {
		return menu_name;
	}
	public void setMenu_name(String menu_name) {
		this.menu_name = menu_name;
	}
	public String getMenu_url() {
		return menu_url;
	}
	public void setMenu_url(String menu_url) {
		this.menu_url = menu_url;
	}
	public String getMenu_depth() {
		return menu_depth;
	}
	public void setMenu_depth(String menu_depth) {
		this.menu_depth = menu_depth;
	}
	public String getParent_idx() {
		return parent_idx;
	}
	public void setParent_idx(String parent_idx) {
		this.parent_idx = parent_idx;
	}
}
