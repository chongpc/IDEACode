import com.baizhi.Application;
import com.baizhi.dao.EmpsDao;
import com.baizhi.dao.ManagerDao;
import com.baizhi.entity.Emps;
import com.baizhi.entity.Manager;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.List;

@RunWith(SpringRunner.class)
@SpringBootTest(classes = Application.class)
public class TestDao {
    @Autowired
    private ManagerDao managerDao;
    @Autowired
    private EmpsDao empsDao;
    @Test
    public void findByUsername(){
        Manager mm = managerDao.findByUsername("111");
        System.out.println(mm);
    }

    @Test
    public void findAllEmps(){
        for (int i = 0; i < 10; i++) {
            Emps e = empsDao.findById("12");
            System.out.println(e);
        }

    }
    /* List<Emps> allEmps = empsDao.findAllEmps();
        for (Emps allEmp : allEmps) {
            System.out.println(allEmp);
        }*/

}
