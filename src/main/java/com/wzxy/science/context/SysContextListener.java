package com.wzxy.science.context;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import java.util.Timer;

public class SysContextListener  implements ServletContextListener {
    private Timer timer = null;
	/*@Autowired
	private TbReadmeService tbReadmeService;//健康自述接口
	private List<TbReadme> tbReadmeList;//健康自述列表
*/


    @Override
    public void contextDestroyed(ServletContextEvent arg0) {


    }

    @Override
    public void contextInitialized(ServletContextEvent arg0) {

    }

}
