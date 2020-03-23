package imageboard.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import imageboard.bean.ImageboardDTO;

@Repository
@Transactional
public class ImageboardDAOMybatis implements ImageboardDAO {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public void imageboardWrite(ImageboardDTO imageboardDTO) {
		sqlSession.insert("imageboardSQL.imageboardWrite",imageboardDTO);
		
	}

	@Override
	public List<ImageboardDTO> getImageboardList(Map<String, Integer> map) {
		System.out.println(map.get("startNum"));
		return sqlSession.selectList("imageboardSQL.getImageboardList", map);
		
	}
	@Override
	public ImageboardDTO getImageBoardView(String seq) {
		System.out.println(seq);
		return sqlSession.selectOne("imageboardSQL.getImageBoardView", Integer.parseInt(seq));
	}

	@Override
	public void imageboardDelete(Map<String, String[]> map) {
		sqlSession.delete("imageboardSQL.imageboardDelete", map);
		
	}

	@Override
	public int getImageboardTotalA() {
		return sqlSession.selectOne("imageboardSQL.getImageboardTotalA");
	}
}
