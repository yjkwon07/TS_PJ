package ts;

import java.util.List;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.annotation.PropertySource;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.duojj.dao.LectureDAO;
import com.duojj.vo.LectureVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/**/*.xml" })
@PropertySource({ "file:src/main/webapp/WEB-INF/config/jdbc/jdbc.properties" })
public class LectureInsertTest {

    @Inject
    private LectureDAO dao;
 
    private static Logger logger = LoggerFactory.getLogger(LectureInsertTest.class);
 
    
    @Test
    public void postLectureInsert() throws Exception{
    	LectureVO vo = new LectureVO();
    	vo.setClass_content("hi");
    	vo.setClass_endday(null);
    	vo.setClass_MON("19:30/20:00");
    	dao.postLectureRegister(vo);
    }


}
