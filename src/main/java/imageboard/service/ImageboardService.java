package imageboard.service;

import java.util.List;

import imageboard.bean.ImageboardDTO;
import imageboard.bean.ImageboardPaging;

public interface ImageboardService {

	public void imageboardWrite(ImageboardDTO imageboardDTO);

	public List<ImageboardDTO> getImageBoardList(String pg);

	public ImageboardDTO getImageBoardView(String seq);

	public void imageboardDelete(String[] check);

	public ImageboardPaging imageboardPaging(String pg);

}
