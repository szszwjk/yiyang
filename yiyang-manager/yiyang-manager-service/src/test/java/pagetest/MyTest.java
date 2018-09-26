package pagetest;


import com.yiyang.pojo.TUserInfo;
import com.yiyang.pojo.UserAuthorityKey;
import com.yiyang.service.impl.social.SelectAllUserServiceImpl;
import com.yiyang.service.impl.user.UserServiceImpl;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.util.List;

public class MyTest {
  @Test
  public void demo() {
//    ApplicationContext ac = new ClassPathXmlApplicationContext( "applicationContext.xml" );
//    SelectAllUserServiceImpl s = (SelectAllUserServiceImpl) ac.getBean( "SelectAllUserServiceImpl" );
//    List<TUserInfo> tUserInfos = s.SelectAllUser();
//    System.out.println(tUserInfos);
    System.out.println("hello world");
  }


}