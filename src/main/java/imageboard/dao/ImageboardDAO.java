package imageboard.dao;

import java.util.List;
import java.util.Map;

import imageboard.bean.ImageboardDTO;

public interface ImageboardDAO {

	public void imageboardWrite(ImageboardDTO imageboardDTO);

	public List<ImageboardDTO> getImageboardList(Map<String, Integer> map);

	public ImageboardDTO getImageBoardView(String seq);

	public void imageboardDelete(Map<String, String[]> map);

	public int getImageboardTotalA();

}
